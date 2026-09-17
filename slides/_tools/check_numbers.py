#!/usr/bin/env python3
# -------------------------------------------------
# Verify rendered numbering against slides/_tools/numbers.json
# -------------------------------------------------
# SPDX-FileCopyrightText: 2026 Harald Pretl
# Johannes Kepler University, Institute for Integrated Circuits
# SPDX-License-Identifier: Apache-2.0
#
# Usage:
#   python3 slides/_tools/check_numbers.py _site/<book>.html         # the book
#   python3 slides/_tools/check_numbers.py _site/slides/*.html       # the decks
#
# For every label found in an HTML file, the number Quarto printed must equal
# the book number in numbers.json. Decks additionally must not contain
# unresolved references (?@) or slides without any content.

import json
import re
import sys
from pathlib import Path

WINDOW = 3000  # characters after id="label" to search for the number


def printed_number(html, label, kind, prefix):
    """Number Quarto rendered for label, or None if label is absent."""
    i = html.find(f'id="{label}"')
    if i < 0:
        return None
    chunk = html[i:i + WINDOW]
    if kind == "sec":
        m = re.search(r'data-number="([\d.]+)"', chunk[:300])
    elif kind == "eq":
        m = re.search(r"\\tag\{([\d.]+)\}", chunk)
    else:
        m = re.search(prefix + r"&nbsp;([\d.]+)", chunk)
    return m.group(1) if m else "?"


def check_file(path, labels, prefix):
    html = Path(path).read_text(encoding="utf-8")
    errors = []
    found = 0
    for label, info in labels.items():
        got = printed_number(html, label, info["type"], prefix[info["type"]])
        if got is None:
            continue
        found += 1
        if got != info["number"]:
            errors.append(f"{label}: rendered {got}, book {info['number']}")
    if Path(path).parent.name == "slides" and Path(path).name != "index.html":
        if "?@" in html:
            errors.append("unresolved reference (?@) present")
        empty = re.findall(r'<section class="slide level3[^"]*">\s*</section>', html)
        if empty:
            errors.append(f"{len(empty)} empty slide(s)")
    return found, errors


def main(argv):
    data = json.loads((Path(__file__).resolve().parent / "numbers.json").read_text())
    failed = False
    for path in argv:
        found, errors = check_file(path, data["labels"], data["prefix"])
        status = "FAIL" if errors else "ok"
        print(f"{status}  {path}: {found} labels checked")
        for e in errors:
            print("   ", e)
        failed |= bool(errors)
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
