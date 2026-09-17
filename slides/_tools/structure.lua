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
-- slide. Long lists, callouts, paragraphs and tables continue on further
-- slides. References to labels in other chapters link to the book.
--
-- Author controls inside the chapter files:
--   ::: {.content-visible when-format="revealjs"}   slide-only block
--   ::: {.content-hidden when-format="revealjs"}    book-only block (its text
--                                                    becomes speaker notes;
--                                                    also inside callouts)
--   {.no-slide} on a div or figure, or in an equation's {#eq-... .no-slide}
--
-- Chapter-relative paths (`./xschem/x.svg`) are rebased for decks in slides/;
-- "Solution: ..." callouts are revealed step by step.

local MAX_EQS = 2        -- display equations per slide
local MAX_WORDS = 80     -- words per slide (pagination and crowding warning)
local MAX_ROWS = 12      -- table rows per slide (longer tables are split)
local MAX_TABLE_WORDS = 120  -- words per table slide (set in a smaller font)

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

local function hidden_on_slides(b)
  return b.t == "Div" and b.classes:includes("content-hidden")
    and when_format(b) == "revealjs"
end

local function word_count(blocks)
  local n = 0
  blocks:walk({
    Str = function() n = n + 1 end,
    Image = function(img)
      -- alt text repeats the caption and is not shown
      pandoc.Inlines(img.caption):walk({ Str = function() n = n - 1 end })
    end,
    Table = function(t)
      -- tables are data, not prose: judged by rows (see table_rows)
      pandoc.Blocks({ t }):walk({ Str = function() n = n - 1 end })
    end,
  })
  return n
end

local function table_rows(blocks)
  local n = 0
  blocks:walk({ Table = function(t)
    for _, body in ipairs(t.bodies) do n = math.max(n, #body.body) end
  end })
  return n
end

local function table_words(blocks)
  local n = 0
  blocks:walk({ Table = function(t)
    pandoc.Blocks({ t }):walk({ Str = function() n = n + 1 end })
  end })
  return n
end

-- Split a long table into row chunks of similar size; the caption and label
-- stay on the first.
local function split_table(t)
  local words = table_words(pandoc.Blocks({ t }))
  local rows = #t.bodies == 1 and #t.bodies[1].body or 0
  local parts_n = math.max(math.ceil(words / MAX_TABLE_WORDS),
                           math.ceil(rows / MAX_ROWS))
  if parts_n <= 1 or #t.bodies ~= 1 then return { t } end
  local target_words = words / parts_n
  local target_rows = math.ceil(rows / parts_n)
  local chunks, body, sum = {}, pandoc.List({}), 0
  for _, row in ipairs(t.bodies[1].body) do
    local w = 0
    for _, cell in ipairs(row.cells) do w = w + word_count(cell.contents) end
    if #body > 0 and (#body >= target_rows or sum + w / 2 > target_words) then
      chunks[#chunks + 1] = body
      body, sum = pandoc.List({}), 0
    end
    body:insert(row)
    sum = sum + w
  end
  chunks[#chunks + 1] = body
  local parts = {}
  for i, chunk in ipairs(chunks) do
    local part = t:clone()
    local bodies = part.bodies
    bodies[1].body = chunk
    part.bodies = bodies
    if i > 1 then
      part.attr = pandoc.Attr()
      part.caption = { long = pandoc.Blocks({}) }
    end
    parts[#parts + 1] = part
  end
  return parts
end

local ABBREV = { ["e.g."] = true, ["i.e."] = true, ["vs."] = true,
                 ["Fig."] = true, ["Eq."] = true, ["approx."] = true }

-- Split inlines into sentences (runs of inlines ending in . ! or ?).
local function sentences(inl)
  local out = { pandoc.Inlines({}) }
  for i, il in ipairs(inl) do
    local cur = out[#out]
    if #cur > 0 or (il.t ~= "Space" and il.t ~= "SoftBreak") then
      cur:insert(il)
    end
    local nxt, word = inl[i + 1], inl[i + 2]
    local spaced = nxt and (nxt.t == "Space" or nxt.t == "SoftBreak")
    local ends = il.t == "Str" and il.text:match("[.!?][)\"'\u{201d}]*$")
      and not ABBREV[il.text]
    -- a display equation (and its label) ends a sentence if a capital follows
    local eq_end = (il.t == "Math" and il.mathtype == "DisplayMath"
        or il.t == "Str" and il.text:match("^{#eq%-"))
      and not (word and word.t == "Str" and word.text:match("^{#eq%-"))
      and word and word.t == "Str" and word.text:match("^%u")
    if spaced and (ends or eq_end) then
      out[#out + 1] = pandoc.Inlines({})
    end
  end
  if #out[#out] == 0 then out[#out] = nil end
  return out
end

-- Break a paragraph into paragraphs of whole sentences, each of at most
-- max words unless a single sentence is longer.
local function split_para(b, max)
  local make = b.t == "Plain" and pandoc.Plain or pandoc.Para
  local paras, cur, n = {}, pandoc.Inlines({}), 0
  for _, sen in ipairs(sentences(b.content)) do
    local w = word_count(pandoc.Blocks({ pandoc.Plain(sen) }))
    if #cur > 0 and n + w > max then
      paras[#paras + 1] = make(cur)
      cur, n = pandoc.Inlines({}), 0
    end
    if #cur > 0 then cur:insert(pandoc.Space()) end
    cur:extend(sen)
    n = n + w
  end
  if #cur > 0 then paras[#paras + 1] = make(cur) end
  return paras
end

-- ---------- pagination ----------

local function is_list(b)
  return b.t == "BulletList" or b.t == "OrderedList"
end

local list_chunks

-- Split the blocks of one list item into parts of at most max words: a long
-- paragraph at its sentences, a nested list at its items (the lead text is
-- repeated on every part).
local function item_parts(blocks, max)
  if word_count(blocks) <= max then return { blocks } end
  local last = blocks[#blocks]
  if #blocks == 1 and (last.t == "Plain" or last.t == "Para") then
    local parts = {}
    for _, p in ipairs(split_para(last, max)) do
      parts[#parts + 1] = pandoc.Blocks({ p })
    end
    return parts
  end
  if #blocks > 1 and is_list(last) then
    local lead = pandoc.Blocks({})
    for i = 1, #blocks - 1 do lead:insert(blocks[i]) end
    local parts = {}
    for _, sub in ipairs(list_chunks(last, max - word_count(lead))) do
      local part = lead:clone()
      part:insert(sub)
      parts[#parts + 1] = part
    end
    return parts
  end
  return { blocks }
end

-- Split a list into lists of at most max words each, continuing the numbers.
-- Parts of one long item go to separate lists and keep the item's number.
list_chunks = function(list, max)
  local chunks = { {} }
  local n = 0
  for i, item in ipairs(list.content) do
    for j, part in ipairs(item_parts(pandoc.Blocks(item), max)) do
      local w = word_count(part)
      local cur = chunks[#chunks]
      if #cur > 0 and (n + w > max or j > 1) then
        chunks[#chunks + 1] = {}
        n = 0
      end
      table.insert(chunks[#chunks], { num = i, blocks = part })
      n = n + w
    end
  end
  local lists = {}
  for _, chunk in ipairs(chunks) do
    local items = {}
    for _, e in ipairs(chunk) do items[#items + 1] = e.blocks end
    if list.t == "BulletList" then
      lists[#lists + 1] = pandoc.BulletList(items)
    else
      local attr = list.listAttributes
      lists[#lists + 1] = pandoc.OrderedList(items, pandoc.ListAttributes(
        attr.start + chunk[1].num - 1, attr.style, attr.delimiter))
    end
  end
  return lists
end

-- Split blocks into pages of at most MAX_WORDS, breaking between blocks,
-- list items and sentences. Figures get a page of their own. A single
-- sentence above the limit stays whole.
local function paginate(blocks)
  local pages = { pandoc.Blocks({}) }
  local words = 0
  local function put(b, w)
    local page = pages[#pages]
    local last = page[#page]
    if #page > 0 and last.t ~= "Header"
        and (words + w > MAX_WORDS or has_figure(b) or has_figure(last)) then
      pages[#pages + 1] = pandoc.Blocks({})
      words = 0
    end
    pages[#pages]:insert(b)
    words = words + w
  end
  for _, b in ipairs(blocks) do
    local w = word_count(pandoc.Blocks({ b }))
    if (b.t == "Para" or b.t == "Plain") and w > MAX_WORDS then
      for _, p in ipairs(split_para(b, MAX_WORDS)) do
        put(p, word_count(pandoc.Blocks({ p })))
      end
    elseif is_list(b) and words + w > MAX_WORDS then
      for i, l in ipairs(list_chunks(b, MAX_WORDS)) do
        if i > 1 then words = MAX_WORDS end -- each chunk on a new page
        put(l, word_count(pandoc.Blocks({ l })))
      end
    else
      put(b, w)
    end
  end
  return pages
end

-- ---------- captions ----------

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
  local chapter = tonumber(pandoc.utils.stringify(doc.meta["lecture-chapter"] or ""))
  local out = pandoc.Blocks({})
  local macros = pandoc.Blocks({})   -- .hidden macro divs, placed on 1st slide
  local notes = pandoc.Blocks({})    -- prose waiting for the next slide
  local title = doc.meta.title and pandoc.utils.stringify(doc.meta.title) or ""
  local slide = nil                  -- { header, blocks, eqs }

  local function warn_crowded(s)
    local words = word_count(s.blocks)
    local figs = 0
    for _, b in ipairs(s.blocks) do if has_figure(b) then figs = figs + 1 end end
    local rows = table_rows(s.blocks)
    local twords = table_words(s.blocks)
    if words > MAX_WORDS or figs > 1 or rows > MAX_ROWS
        or twords > MAX_TABLE_WORDS then
      io.stderr:write(string.format(
        "SLIDES: crowded slide '%s' (%d words, %d figures, %d table rows)\n",
        pandoc.utils.stringify(s.header), words, figs, rows))
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

  local function short_captions(b)
    -- call after open_slide(): full captions go to the notes of the new slide
    return pandoc.Blocks({ b }):walk({
      Figure = function(fig)
        local full = shorten_caption(fig)
        if full then notes:extend(full) end
        return fig
      end })[1]
  end

  local function strip_hidden(b)
    -- nested book-only blocks: returns b without them and their content
    local hidden = pandoc.Blocks({})
    b = pandoc.Blocks({ b }):walk({ Div = function(d)
      if hidden_on_slides(d) then hidden:extend(d.content); return {} end
    end })[1]
    return b, hidden
  end

  local function add_callout(callout, transform)
    -- a long callout continues on further slides, the label stays on the first
    callout.attributes.collapse = nil
    local hidden
    callout, hidden = strip_hidden(callout)
    -- `## Title` as first block is the callout title (unless title="...")
    local heading = nil
    if not callout.attributes.title and callout.content[1]
        and callout.content[1].t == "Header" then
      heading = callout.content:remove(1)
    end
    for i, page in ipairs(paginate(callout.content)) do
      local c = callout:clone()
      if i > 1 then c.identifier = "" end
      -- other headings inside a callout (e.g. an included CACE report)
      -- would start new slides
      c.content = page:map(function(x)
        if x.t == "Header" then return pandoc.Para({ pandoc.Strong(x.content) }) end
        return x
      end)
      if heading then c.content:insert(1, heading:clone()) end
      open_slide()
      if i == 1 then notes:extend(hidden) end
      c = short_captions(c)
      add(transform and transform(c) or c)
      flush()
    end
  end

  local function reveal_steps(callout)
    -- exercise solutions: reveal list items and blocks one at a time
    callout.content = callout.content:map(function(x)
      local cls = (x.t == "OrderedList" or x.t == "BulletList")
        and "incremental" or "fragment"
      return pandoc.Div({ x }, pandoc.Attr("", { cls }))
    end)
    return callout
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

  -- licence headers and HTML-only blocks, also inside included files
  doc.blocks = doc.blocks:walk({ Div = function(d)
    local fmt = when_format(d)
    if d.classes:includes("content-hidden") and (fmt == nil or fmt == "html") then
      return {}
    end
  end })

  local blocks = pandoc.Blocks({})
  for _, b in ipairs(doc.blocks) do
    if b.t == "Table" then blocks:extend(split_table(b)) else blocks:insert(b) end
  end

  for _, b in ipairs(blocks) do
    local fmt = when_format(b)
    if hidden_on_slides(b) then
      -- book-only text is still useful to the presenter
      notes:extend(b.content)
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
        -- the prose summarized by a titled slide becomes its notes
        local held = notes
        notes = pandoc.Blocks({})
        open_slide(h)
        notes = held
      elseif not (slide and slide.own_header and #slide.blocks == 0) then
        -- without a heading, fill a still-empty section slide
        open_slide()
      end
      add(b)
      flush()
    elseif b.t == "Div" and b.classes:includes("callout-note") then
      add_callout(b, stepwise)
    elseif b.t == "Div" and (b.attributes.title or ""):match("^Solution") then
      add_callout(b, reveal_steps)
    elseif b.t == "Div" and b.classes:find_if(function(c)
          return c:match("^callout%-") end) then
      add_callout(b)
    elseif has_figure(b) then
      open_slide()
      add(short_captions(b))
      flush()
    elseif is_display_eq(b) then
      -- sentences around the equation are prose: they go to the notes
      local keep, prose = pandoc.Inlines({}), pandoc.Blocks({})
      for _, sen in ipairs(sentences(b.content)) do
        local p = pandoc.Para(sen)
        if is_display_eq(p) then
          if #keep > 0 then keep:insert(pandoc.Space()) end
          keep:extend(sen)
        else
          prose:insert(p)
        end
      end
      b = pandoc.Para(keep)
      local w = eq_weight(b)
      if slide and #slide.blocks > 0 and slide.eqs + w > MAX_EQS then
        open_slide()
      end
      notes:extend(prose)
      add(b)
      slide.eqs = slide.eqs + w
    elseif b.t == "Para" or b.t == "Plain" or b.t == "LineBlock" then
      notes:insert(b)
    else
      -- lists, tables, code blocks, other divs: on a slide of their own
      -- unless the slide is still empty; equations after them start anew
      local hidden
      b, hidden = strip_hidden(b)
      local pages = is_list(b) and paginate({ b }) or { { b } }
      for i, page in ipairs(pages) do
        if slide and #slide.blocks > 0 then open_slide() end
        if i == 1 then notes:extend(hidden) end
        for _, x in ipairs(page) do add(x) end
      end
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
