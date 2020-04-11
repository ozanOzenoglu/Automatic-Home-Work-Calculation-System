#!/bin/bash
#enter destination directory
cd $1
#get clean command
clean=$(cat exp.conf | grep clean_command | awk -F "=" '{print($2)}')

# delete all files that belong these folders 
rm -rf build_logs/*
rm -rf execution_output_data/*
rm -rf evaluation_results/*
#enter extracted submissions folder
cd extracted_submissions
#for all submissions execute clean command
for i in `ls`  ; do 
	if [ -d $i ] ; then
		cd $i
		eval $clean  
		cd ..
		
	fi
done

#go back base 
cd ../..
