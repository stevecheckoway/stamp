# stamp

Simple script relying on pdftk and ghostscript to add a published date stamp
to the first page of a PDF.

Usage: `bash stamp.sh 2018-05-12 input.pdf`

The file `input.pdf` is first moved to `input-orig.pdf` and then a new pdf is
written to `input.pdf`.
