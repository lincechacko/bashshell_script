#!/bin/bash
<<doc
Name :Lince Kuruvila Chacko
Date :20/09/2022
Description :script to print contents of file from given line number to next given number of lines.

Sample input :print_lines.sh 5 3 myfile.txt

sample output :

line number 5
line number 6
line number 7
doc
arr=()
if [ $# -eq 3 ]
then
    if [ -f $3 ]
    then
	line_len=`cat $3|wc -l`
	limit=$(($1+$2))
        start_line=$(($limit-1))
	if [ $limit -lt $line_len ]
	then
	  head -$start_line $3 | tail -$2
        else
	  echo Error: data.txt is having only 10 lines. file should have atleast 14 lines  
	
	fi
    fi
else 
    echo "Error: arguments missing!"
    echo "Usage: ./file_filter.sh start_line upto_line filename"
    echo "For eg. ./file_filter.sh 5 5 <file>"


fi
