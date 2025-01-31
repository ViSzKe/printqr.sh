#!/bin/bash

# Define variables
TITLE=$1
SUFFIX_START=$2
SUFFIX_END=$3
MEDIA_SIZE="36x89mm"
TEXT_SIZE="15"

for i in $(seq $SUFFIX_START $SUFFIX_END)
  do
	qrencode -o "qr"$i".jpg" "$i"

	convert -bordercolor white -border $TEXT_SIZE "qr"$i".jpg" "qr"$i".jpg"
	convert "qr"$i".jpg" -gravity North -pointsize $TEXT_SIZE -annotate 0 $i "qr"$i".jpg"
	convert "qr"$i".jpg" -gravity South -pointsize $TEXT_SIZE -annotate 0 "$TITLE" "qr"$i".jpg"

	lp "qr"$i".jpg" -o media=$MEDIA_SIZE
  done

rm qr*.jpg
