#!/bin/bash
#
# see http://code.google.com/p/tesseract-ocr/
# see http://www.sk-spell.sk.cx/tesseract-ocr-parameters-in-302-version
#
if [ $# != 1 ]; then
  echo "$0: PDF or image file is the only argument"
  exit 1
fi
output_folder='/tmp'
filename=$1
basename="${filename%.[^.]*}"
tmp_file_name="output`date +%s`"

convert -density 300 "$filename" -depth 8 $tmp_file_name.png

count=1
for file in `ls -1 $tmp_file_name*.png | sort -t "-" -n -k2,2`
do
  echo "Converting page $count in $filename to text ($file) ..."
  #tesseract $file "$output_folder/$basename-$count" $HOME/scripts/tesseract.config
  tesseract $file "$output_folder/$basename-$count"
  count=`expr $count + 1`
done
rm $tmp_file_name*.png
cat "$output_folder/$basename"*.txt > "$basename".txt
rm "$output_folder/$basename"*.txt

echo "CREATED '$basename.txt"
