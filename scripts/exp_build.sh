#!/bin/bash
#go destination directory
cd $1
#read exp.conf
var=$(cat exp.conf)
#read build command line
build_command=$(echo "$var" | grep "^build_command")
#get into extracted_submissions
cd extracted_submissions
#gor all extracted submission
for i in `ls`
 do
#if i is directory
 if [ -d $i ]
  then
#enter into i
   cd $i
#create build logs for submission i
   mkdir ../../build_logs/$i &>/dev/null
#build the source code
   eval ${build_command#*=}   &>../../build_logs/$i/build.log
#exit from submission directory
   cd ..	
 fi
done

#go base
cd ../..




