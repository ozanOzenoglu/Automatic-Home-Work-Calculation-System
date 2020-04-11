#!/bin/bash
#enter orginal submissions folder
cd $1/original_submissions

#for all submissions
for i in `ls`
 do
 #if file is file
 if [ -f $i ]
  then
    #get file name
	filename=$(basename $i)
	filename=${filename%.*}
	#create file directory for extracting file 
	mkdir ../extracted_submissions/$filename  &>/dev/null
	#unzip zip file into extracted submissions
	unzip $i -d ../extracted_submissions/$filename  &>/dev/null
 fi
done

cd ../..

