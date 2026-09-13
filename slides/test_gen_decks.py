# SPDX-FileCopyrightText: 2026 Harald Pretl
# Johannes Kepler University, Institute for Integrated Circuits
# SPDX-License-Identifier: Apache-2.0
"""Unit tests for slides/gen_decks.py."""

import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import gen_decks  # noqa: E402

BOOK = """---
title: x
---

{{< include /content/_abbrv.qmd >}}
{{< include /content/current_mirror/_sec_current_mirror.qmd >}}

# An RC-OPAMP Filter

{{< include /content/appendix/_app_linux_cheatsheet.qmd >}}
"""

CHAPTER = """::: {.content-hidden}
License
:::

# Current Mirror {#sec-current-mirror}

A mirror [@Widlar_1965], see @sec-gmid-method and @fig-x.

{{< include /content/current_mirror/_fig_current_mirror.qmd >}}
"""


class Parsing(unittest.TestCase):
    def test_chapter_includes_skips_abbrv_and_keeps_order(self):
        self.assertEqual(
            gen_decks.chapter_includes(BOOK),
            ["/content/current_mirror/_sec_current_mirror.qmd",
             "/content/appendix/_app_linux_cheatsheet.qmd"],
        )

    def test_deck_name(self):
        self.assertEqual(gen_decks.deck_name("/content/current_mirror/_sec_current_mirror.qmd"), "current_mirror")
        self.assertEqual(gen_decks.deck_name("/content/appendix/_app_linux_cheatsheet.qmd"), "app_linux_cheatsheet")

    def test_chapter_title_strips_attributes(self):
        self.assertEqual(gen_decks.chapter_title(CHAPTER), "Current Mirror")
        self.assertEqual(gen_decks.chapter_title("# Biasing\n"), "Biasing")

    def test_bib_keys(self):
        bib = "@article{Widlar_1965,\n title={x}}\n@book{ Razavi_Analog_CMOS ,\n}"
        self.assertEqual(gen_decks.bib_keys(bib), {"Widlar_1965", "Razavi_Analog_CMOS"})

    def test_cites_bibliography_ignores_crossrefs(self):
        self.assertTrue(gen_decks.cites_bibliography(CHAPTER, {"Widlar_1965"}))
        self.assertFalse(gen_decks.cites_bibliography("see @sec-gmid-method", {"Widlar_1965"}))


class Rendering(unittest.TestCase):
    def test_render_deck(self):
        deck = gen_decks.render_deck("Circuit Designer's Etiquette", "/content/x/_sec_x.qmd", True)
        self.assertTrue(deck.startswith('---\ntitle: "Circuit Designer\'s Etiquette"\n'))
        self.assertIn("    path: slides/slides.lua\n", deck)
        self.assertIn("{{< include /content/_abbrv.qmd >}}\n{{< include /content/x/_sec_x.qmd >}}\n", deck)
        self.assertIn("::: {#refs}\n:::\n", deck)
        self.assertNotIn("#refs", gen_decks.render_deck("T", "/content/x/_sec_x.qmd", False))

    def test_render_index(self):
        index = gen_decks.render_index([("current_mirror", "Current Mirror")])
        self.assertIn("1. [Current Mirror](slides_current_mirror.html)\n", index)


class EndToEnd(unittest.TestCase):
    def make_project(self, tmp):
        root = Path(tmp)
        (root / "content/current_mirror").mkdir(parents=True)
        (root / "content/appendix").mkdir(parents=True)
        (root / "aicd.qmd").write_text(BOOK)
        (root / "references.bib").write_text("@article{Widlar_1965,\n}\n")
        (root / "content/current_mirror/_sec_current_mirror.qmd").write_text(CHAPTER)
        (root / "content/current_mirror/_fig_current_mirror.qmd").write_text("fig\n")
        (root / "content/appendix/_app_linux_cheatsheet.qmd").write_text("# Appendix: Linux Cheatsheet\n")
        return root

    def test_write_then_check_is_clean_and_drift_is_detected(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self.make_project(tmp)
            self.assertEqual(gen_decks.main(["--root", str(root)]), 0)
            self.assertTrue((root / "slides_current_mirror.qmd").exists())
            self.assertIn("#refs", (root / "slides_current_mirror.qmd").read_text())
            self.assertNotIn("#refs", (root / "slides_app_linux_cheatsheet.qmd").read_text())
            self.assertTrue((root / "slides.qmd").exists())
            self.assertEqual(gen_decks.main(["--root", str(root), "--check"]), 0)

            (root / "slides_current_mirror.qmd").write_text("edited")
            (root / "slides_stale.qmd").write_text("old")
            self.assertEqual(gen_decks.main(["--root", str(root), "--check"]), 1)

            self.assertEqual(gen_decks.main(["--root", str(root)]), 0)
            self.assertFalse((root / "slides_stale.qmd").exists())
            self.assertEqual(gen_decks.main(["--root", str(root), "--check"]), 0)


if __name__ == "__main__":
    unittest.main()
