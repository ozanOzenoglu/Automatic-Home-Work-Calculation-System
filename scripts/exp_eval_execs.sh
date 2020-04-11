#!/bin/bash
#go base
cd $1
cd evaluation_results
#create execution file
touch execution
# go back enter into referance output data
cd ../reference_output_data
#fill array with file name in referance folder
referance=$(ls)
#go back and enter into execution output data
cd ../execution_output_data


#fill array with the homework execution folder 
homework=$(ls)



#in all homework
for i in $homework

do	
	#write student number in execution file first.
	echo -n $i: >>../evaluation_results/execution
	
	#enter execution output folder
	cd $i
	

	# for all referance
	for j in $referance
	do
		
		#if file exist
		if [ -f $j ] ; then
			#calculate difference between referance outputdata with execution outputdata			
			if diff $j ../../reference_output_data/$j >/dev/null ; then
				echo -n '1 '>> ../../evaluation_results/execution 
			else
				echo -n '0 '>> ../../evaluation_results/execution 
			fi
		else
			#if file does not exist give zero point
			echo -n '0 '>> ../../evaluation_results/execution
			
		fi
			
	done
	#write newline character to get next line
	echo "" >> ../../evaluation_results/execution
	cd ..
		
done
#go base
cd ../.. 