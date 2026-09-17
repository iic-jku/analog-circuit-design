#!/usr/bin/env python3
# -------------------------------------------------
# Unit tests for slides/_tools/gen_decks.py
# -------------------------------------------------
# SPDX-FileCopyrightText: 2026 Harald Pretl
# Johannes Kepler University, Institute for Integrated Circuits
# SPDX-License-Identifier: Apache-2.0
#
# Run: python3 -m unittest slides/_tools/test_gen_decks.py

import json
import sys
import tempfile
import textwrap
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import gen_decks  # noqa: E402

BOOK = """\
---
title: Test
# a YAML comment, not a heading
---

{{< include /content/_abbrv.qmd >}}
{{< include /content/intro/_sec_intro.qmd >}}
{{< include /content/lna/_sec_lna.qmd >}}

# Inline Chapter

To be added.

{{< include /content/appendix/_app_theorems.qmd >}}
{{< include /content/appendix/_app_exam_questions.qmd >}}
"""

INTRO = """\
::: {.content-hidden}
# Not a heading {#sec-licence}
:::

# Introduction {#sec-intro}

Text with inline math $x$ only, citing [@Widlar_1965].

## Basics {#sec-intro-basics}

$$
a = b
$$ {#eq-first}

{{< include /content/intro/_fig_one.qmd >}}

::: {#nte-example .callout-note}
## Example Title
$$
c = d
$$ {#eq-in-callout}
:::

::: {.callout-important title="Parameters" #imp-params}
Text.
:::

| a | b |
|---|---|
| 1 | 2 |
: Caption {#tbl-one}

::: {.content-visible when-format="revealjs"}
## Slide Only {#sec-slide-only}
$$
e
$$ {#eq-slide-only}
:::

## Unnumbered {.unnumbered}

### Deeper {#sec-intro-deeper}
"""

FIG_ONE = """\
```{python}
#| label: fig-one
# a python comment, not a heading
print(1)
```
"""

LNA = """\
# Low Noise Amplifiers {#sec-lna}

See @sec-intro-basics.

{{< embed /gmid/nb.ipynb#fig-from-notebook >}}

{{< embed /gmid/plots.ipynb#fig-top-label >}}

{{< embed /gmid/plots.ipynb#fig-late-label >}}

$$
f
$$ {#eq-lna}
"""

THEOREMS = """\
# Appendix: Useful Theorems

## Miller {#sec-miller}

$$
g
$$ {#eq-miller}
"""

# Quarto only numbers an embedded cell whose label is in the leading option
# block; a label below other lines just tags the cell (unnumbered figure).
NOTEBOOK = {"cells": [
    {"cell_type": "code", "source": ["#| label: fig-top-label\n", "plot()\n"]},
    {"cell_type": "code", "source": ["# plot\n", "#| label: fig-late-label\n", "plot()\n"]},
]}

EXAM = """\
# Exemplary Examination Questions {#sec-exam-questions}
"""


COURSE = {"book": "notes.qmd", "short": "TEST", "title": "Test Lecture",
          "exclude": ["exam_questions"]}


def make_tree(root):
    files = {
        "slides/_course.json": json.dumps(COURSE),
        "notes.qmd": BOOK,
        "references.bib": "@article{Widlar_1965,\n title={x}}\n",
        "content/_abbrv.qmd": "::: {.hidden}\n\\newcommand{\\x}{x}\n:::\n",
        "content/intro/_sec_intro.qmd": INTRO,
        "content/intro/_fig_one.qmd": FIG_ONE,
        "content/lna/_sec_lna.qmd": LNA,
        "content/appendix/_app_theorems.qmd": THEOREMS,
        "content/appendix/_app_exam_questions.qmd": EXAM,
        "gmid/plots.ipynb": json.dumps(NOTEBOOK),
    }
    for rel, text in files.items():
        path = root / rel
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(textwrap.dedent(text), encoding="utf-8")


class NumberLabelsTest(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.root = Path(self.tmp.name)
        make_tree(self.root)
        self.labels = gen_decks.number_labels(self.root)

    def tearDown(self):
        self.tmp.cleanup()

    def num(self, label):
        return self.labels[label]["number"]

    def test_sections_are_hierarchical(self):
        self.assertEqual(self.num("sec-intro"), "1")
        self.assertEqual(self.num("sec-intro-basics"), "1.1")
        self.assertEqual(self.num("sec-lna"), "2")

    def test_inline_book_chapter_counts(self):
        # "# Inline Chapter" in the book itself is chapter 3
        self.assertEqual(self.num("sec-miller"), "4.1")
        self.assertEqual(self.num("sec-exam-questions"), "5")

    def test_unnumbered_heading_does_not_count(self):
        # "## Unnumbered" is skipped, so ### Deeper is below 1.1
        self.assertEqual(self.num("sec-intro-deeper"), "1.1.1")

    def test_hidden_and_slide_only_content_is_ignored(self):
        self.assertNotIn("sec-licence", self.labels)
        self.assertNotIn("sec-slide-only", self.labels)
        self.assertNotIn("eq-slide-only", self.labels)

    def test_callout_heading_is_not_a_section(self):
        self.assertNotIn("sec-example-title", self.labels)

    def test_flat_counters_across_chapters(self):
        self.assertEqual(self.num("eq-first"), "1")
        self.assertEqual(self.num("eq-in-callout"), "2")
        self.assertEqual(self.num("eq-lna"), "3")
        self.assertEqual(self.num("eq-miller"), "4")
        self.assertEqual(self.num("fig-one"), "1")
        self.assertEqual(self.num("fig-from-notebook"), "2")
        self.assertEqual(self.num("fig-top-label"), "3")
        self.assertEqual(self.num("tbl-one"), "1")
        self.assertEqual(self.num("nte-example"), "1")

    def test_embedded_cell_without_leading_label_is_unnumbered(self):
        self.assertNotIn("fig-late-label", self.labels)

    def test_label_after_classes(self):
        self.assertEqual(self.labels["imp-params"],
                         {"type": "imp", "number": "1", "chapter": 1})

    def test_chapter_of_label(self):
        self.assertEqual(self.labels["fig-one"]["chapter"], 1)
        self.assertEqual(self.labels["eq-lna"]["chapter"], 2)
        self.assertEqual(self.labels["eq-miller"]["chapter"], 4)

    def test_code_comment_is_not_a_heading(self):
        self.assertEqual(self.num("sec-lna"), "2")


class RenderFilesTest(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.root = Path(self.tmp.name)
        make_tree(self.root)
        self.files = gen_decks.render_files(self.root)

    def tearDown(self):
        self.tmp.cleanup()

    def test_one_deck_per_chapter_and_appendix_without_exam(self):
        decks = sorted(f for f in self.files
                       if f.startswith("slides/") and f.count("/") == 1
                       and f != "slides/index.qmd")
        self.assertEqual(decks, ["slides/intro.qmd", "slides/lna.qmd",
                                 "slides/theorems.qmd"])

    def test_deck_front_matter(self):
        deck = self.files["slides/lna.qmd"]
        self.assertIn('title: "Low Noise Amplifiers"', deck)
        self.assertIn("lecture-chapter: 2", deck)
        self.assertIn('subtitle: "Test Lecture"', deck)
        self.assertIn("number-offset: [1]", deck)
        self.assertIn("{{< include /content/lna/_sec_lna.qmd >}}", deck)
        self.assertIn("(../notes.html#sec-lna)", deck)
        self.assertIn("path: _tools/structure.lua", deck)
        self.assertIn("bibliography: ../references.bib", deck)
        # 16:9 slides for widescreen projectors
        self.assertIn("    width: 1280\n    height: 720\n", deck)

    def test_appendix_deck_after_inline_chapter(self):
        deck = self.files["slides/theorems.qmd"]
        self.assertIn('title: "Appendix: Useful Theorems"', deck)
        self.assertIn("lecture-chapter: 4", deck)
        self.assertIn("number-offset: [3]", deck)
        self.assertIn('footer: "[TEST lecture notes](../notes.html)"', deck)

    def test_references_slide_only_when_citing(self):
        self.assertIn("::: {#refs}", self.files["slides/intro.qmd"])
        self.assertNotIn("#refs", self.files["slides/lna.qmd"])

    def test_title_with_quote_is_valid_yaml(self):
        (self.root / "content/lna/_sec_lna.qmd").write_text(
            '# Designer\'s "Etiquette" {#sec-lna}\n', encoding="utf-8")
        deck = gen_decks.render_files(self.root)["slides/lna.qmd"]
        self.assertIn('title: "Designer\'s \\"Etiquette\\""', deck)

    def test_overview_lists_decks(self):
        index = self.files["slides/index.qmd"]
        self.assertIn("2. [Low Noise Amplifiers](lna.html)", index)
        # chapter 3 has no deck; a new list keeps the number 4
        self.assertIn("2. [Low Noise Amplifiers](lna.html)\n\n<!-- -->\n\n"
                      "4. [Appendix: Useful Theorems](theorems.html)", index)
        self.assertIn("(../notes.html)", index)

    def test_numbers_map_links_from_slides_dir(self):
        self.assertIn('"book": "../notes.html"',
                      self.files["slides/_tools/numbers.json"])
        self.assertIn('"imp": "Important"',
                      self.files["slides/_tools/numbers.json"])

    def test_check_mode_detects_stale_files(self):
        gen_decks.ROOT = self.root
        try:
            self.assertEqual(gen_decks.main([]), 0)
            self.assertEqual(gen_decks.main(["--check"]), 0)
            (self.root / "slides" / "lna.qmd").write_text("edited")
            self.assertEqual(gen_decks.main(["--check"]), 1)
        finally:
            gen_decks.ROOT = Path(gen_decks.__file__).resolve().parents[2]

    def test_removed_chapter_deck_is_deleted_hand_written_kept(self):
        gen_decks.ROOT = self.root
        try:
            self.assertEqual(gen_decks.main([]), 0)
            (self.root / "slides" / "old.qmd").write_text(
                "---\n" + gen_decks.MARKER + " from old.qmd -- do not edit.\n---\n")
            (self.root / "slides" / "extra.qmd").write_text("---\ntitle: X\n---\n")
            self.assertEqual(gen_decks.main(["--check"]), 1)
            self.assertEqual(gen_decks.main([]), 0)
            self.assertFalse((self.root / "slides" / "old.qmd").exists())
            self.assertTrue((self.root / "slides" / "extra.qmd").exists())
            self.assertEqual(gen_decks.main(["--check"]), 0)
        finally:
            gen_decks.ROOT = Path(gen_decks.__file__).resolve().parents[2]


if __name__ == "__main__":
    unittest.main()
