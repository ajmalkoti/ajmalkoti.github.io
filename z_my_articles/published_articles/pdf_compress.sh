


input=$1
echo 'Input file is :'  $input

output='compress_'$input
echo 'Output file is :'  $output


echo "compression level are"
echo "screen   ~ 72dpi"
echo "ebook    ~ 150 dpi"
echo "prepress ~ 300 dpi"
echo "printer  ~ optimized similar to acrobat"  

quality=$2

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/$quality \
-dNOPAUSE -dQUIET -dBATCH -sOutputFile=$output $input





# compression level are
# /screen   ~ 72dpi
# /ebook    ~150 dpi
# /prepress ~300 dpi
# /printer  ~ optimized similar to acrobat 
