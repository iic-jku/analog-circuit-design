-- slides.lua: turn a book chapter into a revealjs slide deck
--
-- SPDX-FileCopyrightText: 2026 Harald Pretl
-- Johannes Kepler University, Institute for Integrated Circuits
-- SPDX-License-Identifier: Apache-2.0
--
-- Runs at `pre-ast` (callouts are still plain `Div.callout-*`, figures are
-- `Div.cell`, `Figure`, or `Div.quarto-embed-nb-cell`). Only active for revealjs.
--
-- Segmentation rules (see README "Lecture slides"):
--   #   chapter heading      -> title of the intro slide (deck title from front matter)
--   ##  section              -> section divider slide
--   ### subsection           -> becomes the title of following slides
--   figure / table / callout -> own slide
--   display equations        -> own slide, max MAX_EQ per paragraph-slide
--   "Solution: ..." callout  -> own slide, content revealed incrementally
--   .content-visible when-format="revealjs" div -> authored slide
--   ::: {#refs}              -> references slide
--   everything else          -> speaker notes of the next slide
--   .no-slide                -> never a slide (figures dropped, rest to notes)

local MAX_EQ = 2
local MAX_WORDS = 80
local BOOK = "aicd.html"

local XREF_TEXT = {
  sec = "Section", fig = "Figure", eq = "Equation", tbl = "Table",
  imp = "Important", nte = "Note", wrn = "Warning", tip = "Tip",
}

local function is_revealjs()
  return FORMAT ~= nil and FORMAT:match("revealjs") ~= nil
end

local function has_class(b, cls)
  return b.classes ~= nil and b.classes:includes(cls)
end

local function warn(msg)
  if quarto ~= nil and quarto.log ~= nil then
    quarto.log.warning(msg)
  else
    io.stderr:write("WARNING (slides.lua) " .. msg .. "\n")
  end
end

-- block classification ------------------------------------------------------

local function is_figure(b)
  if b.t == "Figure" then return true end
  if b.t ~= "Div" then return false end
  if has_class(b, "quarto-embed-nb-cell") then return true end
  return has_class(b, "cell") and b.identifier:match("^cell%-fig%-") ~= nil
end

-- `.no-slide` on a figure written as `![](x.png){#fig-x .no-slide}` ends up on
-- the image inside the Figure, so look there too
local function is_no_slide(b)
  if has_class(b, "no-slide") then return true end
  if b.t ~= "Figure" then return false end
  local found = false
  b:walk({ Image = function(img) found = found or img.classes:includes("no-slide") end })
  return found
end

local function callout_title(b)
  if b.t ~= "Div" then return nil end
  for _, c in ipairs(b.classes) do
    if c:match("^callout%-") then return b.attributes.title or "" end
  end
  return nil
end

local function is_authored_slide(b)
  return b.t == "Div" and has_class(b, "content-visible")
    and (b.attributes["when-format"] or ""):match("revealjs") ~= nil
end

local function is_hidden_everywhere(b)
  return b.t == "Div" and has_class(b, "content-hidden")
    and b.attributes["when-format"] == nil and b.attributes["unless-format"] == nil
end

-- split a Para into its display equations (with labels) and the remaining text
local function split_equations(b)
  if b.t ~= "Para" then return nil end
  local eqs, rest = {}, pandoc.List()
  local i, n = 1, #b.content
  while i <= n do
    local il = b.content[i]
    if il.t == "Math" and il.mathtype == "DisplayMath" then
      local eq = pandoc.List({ il })
      -- keep an attached label `{#eq-...}` (possibly after a Space)
      local j = i + 1
      if j <= n and b.content[j].t == "Space" then j = j + 1 end
      if j <= n and b.content[j].t == "Str" and b.content[j].text:match("^{#eq%-") then
        eq:insert(pandoc.Space())
        eq:insert(b.content[j])
        i = j
      end
      table.insert(eqs, pandoc.Para(eq))
      rest:insert(pandoc.Str("[equation]"))
    else
      rest:insert(il)
    end
    i = i + 1
  end
  if #eqs == 0 then return nil end
  return eqs, pandoc.Para(rest)
end

-- cross-references to targets outside this deck -----------------------------

local function collect_ids(blocks)
  local ids = {}
  local function add(id)
    if id and id ~= "" then ids[(id:gsub("^cell%-", ""))] = true end
  end
  pandoc.Div(blocks):walk({
    -- `###` and deeper are turned into notes, and the chapter `#` is dropped,
    -- so only `##` headings remain valid crossref targets inside the deck
    Header = function(el) if el.level == 2 then add(el.identifier) end end,
    Div = function(el) add(el.identifier) end,
    Figure = function(el) add(el.identifier) end,
    Span = function(el) add(el.identifier) end,
    Table = function(el) add(el.identifier) end,
    Str = function(el)
      local id = el.text:match("^{#(eq%-[^}]+)}")
      if id then ids[id] = true end
    end,
  })
  return ids
end

local function external_refs_filter(ids)
  return {
    Cite = function(el)
      local out = pandoc.List()
      for k, c in ipairs(el.citations) do
        local prefix = c.id:match("^(%a+)%-")
        if not (prefix and XREF_TEXT[prefix]) or ids[c.id] then
          return nil -- bibliography entry or local crossref: leave untouched
        end
        if k > 1 then out:insert(pandoc.Str(", ")) end
        out:insert(pandoc.Link(XREF_TEXT[prefix] .. " (book)", BOOK .. "#" .. c.id))
      end
      return out
    end,
  }
end

-- slide assembly -------------------------------------------------------------

local function word_count(blocks)
  local s = pandoc.utils.stringify(pandoc.Div(blocks))
  local n = 0
  for _ in s:gmatch("%S+") do n = n + 1 end
  return n
end

-- reveal solution content step by step: list items one at a time, other
-- blocks as a whole
local function fragments(blocks)
  local out = pandoc.List()
  for _, b in ipairs(blocks) do
    local cls = (b.t == "OrderedList" or b.t == "BulletList") and "incremental" or "fragment"
    out:insert(pandoc.Div({ b }, pandoc.Attr("", { cls })))
  end
  return out
end

function Pandoc(doc)
  if not is_revealjs() then return nil end

  local ids = collect_ids(doc.blocks)
  local out = pandoc.List()
  local title = ""       -- title for content slides (`##`, overridden by `###`)
  local notes = pandoc.List()
  local last = nil       -- last slide in the current section
  local divider = nil    -- divider slide of the current section
  local started = false  -- seen the chapter heading yet
  local preamble = pandoc.List()

  local function new_slide(slide_title, kind)
    local s = { title = slide_title, body = pandoc.List(), notes = notes,
                kind = kind, eqs = 0 }
    notes = pandoc.List()
    out:insert(s)
    last = s
    return s
  end

  -- attach leftover prose at the end of a section; if the section produced no
  -- slide at all (e.g. the chapter introduction), give it a title-only slide
  local function flush_notes()
    if #notes == 0 then return end
    local target = last or divider
    if target then
      target.notes:extend(notes)
      notes = pandoc.List()
    else
      new_slide(title, "intro")
    end
  end

  for _, b in ipairs(doc.blocks) do
    local ctitle = callout_title(b)
    if not started then
      if b.t == "Header" and b.level == 1 then
        started = true
        title = pandoc.utils.stringify(b)
      else
        preamble:insert(b) -- e.g. the macro definitions in _abbrv.qmd
      end
    elseif is_hidden_everywhere(b) then
      -- license headers etc.
    elseif b.t == "Header" and b.level <= 2 then
      flush_notes()
      b.level = 1
      divider = { divider = true, header = b, notes = pandoc.List() }
      out:insert(divider)
      title, last = pandoc.utils.stringify(b), nil
    elseif b.t == "Header" then
      title = pandoc.utils.stringify(b)
      notes:insert(pandoc.Para(pandoc.Strong(b.content)))
    elseif b.t == "Div" and b.identifier == "refs" then
      flush_notes()
      new_slide("References", "refs").body:insert(b)
    elseif is_no_slide(b) then
      if not is_figure(b) then notes:insert(b) end
    elseif is_authored_slide(b) then
      local body = pandoc.List(b.content)
      local t = title
      if #body > 0 and body[1].t == "Header" then
        t = pandoc.utils.stringify(body[1])
        body:remove(1)
      end
      new_slide(t, "authored").body:extend(body)
    elseif ctitle and ctitle:match("^Solution") then
      b.attributes.collapse = nil
      b.content = fragments(b.content)
      new_slide(title, "solution").body:insert(b)
    elseif ctitle then
      b.attributes.collapse = nil
      new_slide(title, "callout").body:insert(b)
    elseif is_figure(b) then
      new_slide(title, "figure").body:insert(b)
    elseif b.t == "Table" then
      new_slide(title, "table").body:insert(b)
    else
      local eqs, rest = split_equations(b)
      if eqs then
        notes:insert(rest)
        for _, eq in ipairs(eqs) do
          local s = last
          if not (s and s.kind == "equation" and s.eqs < MAX_EQ and #notes == 0) then
            s = new_slide(title, "equation")
          end
          s.body:insert(eq)
          s.eqs = s.eqs + 1
        end
      else
        notes:insert(b)
      end
    end
  end
  flush_notes()

  -- render slides to blocks; the preamble goes onto the first slide so that
  -- it does not create an empty slide of its own
  local blocks = pandoc.List()
  for k, s in ipairs(out) do
    if s.divider then
      blocks:insert(s.header)
      if k == 1 then blocks:extend(preamble) end
      if #s.notes > 0 then blocks:insert(pandoc.Div(s.notes, pandoc.Attr("", { "notes" }))) end
    else
      blocks:insert(pandoc.Header(2, s.title))
      if k == 1 then blocks:extend(preamble) end
      blocks:extend(s.body)
      if #s.notes > 0 then blocks:insert(pandoc.Div(s.notes, pandoc.Attr("", { "notes" }))) end
      local words = word_count(s.body)
      local figs = 0
      for _, x in ipairs(s.body) do if is_figure(x) then figs = figs + 1 end end
      if words > MAX_WORDS or figs > 1 then
        warn(string.format("dense slide '%s' (%d words, %d figures)", s.title, words, figs))
      end
    end
  end

  doc.blocks = blocks
  return doc:walk(external_refs_filter(ids))
end
