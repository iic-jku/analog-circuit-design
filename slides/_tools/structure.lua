-- -------------------------------------------------
-- Turn a lecture-notes chapter into reveal.js slides
-- -------------------------------------------------
-- SPDX-FileCopyrightText: 2026 Harald Pretl
-- Johannes Kepler University, Institute for Integrated Circuits
-- SPDX-License-Identifier: Apache-2.0
--
-- Runs at `pre-ast` (before Quarto's own filters), on the flat block list of
-- the chapter. Visual blocks (figures, display equations, callouts, lists,
-- tables) stay on slides; prose paragraphs become speaker notes of the next
-- slide. References to labels in other chapters link to the book.
--
-- Author controls inside the chapter files:
--   ::: {.content-visible when-format="revealjs"}   slide-only block
--   ::: {.content-hidden when-format="revealjs"}    book-only block
--   {.no-slide} on a div or figure, or in an equation's {#eq-... .no-slide}
--
-- Chapter-relative paths (`./xschem/x.svg`) are rebased for decks in slides/;
-- "Solution: ..." callouts are revealed step by step.

local MAX_EQS = 2        -- display equations per slide
local MAX_WORDS = 80     -- crowding warning threshold

local script_dir = pandoc.path.directory(PANDOC_SCRIPT_FILE)
local numbers = pandoc.json.decode(
  io.open(pandoc.path.join({ script_dir, "numbers.json" })):read("a"))

-- ---------- block classification ----------

local function when_format(el)
  return el.attributes and el.attributes["when-format"]
end

local function is_display_eq(b)
  if b.t ~= "Para" and b.t ~= "Plain" then return false end
  for _, il in ipairs(b.content) do
    if il.t == "Math" and il.mathtype == "DisplayMath" then return true end
  end
  return false
end

-- multi-line equations (split, aligned, underbraces) fill a slide alone
local function eq_weight(b)
  local w = 1
  b:walk({ Math = function(m)
    if m.text:match("\\\\") or m.text:match("\\begin{") then w = 2 end
  end })
  return w
end

local function has_figure(b)
  local found = false
  pandoc.Blocks({ b }):walk({ Figure = function() found = true end })
  if b.t == "Div" and b.identifier:match("^fig%-") then found = true end
  return found
end

local function no_slide(b)
  if b.t == "Div" then return b.classes:includes("no-slide") end
  if b.t == "Figure" then
    -- `![](x.png){#fig-x .no-slide}` puts the class on the image
    local found = b.classes:includes("no-slide")
    b:walk({ Image = function(img)
      found = found or img.classes:includes("no-slide") end })
    return found
  end
  if is_display_eq(b) then
    return pandoc.utils.stringify(b):match("%.no%-slide") ~= nil
  end
  return false
end

local function word_count(blocks)
  local n = 0
  blocks:walk({ Str = function() n = n + 1 end })
  return n
end

-- ---------- captions ----------

local ABBREV = { ["e.g."] = true, ["i.e."] = true, ["vs."] = true,
                 ["Fig."] = true, ["Eq."] = true, ["approx."] = true }

-- Keep the first sentence of a figure caption on the slide.
local function shorten_caption(fig)
  local plain = fig.caption.long[1]
  if not plain or not plain.content then return nil end
  local inl = plain.content
  for i, il in ipairs(inl) do
    if il.t == "Str" and il.text:match("%.$") and not ABBREV[il.text]
        and i < #inl then
      local full = pandoc.Blocks({ pandoc.Plain(inl:clone()) })
      local first = pandoc.Inlines({})
      for j = 1, i do first:insert(inl[j]) end
      fig.caption.long = { pandoc.Plain(first) }
      return full
    end
  end
  return nil
end

-- ---------- cross-chapter references ----------

local function cite_to_link(cite, chapter)
  if #cite.citations ~= 1 then return nil end
  local id = cite.citations[1].id
  local info = numbers.labels[id]
  if not info or info.chapter == chapter then return nil end
  local text = { pandoc.Str(numbers.prefix[info.type]), pandoc.Str("\u{a0}"),
                 pandoc.Str(info.number) }
  return pandoc.Link(text, numbers.book .. "#" .. id)
end

-- ---------- paths ----------

-- Chapters are written for the book in the project root. Rebase relative
-- link and image targets that do not exist next to the deck but do exist in
-- the project root (pandoc runs in slides/, so render outputs stay untouched).
local ROOT = "../"

local function exists(path)
  local f = io.open(path, "r")
  if f then f:close() return true end
  return false
end

local function rebase(target)
  if target == "" or target:match("^%a[%w+.-]*:") or target:match("^[/#]") then
    return nil -- URL, project-absolute, anchor
  end
  local path = target:gsub("[?#].*$", "")
  if exists(path) or not exists(ROOT .. path) then return nil end
  return ROOT .. target:gsub("^%./", "")
end

local rebase_paths = {
  Image = function(el)
    local t = rebase(el.src)
    if t then el.src = t; return el end
  end,
  Link = function(el)
    local t = rebase(el.target)
    if t then el.target = t; return el end
  end,
}

-- ---------- slide builder ----------

function Pandoc(doc)
  local chapter = tonumber(pandoc.utils.stringify(doc.meta["aicd-chapter"] or ""))
  local out = pandoc.Blocks({})
  local macros = pandoc.Blocks({})   -- .hidden macro divs, placed on 1st slide
  local notes = pandoc.Blocks({})    -- prose waiting for the next slide
  local title = doc.meta.title and pandoc.utils.stringify(doc.meta.title) or ""
  local slide = nil                  -- { header, blocks, eqs }

  local function warn_crowded(s)
    local words = word_count(s.blocks)
    local figs = 0
    for _, b in ipairs(s.blocks) do if has_figure(b) then figs = figs + 1 end end
    if words > MAX_WORDS or figs > 1 then
      io.stderr:write(string.format(
        "SLIDES: crowded slide '%s' (%d words, %d figures)\n",
        pandoc.utils.stringify(s.header), words, figs))
    end
  end

  local function flush()
    if not slide then return end
    if #slide.blocks > 0 or slide.own_header then
      out:insert(slide.header)
      if #macros > 0 then out:extend(macros); macros = pandoc.Blocks({}) end
      out:extend(slide.blocks)
      if #notes > 0 then
        out:insert(pandoc.Div(notes, pandoc.Attr("", { "notes" })))
        notes = pandoc.Blocks({})
      end
      warn_crowded(slide)
    end
    slide = nil
  end

  local function open_slide(header)
    flush()
    local own = header ~= nil
    header = header or pandoc.Header(3, pandoc.Inlines(title),
                                     pandoc.Attr("", { "unnumbered" }))
    slide = { header = header, blocks = pandoc.Blocks({}), eqs = 0,
              own_header = own }
  end

  local function add(b)
    if not slide then open_slide() end
    slide.blocks:insert(b)
  end

  local function heading_slide(h)
    -- level 1/2 headings are title slides; notes attach to them
    flush()
    out:insert(h)
    if #macros > 0 then out:extend(macros); macros = pandoc.Blocks({}) end
    if #notes > 0 then
      out:insert(pandoc.Div(notes, pandoc.Attr("", { "notes" })))
      notes = pandoc.Blocks({})
    end
  end

  local function stepwise(callout)
    -- blocks after the first display equation are revealed one by one
    local seen_eq = false
    local body = pandoc.Blocks({})
    for _, b in ipairs(callout.content) do
      if b.t == "Header" or not seen_eq then
        body:insert(b)
      else
        body:insert(pandoc.Div({ b }, pandoc.Attr("", { "fragment" })))
      end
      if is_display_eq(b) then seen_eq = true end
    end
    callout.content = body
    return callout
  end

  for _, b in ipairs(doc.blocks) do
    local fmt = when_format(b)
    if b.t == "Div" and b.classes:includes("content-hidden")
        and (fmt == nil or fmt == "revealjs" or fmt == "html") then
      -- licence headers and book-only blocks
    elseif b.t == "Div" and b.classes:includes("hidden") then
      macros:insert(b)
    elseif no_slide(b) then
      -- explicitly skipped
    elseif b.t == "Header" and b.level <= 2 then
      title = pandoc.utils.stringify(b.content)
      heading_slide(b)
    elseif b.t == "Header" then
      title = pandoc.utils.stringify(b.content)
      open_slide(b)
    elseif b.t == "Div" and b.classes:includes("content-visible")
        and fmt == "revealjs" then
      -- slide-only headings must not shift the book's section numbers
      b = b:walk({ Header = function(h)
        h.classes:insert("unnumbered"); return h end })
      if b.content[1] and b.content[1].t == "Header" then
        local h = table.remove(b.content, 1)
        open_slide(h)
      else
        open_slide()
      end
      add(b)
      flush()
    elseif has_figure(b) then
      open_slide()
      b = pandoc.Blocks({ b }):walk({
        Figure = function(fig)
          local full = shorten_caption(fig)
          if full then notes:extend(full) end
          return fig
        end })[1]
      add(b)
      flush()
    elseif b.t == "Div" and b.classes:includes("callout-note") then
      b.attributes.collapse = nil
      open_slide()
      add(stepwise(b))
      flush()
    elseif b.t == "Div" and (b.attributes.title or ""):match("^Solution") then
      -- exercise solutions: reveal list items and blocks one at a time
      b.attributes.collapse = nil
      b.content = b.content:map(function(x)
        local cls = (x.t == "OrderedList" or x.t == "BulletList")
          and "incremental" or "fragment"
        return pandoc.Div({ x }, pandoc.Attr("", { cls }))
      end)
      open_slide()
      add(b)
      flush()
    elseif b.t == "Div" and b.classes:find_if(function(c)
          return c:match("^callout%-") end) then
      b.attributes.collapse = nil
      open_slide()
      add(b)
      flush()
    elseif is_display_eq(b) then
      local w = eq_weight(b)
      if slide and #slide.blocks > 0 and slide.eqs + w > MAX_EQS then
        open_slide()
      end
      add(b)
      slide.eqs = slide.eqs + w
    elseif b.t == "Para" or b.t == "Plain" or b.t == "LineBlock" then
      notes:insert(b)
    else
      -- lists, tables, code blocks, other divs: on a slide of their own
      -- unless the slide is still empty; equations after them start anew
      if slide and #slide.blocks > 0 then open_slide() end
      add(b)
      slide.eqs = MAX_EQS
    end
  end
  flush()
  if #notes > 0 then
    out:insert(pandoc.Div(notes, pandoc.Attr("", { "notes" })))
  end

  doc.blocks = out:walk(rebase_paths):walk({
    Cite = function(c) return cite_to_link(c, chapter) end })
  return doc
end
