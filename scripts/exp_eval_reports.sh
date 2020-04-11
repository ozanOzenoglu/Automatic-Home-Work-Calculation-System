#!/bin/bash
#go destination directory
cd $1

rpath=$(cat exp.conf | grep report_path | awk -F "=" '{print($2)}')

cd evaluation_results
#create execution file
touch reports
# go back enter into referance output data
cd ../extracted_submissions
#fill array with file name in referance folder
homework=$(ls)



#in all homework
for i in $homework

do	
	#write student number in execution file first.
	echo -n $i: >>../evaluation_results/reports
	
	#enter execution output folder
	cd $i
	#if there is report file
	if [ -f $rpath ] ; then
		#get size of report.pdf
		result=$(du $rpath | awk -F " " '{printf($1)}')
		#if size is greater then 0 give one point else zero point.
		if [ $result != 0 ] ; then

			echo  "1" >> ../../evaluation_results/reports 	
		else
			echo "0" >> ../../evaluation_results/reports
		fi
	else
		#if report file does not exist give zero point
		echo  "0" >> ../../evaluation_results/reports 
	fi
	cd ..
	
done
#go base directory
cd ..
		
