-- -------------------------------------------------
-- Replace deck-local numbers with the book's numbers
-- -------------------------------------------------
-- SPDX-FileCopyrightText: 2026 Harald Pretl
-- Johannes Kepler University, Institute for Integrated Circuits
-- SPDX-License-Identifier: Apache-2.0
--
-- Runs at `post-render`, after Quarto has numbered figures, equations,
-- tables and notes within the deck (starting at 1). Sections already carry
-- the book numbers via `number-offset`. Numbers come from numbers.json,
-- written by gen_decks.py.

local script_dir = pandoc.path.directory(PANDOC_SCRIPT_FILE)
local numbers = pandoc.json.decode(
  io.open(pandoc.path.join({ script_dir, "numbers.json" })):read("a"))

-- In `inl`, replace the first "<Prefix> NBSP <n>" with the book number.
-- Captions and callout titles follow the number with a ":" Str ("Figure 5:"),
-- which tells them apart from references inside the caption text.
local function renumber(inl, info, caption)
  local prefix = numbers.prefix[info.type]
  for i = 1, #inl - 2 do
    if inl[i].t == "Str" and inl[i].text == prefix
        and inl[i + 1].t == "Str" and inl[i + 1].text == "\u{a0}"
        and inl[i + 2].t == "Str" and inl[i + 2].text:match("^%d+$")
        and (not caption or (inl[i + 3] and inl[i + 3].t == "Str"
                             and inl[i + 3].text == ":")) then
      inl[i + 2] = pandoc.Str(info.number)
      return inl, true
    end
  end
  return inl, false
end

local function label_info(id)
  local info = numbers.labels[id]
  if info and info.type ~= "sec" then return info end
  return nil
end

function Link(el)
  if not el.classes:includes("quarto-xref") then return nil end
  local info = label_info(el.target:gsub("^#/?", ""))
  if info then el.content = renumber(el.content, info, false) end
  return el
end

function Span(el)
  local info = label_info(el.identifier)
  if not info or info.type ~= "eq" then return nil end
  return el:walk({
    Math = function(m)
      m.text = m.text:gsub("\\tag{%d+}", "\\tag{" .. info.number .. "}")
      return m
    end })
end

function Div(el)
  local info = label_info(el.identifier)
  if not info then return nil end
  local done = false
  return el:walk({
    Inlines = function(inl)
      if done then return nil end
      local changed
      inl, changed = renumber(inl, info, true)
      done = changed
      return inl
    end,
    RawBlock = function(raw)
      -- lightbox titles etc. are raw HTML
      raw.text = raw.text:gsub(numbers.prefix[info.type] .. "&nbsp;%d+",
        numbers.prefix[info.type] .. "&nbsp;" .. info.number)
      return raw
    end })
end
