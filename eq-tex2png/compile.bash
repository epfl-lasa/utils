#!/bin/bash
ARGUMENT="$1"

ARGUMENT=${ARGUMENT%/}
if [[ -d $ARGUMENT ]]; then
	ARGUMENT="${ARGUMENT}/"
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

for fullfilename in $ARGUMENT*; do
	if [[ -d $fullfilename ]]; then
		echo "Skipping directory: $fullfilename"
		continue
	fi
	filename_with_extension=$(basename -- "$fullfilename")
	echo "Found: $filename_with_extension"
	cat "${SCRIPT_DIR}/prefix.tex" > tmp.tex
	cat "$fullfilename" >> tmp.tex
	cat "${SCRIPT_DIR}/suffix.tex" >> tmp.tex
	pdflatex -shell-escape -interaction=nonstopmode -file-line-error tmp.tex | grep ".*:[0-9]*:.*"
	filename="${filename_with_extension%.*}"
	convert -density 1200 -depth 8 -quality 1200 tmp.pdf "${filename}.png"
	echo "Wrote: ${filename}.png"
done
rm tmp.pdf tmp.aux tmp.log tmp.tex