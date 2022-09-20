#!/bin/bash
<<doc
Name :Lince Kuruvila Chacko
Date : 19/09/2022
Description : To print chess board
Sample input : 
sample output :
doc
for i in `seq 8` #for loop for generating the rows
do
    for j in `seq 8` #for loop for generating the columns
    do
        sum=$(($i+$j)) #taking sum of i th row and j th column
	mod=$(($sum%2))    #taking modulus of the sum
	if [ $mod -eq 0 ]  #checking the modulus equal to zero
	then                             
	    echo -e -n "\e[47m" " "  #printing white colour for even number
	else
	    echo -e -n "\e[40m" " "  #printing black colour for odd number
	fi
    done
    echo -e "\e[0m" " "
done

