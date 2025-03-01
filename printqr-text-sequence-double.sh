# This file is part of printqr.sh: bash script for generating and printing qr codes
# Copyright (C) 2024-2025  Vilgot Szasz Kero
# This program comes with ABSOLUTELY NO WARRANTY; for details see COPYRIGHT.txt


#!/bin/bash

# Define variables
TITLE=$1
SUFFIX_START=$2
SUFFIX_END=$3
MEDIA_SIZE="36x89mm"
TEXT_SIZE="15"

counter=0

for i in $(seq $SUFFIX_START $SUFFIX_END)
  do
	qrencode -o "qr"$i".jpg" "$i"

	convert -bordercolor white -border $TEXT_SIZE "qr"$i".jpg" "qr"$i".jpg"
	convert "qr"$i".jpg" -gravity North -pointsize $TEXT_SIZE -annotate 0 $i "qr"$i".jpg"
	convert "qr"$i".jpg" -gravity South -pointsize $TEXT_SIZE -annotate 0 "$TITLE" "qr"$i".jpg"

    if [ $counter -eq 1 ]; then
        convert qr*.jpg +append qrmerged.jpg
        lp "qrmerged.jpg" -o media=$MEDIA_SIZE
        rm qr*.jpg
        counter=0
    else
        counter=$((counter + 1))
    fi

  done

if [ $counter -eq 1 ]; then
    convert qr*.jpg +append qrmerged.jpg
    lp "qrmerged.jpg" -o media=$MEDIA_SIZE
    rm qr*.jpg
fi

rm qr*.jpg
