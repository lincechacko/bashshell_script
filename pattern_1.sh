#!/bin/bash
<<doc
Name :Lince kuruvila Chacko
Date :18/09/1999
Description :pattern printing
Sample input : 4 (Test case 1) , 2 (Test case 2)
sample output :
1
12
123
1234

1
12

doc
read -p "enter the number of rows " n   #to enter the number of rows
for i in `seq $n`              #for loop for the rows
do
    for j in `seq $i`          #for loop for  columns
   do 
      echo -n "$j "            #printing the elements in the columns 
  done
  echo
done

