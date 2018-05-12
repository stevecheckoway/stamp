#!/usr/bin/env bash

set -e

if [ $# -ne 2 ]; then
	echo "Usage: $0 published_date pdf" >&2
	exit 1
fi

date="$1"
pdf="$2"
if [[ "$pdf" != *.pdf ]]; then
	echo "$0: '$2' does not have a .pdf extension, did you swap the arguments?" >&2
	exit 1
fi
orig="${pdf/%.pdf/-orig.pdf}"
mv "$pdf" "$orig"

gs \
	-q \
	-dAutoRotatePages=/None \
	-sDEVICE=pdfwrite \
	-sPAPERSIZE=letter \
	-sOutputFile=- \
	- <<EOF | pdftk "$orig" multistamp - output "$pdf"
/Helvetica-Bold findfont 12 scalefont setfont
.5 setgray
72 36 moveto
(Published $date) show
showpage
showpage
EOF
