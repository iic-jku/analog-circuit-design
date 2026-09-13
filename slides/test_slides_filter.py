# SPDX-FileCopyrightText: 2026 Harald Pretl
# Johannes Kepler University, Institute for Integrated Circuits
# SPDX-License-Identifier: Apache-2.0
"""Unit tests for slides/slides.lua, run through `quarto pandoc`."""

import subprocess
import unittest
from pathlib import Path

HERE = Path(__file__).resolve().parent
FILTER = HERE / "slides.lua"
FIXTURE = HERE / "fixtures" / "chapter.md"


def run_pandoc(to):
    proc = subprocess.run(
        ["quarto", "pandoc", str(FIXTURE), "-t", to, "--slide-level=2", "--lua-filter", str(FILTER)],
        capture_output=True, text=True, check=True,
    )
    return proc.stdout, proc.stderr


class RevealjsOutput(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.html, cls.stderr = run_pandoc("revealjs")

    def test_chapter_intro_becomes_titled_slide_with_preamble(self):
        self.assertIn('<h2>Chapter</h2>\n<div class="hidden">', self.html)

    def test_section_becomes_divider(self):
        self.assertIn('<section id="sec-part" class="title-slide slide level1">', self.html)

    def test_figure_slide_with_prose_in_notes(self):
        self.assertIn('<h2>Part</h2>\n<figure id="fig-a">', self.html)
        self.assertIn('<aside class="notes">\n<p>Some prose before the figure.</p>', self.html)

    def test_equation_slide_keeps_label_and_moves_text_to_notes(self):
        self.assertIn("{#eq-ab}", self.html)
        self.assertIn("It follows that [equation] which is nice.", self.html)

    def test_no_slide_figure_is_dropped(self):
        self.assertNotIn("fig-b", self.html)

    def test_solution_is_incremental_and_not_collapsed(self):
        self.assertIn('<li class="fragment">step one</li>', self.html)
        self.assertNotIn("collapse", self.html)

    def test_authored_slide_uses_its_heading(self):
        self.assertIn("<h2>Key points</h2>\n<ul>\n<li>bullet</li>", self.html)

    def test_external_ref_links_to_book_local_ref_untouched(self):
        self.assertIn('<a href="aicd.html#sec-elsewhere">Section (book)</a>', self.html)
        self.assertIn('data-cites="sec-part"', self.html)

    def test_section_without_atoms_keeps_prose_as_divider_notes(self):
        self.assertIn('<h1>Wrap-Up</h1>\n<aside class="notes">\n<p>Only prose here.</p>', self.html)

    def test_refs_slide(self):
        self.assertIn("<h2>References</h2>", self.html)

    def test_dense_slide_warning(self):
        self.assertIn("dense slide 'Part' (100 words, 0 figures)", self.stderr)


class NonRevealjsOutput(unittest.TestCase):
    def test_filter_is_noop_for_html(self):
        html, _ = run_pandoc("html")
        self.assertIn('<h1 id="sec-chap">Chapter</h1>', html)
        self.assertNotIn('class="notes"', html)


if __name__ == "__main__":
    unittest.main()
