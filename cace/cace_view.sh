#!/bin/bash
# --------------------------------------------------------
# Convert CACE Markdown report to HTML and open in browser
# --------------------------------------------------------
# SPDX-FileCopyrightText: 2025 Harald Pretl
# Johannes Kepler University, Department for Integrated Circuits
# SPDX-License-Identifier: Apache-2.0

if [ $# -eq 0 ]; then
    echo "Usage: $(basename "$0") <markdown-file>"
    echo "Converts a CACE Markdown report to HTML and opens it in the browser."
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "[ERROR] Input file <$1> not found!"
    exit 1
fi

if ! command -v pandoc >/dev/null 2>&1; then
    echo "[ERROR] pandoc not found!"
    exit 1
fi

FILEPATH=$(realpath "$1")
DIR=$(dirname "$FILEPATH")
BASE=$(basename "$1")
FILENAME="${BASE%.*}"

cd "$DIR" || exit 1

pandoc -f markdown -t html -o "$FILENAME.html" "$BASE"
xdg-open "$FILENAME.html" &
