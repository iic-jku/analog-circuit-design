#!/bin/bash
FILE=_docs/ota-5t_schematic.md
cp $FILE $FILE.tmp
sed 's#/ota#/cace/_docs/ota#g' $FILE.tmp > $FILE
rm $FILE.tmp
