#!/bin/bash -v
#
# see http://code.google.com/p/tesseract-ocr/
# see http://www.sk-spell.sk.cx/tesseract-ocr-parameters-in-302-version
#
if [ $# != 2 ]; then
  echo "$0: [1]=PDF or image file, [2]=output file name"
  exit 1
fi
output_folder='/tmp'
filename=$1
basename=`basename "${filename%.[^.]*}"`
#output_file=`echo $basename | sed 's/\(.*\)\..*/\1/'`.txt
output_file=$2
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
cat "$output_folder/$basename"*.txt > "$output_file"
rm "$output_folder/$basename"*.txt

if [[ -s $output_file ]] ; then
  echo "CREATED '$output_file"
else
  echo "$output_file is empty."
  exit -1
fi

