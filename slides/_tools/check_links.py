#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2026 Harald Pretl
# Johannes Kepler University, Institute for Integrated Circuits
# SPDX-License-Identifier: Apache-2.0
"""Check that local links and images in the rendered slide decks resolve.

Usage: check_links.py [SITE_DIR]   (default: _site)
"""

import re
import sys
from pathlib import Path
from urllib.parse import unquote

REF_RE = re.compile(r'(?:src|data-src|href)="([^"#?]*)')
EXTERNAL_RE = re.compile(r"^[a-zA-Z][\w+.-]*:|^//")


def missing_targets(page):
    missing = set()
    for match in REF_RE.finditer(page.read_text(encoding="utf-8")):
        target = unquote(match.group(1))
        if not target or EXTERNAL_RE.match(target):
            continue
        if not (page.parent / target).exists():
            missing.add(target)
    return sorted(missing)


def main(argv=None):
    argv = sys.argv[1:] if argv is None else argv
    site = Path(argv[0] if argv else "_site")
    failed = 0
    for page in sorted((site / "slides").glob("*.html")):
        for target in missing_targets(page):
            print(f"{page.relative_to(site)}: missing {target}", file=sys.stderr)
            failed += 1
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
