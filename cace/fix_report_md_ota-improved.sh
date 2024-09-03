#!/bin/bash
FILE=_docs/ota-improved_schematic.md
cp $FILE $FILE.tmp
# fix paths for Quarto rendering
sed 's#/ota#/cace/_docs/ota#g' $FILE.tmp > $FILE
# cp $FILE $FILE.tmp
# remove Unicode for Latex rendering
# iconv -c -f utf-8 -t ascii $FILE.tmp > $FILE
rm $FILE.tmp
