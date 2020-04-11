#!/bin/bash

#go evaluation results directory

cd $1/evaluation_results
#create final_results file
touch final_results
#while reach end of
while read line
do
	#read line and parse it and write it as  [ number point ] 
	result=$(echo $line | awk -F ":" '{print($1 " " $2)}')
	#write result into final results
	echo -n $result" " >> final_results
	#get student id 
	no=$(echo $result | awk -F " " '{print($1)}' )
	#find execution points that belong student whose id is no
	point=$(cat execution | grep $no | awk -F ":" '{print($2)}')
	#write point into final results ( in append mode)
	echo $point >> final_results
	#read from reports file
done<reports 
#go base
cd ../..


  
