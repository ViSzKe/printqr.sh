# This file is part of printqr.sh: bash script for generating and printing qr codes
# Copyright (C) 2025-  Vilgot Szasz Kero
# This program comes with ABSOLUTELY NO WARRANTY; for details see COPYRIGHT.txt


#!/bin/bash

# Define variables
TITLE=$1
STRING_1=$2
STRING_2=$3
MEDIA_SIZE="36x89mm"
TEXT_SIZE="15"

# Generate QR code and temporarily save it as a .jpg
qrencode -o "qr1.jpg" "$STRING_1"
qrencode -o "qr2.jpg" "$STRING_2"

#Add borders and text
convert -bordercolor white -border $TEXT_SIZE "qr1.jpg" "qr1.jpg"
convert "qr1.jpg" -gravity North -pointsize $TEXT_SIZE -annotate 0 "$STRING_1" "qr1.jpg"
convert "qr1.jpg" -gravity South -pointsize $TEXT_SIZE -annotate 0 "$TITLE" "qr1.jpg"

convert -bordercolor white -border $TEXT_SIZE "qr2.jpg" "qr2.jpg"
convert "qr2.jpg" -gravity North -pointsize $TEXT_SIZE -annotate 0 "$STRING_2" "qr2.jpg"
convert "qr2.jpg" -gravity South -pointsize $TEXT_SIZE -annotate 0 "$TITLE" "qr2.jpg"

#Merge images
convert qr?.jpg +append qrmerged.jpg

#Print with defined dimensions
lp "qrmerged.jpg" -o media=$MEDIA_SIZE

#Delete image files
rm qr*.jpg
