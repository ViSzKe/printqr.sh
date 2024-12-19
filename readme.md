Requirements: qrencode, lp, imagemagick

This script generates a QR code with qrencode for a string and prints the code, the string (above the code) and a title (below the code) on a paper with lp.

qr.jpg is saved temporarily and edited with imagemagick step-by-step before lp prints it. The script then deletes the file(s).
There are 2 separate scripts, one for single printing and one for two on the same paper.

The paper's dimensions needs to be set in the script. You can also set the text/border size (15 is default).

You define the title and the string to generate a code for when calling the script.
´printqr-text.sh [title] [string]´
´printqr-text-double.sh [title] [string1] [string2]´
