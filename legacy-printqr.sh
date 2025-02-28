# This file is part of printqr.sh: bash script for generating and printing qr codes
# Copyright (C) 2025-  Vilgot Szasz Kero
# This program comes with ABSOLUTELY NO WARRANTY; for details see COPYRIGHT.txt


#!/bin/bash

# Define variables
STRING=$1
MEDIA_SIZE="36x89mm"

# Generate QR code and print it with specified media size
qrencode -o - "$STRING" | lp -o media=$MEDIA_SIZE

