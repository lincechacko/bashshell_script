#!/bin/bash
<<doc
Name :
Date :
Description :
Sample input :
sorting.sh -a 5 4 6 2 3 8 9 7 1
sample output :
1 2 3 4 5 6 7 8 9
doc
arr=($@)
temp=0
if [ $# -gt 0 ]
then
    if [ $1 = -a ]
    then
	for i in `seq $(($#-2))`
	do
	    for j in `seq $(($#-$i-1))`
	    do
		if [ ${arr[$j]} -gt ${arr[$j+1]} ]
		then
		    temp=${arr[$j]}
		    arr[$j]=${arr[$j+1]}
		    arr[$j+1]=$temp
		fi
	    done
	done
	echo ${arr[@]:1}
    elif [ $1 = -d ]
    then
	for i in `seq $(($#-2))`
         do
             for j in `seq $(($#-$i-1))`
             do
                 if [ ${arr[$j]} -lt ${arr[$j+1]} ]
                 then
                     temp=${arr[$j]}
                     arr[$j]=${arr[$j+1]}  
		     arr[$j+1]=$temp
		 fi
	     done
	 done
	 echo ${arr[@]:1}
    fi
fi
	




