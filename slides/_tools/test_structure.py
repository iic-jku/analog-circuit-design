#!/usr/bin/env python3
# -------------------------------------------------
# Unit tests for slides/_tools/structure.lua
# -------------------------------------------------
# SPDX-FileCopyrightText: 2026 Harald Pretl
# Johannes Kepler University, Institute for Integrated Circuits
# SPDX-License-Identifier: Apache-2.0
#
# Run: python3 -m unittest slides/_tools/test_structure.py
#
# The filter runs through `quarto pandoc` on a small chapter inside a fake
# project, with its own numbers.json next to a copy of the filter.

import json
import shutil
import subprocess
import tempfile
import textwrap
import unittest
from pathlib import Path

HERE = Path(__file__).resolve().parent

CHAPTER = """\
---
lecture-chapter: 2
---

# Chapter {#sec-chap}

See @sec-other and @sec-part, the [schematic](./xschem/foo.sch), a
[local file](local.txt), and the [web](https://example.com).

## Part {#sec-part}

Prose before the figure.

![A caption. More detail.](x.png){#fig-a}

![Hidden figure](y.png){#fig-b .no-slide}

::: {.callout-tip title="Exercise: Foo"}
Do it.
:::

::: {.callout-tip title="Solution: Foo" collapse="true"}
1. step one
2. step two
:::

::: {#nte-cace .callout-note title="Summary" collapse="true"}
# Report Heading

Table.
:::

## Long {#sec-long}

{LONG_LIST}

::: {#imp-long .callout-important title="Long"}
{LONG_PARAS}
:::

## Merged {#sec-merged}

::: {.content-hidden when-format="revealjs"}
Book-only paragraph.
:::

::: {#nte-titled .callout-note}
## Heading Title

{TITLED_PARAS}
:::

::: {.callout-warning title="Careful"}
Shown on slide.

::: {.content-hidden when-format="revealjs"}
Hidden in callout.
:::
:::

Summarized prose.

::: {.content-visible when-format="revealjs"}
### Key Points

- point
:::

### Empty Section

::: {.content-visible when-format="revealjs"}
- filler
:::

{TABLE}
""".replace("{TABLE}", "| a | b |\n|---|---|\n" + "\n".join(
    f"| r{i} | v{i} |" for i in range(15)) + "\n\n: Long table {#tbl-long}").replace(
    "{TITLED_PARAS}", "\n\n".join(f"tpara{i} " + "word " * 50 for i in range(2))).replace("{LONG_LIST}", "\n".join(
    f"{i}. item{i} " + "word " * 30 for i in range(1, 6))).replace(
    "{LONG_PARAS}", "\n\n".join(f"para{i} " + "word " * 50 for i in range(3)))

NUMBERS = {
    "book": "../notes.html",
    "prefix": {"sec": "Section", "fig": "Figure", "eq": "Equation",
               "tbl": "Table", "nte": "Note", "imp": "Important"},
    "labels": {
        "sec-other": {"type": "sec", "number": "5.2", "chapter": 5},
        "sec-part": {"type": "sec", "number": "2.1", "chapter": 2},
    },
}


def run_filter():
    with tempfile.TemporaryDirectory() as tmp:
        project = Path(tmp)
        tools = project / "slides" / "_tools"
        tools.mkdir(parents=True)
        shutil.copy(HERE / "structure.lua", tools)
        (tools / "numbers.json").write_text(json.dumps(NUMBERS))
        (project / "xschem").mkdir()
        (project / "xschem" / "foo.sch").write_text("")
        (project / "slides" / "local.txt").write_text("")
        src = project / "slides" / "chapter.md"
        src.write_text(textwrap.dedent(CHAPTER))
        proc = subprocess.run(
            ["quarto", "pandoc", str(src), "-t", "revealjs", "--slide-level=3",
             "--wrap=none", "--lua-filter", str(tools / "structure.lua")],
            capture_output=True, text=True, check=True, cwd=project / "slides")
    return proc.stdout


class StructureTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.html = run_filter()

    def test_other_chapter_reference_links_to_book_number(self):
        self.assertIn('<a href="../notes.html#sec-other">Section 5.2</a>', self.html)
        self.assertIn('data-cites="sec-part"', self.html)

    def test_project_relative_paths_are_rebased(self):
        self.assertIn('href="../xschem/foo.sch"', self.html)
        self.assertIn('href="local.txt"', self.html)
        self.assertIn('href="https://example.com"', self.html)

    def test_prose_becomes_notes_and_caption_is_shortened(self):
        self.assertIn('<aside class="notes">', self.html)
        self.assertIn("Prose before the figure.", self.html)
        self.assertIn("<figcaption>A caption.</figcaption>", self.html)

    def test_no_slide_figure_image_is_skipped(self):
        self.assertNotIn("fig-b", self.html)

    def test_solution_is_revealed_step_by_step(self):
        self.assertIn('<li class="fragment">step one</li>', self.html)

    def test_long_list_continues_on_next_slide_with_numbering(self):
        # 31 words per item: two items per slide, numbering continues
        self.assertEqual(self.html.count("<ol"), 4)  # solution list + 3 pages
        self.assertIn('<ol start="3"', self.html)
        self.assertIn('<ol start="5"', self.html)

    def test_long_callout_continues_on_next_slide(self):
        self.assertEqual(self.html.count('id="imp-long"'), 1)
        self.assertEqual(self.html.count("callout-important"), 3)

    def test_headings_inside_callouts_do_not_start_slides(self):
        self.assertIn("<strong>Report Heading</strong>", self.html)
        self.assertNotIn('id="report-heading"', self.html)

    def test_callouts_are_not_collapsed_on_slides(self):
        self.assertNotIn("collapse", self.html)

    def test_callout_heading_title_is_kept_on_every_part(self):
        # Quarto turns the leading heading into the callout title
        self.assertEqual(self.html.count("Heading Title"), 2)
        self.assertNotIn("<strong>Heading Title</strong>", self.html)
        self.assertEqual(self.html.count('id="nte-titled"'), 1)

    def test_book_only_text_becomes_speaker_notes(self):
        notes = "".join(self.html.split('<aside class="notes">')[1:])
        self.assertIn("Book-only paragraph.", notes)
        self.assertIn("Hidden in callout.", notes)
        self.assertNotIn("content-hidden", self.html)

    def test_titled_slide_only_block_keeps_preceding_prose_as_notes(self):
        slide = self.html.split('id="key-points"')[1].split("</section>")[0]
        self.assertIn("Summarized prose.", slide)

    def test_untitled_slide_only_block_fills_empty_section_slide(self):
        slide = self.html.split('id="empty-section"')[1].split("</section>")[0]
        self.assertIn("filler", slide)

    def test_long_table_is_split_caption_on_first_part(self):
        self.assertEqual(self.html.count("<table"), 2)
        self.assertEqual(self.html.count("Long table"), 1)
        self.assertIn("r14", self.html)


if __name__ == "__main__":
    unittest.main()
