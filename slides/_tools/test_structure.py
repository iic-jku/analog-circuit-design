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
aicd-chapter: 2
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
Table.
:::
"""

NUMBERS = {
    "book": "../aicd.html",
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
        self.assertIn('<a href="../aicd.html#sec-other">Section 5.2</a>', self.html)
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

    def test_callouts_are_not_collapsed_on_slides(self):
        self.assertNotIn("collapse", self.html)


if __name__ == "__main__":
    unittest.main()
