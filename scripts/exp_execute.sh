#!/bin/bash

# go destination base
cd $1
#get command from exp.conf
command=$(cat exp.conf | grep "^execute_command" | awk -F "=" '{print($2)}')
#get referance input names into list array
list=(`ls "./reference_input_data"`)

#go into extracted_submissions
cd extracted_submissions
#for all extracted submissions
for i in `ls`
 do
 #if file is directory
 if [ -d $i ]
  then
  #enter the submission directory
	cd $i
	
	#for all referance input
	for inputname in "${list[@]}"
	do
		#create directory into execution output data with student id number
		mkdir ../../execution_output_data/$i &>/dev/null
		#execute command 
		(eval $command "../../reference_input_data/"$inputname "../../execution_output_data/$i/"$inputname".out") &>/dev/null
		
	done

	
	cd ..
	
 fi
done

#go base

cd ../..