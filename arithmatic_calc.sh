#!/bin/bash
<<doc
Name : Lince Kuruvila Chacko
Date : 19/09/2022
Description : Arithmetic calculator using command line arguments
Sample input : 

1. ./arithmatic_calc.sh 25 + 41
2. ./arithmatic_calc.sh 10 x 5
3. ./arithmatic_calc.sh 25 / 5
4. ./arithmatic_calc.sh 10.2 – 5.6
5. ./arithmatic_calc.sh
6. ./arithmatic_calc.sh 3.4

sample output :

25 + 41 = 66

10 x 5 = 50

25 / 5 = 5.00

10.2 – 5.6 = 4.6

Error : Please pass the arguments through command line.
Usage:./arithmatic_calc.sh 2.3 + 6.7

Error:Please pass 3 arguments.
Usage:./arithmatic_calc.sh 2.3 + 6.7

doc

if [ $# -gt 0 ]                           #to check it has any elements
then
    if [ $# -eq 3 ]                       #to check it has 3 characters
    then
	case $2 in 
	    +)                                #case for addition
	      sum=`echo $1$2$3|bc`
      	      echo "$1 $2 $3 = "$sum
	      ;;
	    -)                                #case for subtraction
	      sub=`echo "scale=1;$1$2$3"|bc`
	      echo "$1 $2 $3 = "$sub
	      ;;
	    x)                                #case for multiplication
	      mul=`echo "$1*$3"|bc`
	      echo "$1 $2 $3 = "$mul
              ;;
	
	    /)                                #case for division
	      div=`echo "scale=2;$1$2$3"|bc`
	      echo "$1 $2 $3 = " $div
	      ;;

      esac
     else
         echo Error:Please pass 3 arguments.
	 echo Usage:./arithmatic_calc.sh 2.3 + 6.7
    fi
else
    echo Error : Please pass the arguments through command line.
    echo Usage:./arithmatic_calc.sh 2.3 + 6.7
fi
