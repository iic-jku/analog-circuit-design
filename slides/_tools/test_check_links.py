# SPDX-FileCopyrightText: 2026 Harald Pretl
# Johannes Kepler University, Institute for Integrated Circuits
# SPDX-License-Identifier: Apache-2.0
"""Unit tests for slides/_tools/check_links.py."""

import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import check_links  # noqa: E402


class MissingTargets(unittest.TestCase):
    def test_reports_only_missing_local_targets(self):
        with tempfile.TemporaryDirectory() as tmp:
            site = Path(tmp)
            (site / "slides").mkdir()
            (site / "xschem").mkdir()
            (site / "xschem" / "a.svg").write_text("")
            (site / "aicd.html").write_text("")
            deck = site / "slides" / "deck.html"
            deck.write_text(
                '<img data-src="../xschem/a.svg">'
                '<a href="../aicd.html#sec-x">book</a>'
                '<a href="https://example.com/x">web</a>'
                '<a href="#/references">anchor</a>'
                '<a href="mailto:a@b.c">mail</a>'
                '<a href="xschem/missing.sch">broken</a>'
                '<img src="../gmid/missing%20plot.png">'
            )
            self.assertEqual(
                check_links.missing_targets(deck),
                ["../gmid/missing plot.png", "xschem/missing.sch"],
            )

    def test_main_exit_code(self):
        with tempfile.TemporaryDirectory() as tmp:
            site = Path(tmp)
            (site / "slides").mkdir()
            (site / "slides" / "ok.html").write_text('<a href="ok.html">self</a>')
            self.assertEqual(check_links.main([str(site)]), 0)
            (site / "slides" / "bad.html").write_text('<a href="nope.html">x</a>')
            self.assertEqual(check_links.main([str(site)]), 1)


if __name__ == "__main__":
    unittest.main()
