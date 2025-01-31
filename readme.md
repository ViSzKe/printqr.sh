Requirements: qrencode, lp, imagemagick

This script generates a QR code with qrencode for a string and prints the code, the string (above the code) and a title (below the code) on a paper with lp.

qr.jpg is saved temporarily and edited with imagemagick step-by-step before lp prints it. The script then deletes the file(s).
There are 4 separate scripts, one for 1 per paper, one for 2 on the same paper, and two for printing a sequence of codes either 1 or 2 on the same paper.

The paper's dimensions needs to be set in the script. You can also set the text/border size.

You define the title and the string to generate a code for when calling the script.
´printqr-text.sh [title] [string]´
´printqr-text-double.sh [title] [string1] [string2]´
´printqr-text-sequence.sh [title] [first number] [last number]´
´printqr-text-sequence-double.sh [title] [first number] [last number]´
