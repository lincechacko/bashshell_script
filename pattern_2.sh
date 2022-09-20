#!/bin/bash
<<doc
Name : Lince Kuruvila Chacko
Date : 18/09/2022
Description :Read 'n' and generate a pattern.
Sample input : 4
sample output :

1
2 3
4 5 6
7 8 9 10
doc

read -p "enter the number of rows " n #enter the number of rows

x=0 #declaring the variable

for i in `seq $n` #for loop for generating the rows
do
    for j in `seq $i` #for loop for generating the columns
    do
	x=$(($x+1)) #incrementing the values

	echo -n "$x " #printing the values
    done
    echo
done


