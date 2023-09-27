#!/bin/bash

###  if ghost script is not install then install it first using 
###  sudo apt install ghostscript

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile=compressed_file.pdf $1
#input_PDF_file.pdf
