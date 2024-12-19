#!/bin/bash

# Define variables
STRING=$1
MEDIA_SIZE="36x89mm"

# Generate QR code and print it with specified media size
qrencode -o - "$STRING" | lp -o media=$MEDIA_SIZE

