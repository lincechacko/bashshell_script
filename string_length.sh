#!/bin/bash
<<doc
Name :Lince Kuruvila Chacko
Date :20/09/2022
Description :Script to print the length of each and every string using arrays
Sample input :string_length.sh hello hai how are you?
Sample output :
Length of string (hello) - 5
Length of string (hai) - 3
Length of string (how) - 3
Length of string (are) - 3
Length of string (you?) - 4
doc
arr=($@) #storing the values in the array
if [ $# -gt 0 ] #checking the input greater than 0
then
  for i in ${arr[@]} 
  do
      var=$i #storing the values in a variable
      len=${#var} #finding the lenght
      echo "Length of string ($var) -" $len
  done
else
  echo "Error : Please pass the arguments through command-line."   
fi


