#!/bin/bash
set -euo pipefail
FILE="_docs/ota-5t_schematic.md"
TMP_FILE="${FILE}.tmp"

# Check if the file exists
if [[ ! -f "$FILE" ]]; then
  echo "[ERROR] File $FILE not found."
  exit 1
fi

cp "$FILE" "$TMP_FILE"
# Fix paths for Quarto rendering
sed 's#/ota#/cace/_docs/ota#g' "$TMP_FILE" > "$FILE"
cp "$FILE" "$TMP_FILE"

# Suppress numbering and listing of headings
sed '/^#/ s/$/ {.unnumbered .unlisted}/' "$TMP_FILE" > "$FILE"

# cp $FILE $FILE.tmp
# remove Unicode for Latex rendering
# iconv -c -f utf-8 -t ascii $FILE.tmp > $FILE

rm "$TMP_FILE"
