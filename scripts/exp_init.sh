#!/bin/bash
#init destination folder
mkdir $1
cd $1
mkdir build_logs
mkdir evaluation_results
mkdir execution_output_data
mkdir extracted_submissions
mkdir original_submissions
mkdir reference_input_data
mkdir reference_output_data
touch exp.conf
#go base 
cd ..


