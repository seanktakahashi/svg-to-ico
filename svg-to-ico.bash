#!/bin/bash
if [ $# -eq 0 ]; then
  echo "Usage: svg-to-ico.bash <icon.svg>"
  exit
fi

TMP_16=./tmp.ico-16.png
TMP_32=./tmp.ico-32.png
TMP_48=./tmp.ico-48.png
TMP_256=./tmp.ico-256.png

OUTPUT="${1%.svg}.ico"

if [ -f "$TMP_16" ] || 
  [ -f "$TMP_32" ] || 
  [ -f "$TMP_48" ] || 
  [ -f "$TMP_256" ]; then 
  echo "A tmp file already exits. rm it"
fi

rsvg-convert -h 16 $1 > $TMP_16
rsvg-convert -h 32 $1 > $TMP_32
rsvg-convert -h 48 $1 > $TMP_48
rsvg-convert -h 256 $1 > $TMP_256

magick convert $TMP_16 $TMP_32 $TMP_48 $TMP_256 -colors 256 $OUTPUT

rm $TMP_16
rm $TMP_32
rm $TMP_48
rm $TMP_256
