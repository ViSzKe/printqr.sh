#!/bin/bash

# Define variables
TITLE=$1
STRING_1=$2
STRING_2=$3
MEDIA_SIZE="36x89mm"
TEXT_SIZE="15"

# Generate QR code and temporarily save it as a .jpg
qrencode -o "qr1.jpg" "$STRING_1"

#Add borders and text
convert -bordercolor white -border $TEXT_SIZE "qr1.jpg" "qr1.jpg"
convert "qr1.jpg" -gravity North -pointsize $TEXT_SIZE -annotate 0 "$STRING_1" "qr1.jpg"
convert "qr1.jpg" -gravity South -pointsize $TEXT_SIZE -annotate 0 "$TITLE" "qr1.jpg"

#Print with defined dimensions
lp "qr1.jpg" -o media=$MEDIA_SIZE

#Delete image files
rm qr*.jpg
