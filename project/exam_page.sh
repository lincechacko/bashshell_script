#!/bin/bash
<<doc
Name :
Date :
Description :
Sample input :
sample output :
doc

function total
{
    lines4=`wc -l questions.txt | cut -d " " -f1`
    org4=(`cat crctanswer.csv | cut -d " " -f1`)
    usrans4=(`cat useranswer.csv | cut -d " " -f1`)
    len4=${#org4[@]}
    length4=$(($org4-1))
    j=0
    for i in `seq 5 5 $lines4`
    do
	head -$i questions.txt | tail -5
	while [ $j -lt $len4 ]
	do
	    echo "Correct answer is : ${org4[j]}"
	    echo "Marked answer is : ${usrans4[j]}"
	    j=$(($j+1))
	    break
	done
    done
}


function answer
{
    count=0
    org=(`cat crctanswer.csv | cut -d " " -f1`)
    usrans=(`cat useranswer.csv | cut -d " " -f1`)
    leng=${#org[@]}
    length3=$(($leng-1))
    for i in `seq 0 1 $length3`
    do
	if [ ${org[$i]} = ${usrans[$i]} ]
	then
	    count=$(($count+1))
	fi
    done
    echo "Total mark : $count"
    total
}

function question
{
line_no=`wc -l questions.txt | cut -d " " -f1`
for i in `seq 5 5 $line_no`
do
    head -$i questions.txt | tail -5 
    for j in `seq 10 -1 1`
    do
	echo -n -e "\r Enter the options $j \c"
	read -t1 opt
	if [ -z $opt ]
	then
	    opt=e
	else
	    break
	fi
    done
    echo $opt >> useranswer.csv
done
answer
}


function exam
{
echo "1.Take Test"
echo "2.Exit"
read -p "Enter the options" opt

case $opt in
    1)
	question
	;;
    2)
	starting_page
	;;
esac
}



function pass
{
    read -s -p "Enter the password" passwrd
    echo
    len=${#passwrd}
    if [ $len -lt 8 ]
    then
	echo "password is short"
	pass
    elif [ $len -ge 8 ]
    then
	read -s -p "Enter password to confirm" passwrd1
	echo
	if [ $passwrd == $passwrd1 ]
	then
	     echo $passwrd >> password.csv
	     starting_page
	 else
	     echo "Password doesnt match"
	     pass
	fi
    fi

}

function login
{
    flag2=0
    usrname2=(`cat username.csv | cut -d " " -f1`)
    passwrd2=(`cat password.csv | cut -d " " -f1`)
    read -p "Enter the username " username_2
    length=${#usrname2[@]}
    length2=$(($length-1))
    for i in `seq 0 1 $length2`
    do
	if [ $username_2 == ${usrname2[$i]} ]
	then
	    flag2=1
	    usernamepos=$i
	else
	    flag=0
	fi
    done
    if [ $flag2 -eq 1 ]
    then
	read -s -p "Enter the password" passwrd21
	echo
	if [ $passwrd21 == ${passwrd2[$usernamepos]} ]
	then
	    echo "Signin Success"
	    exam

	else
	    echo "password is incorrect"
	    login
	fi
    else
	echo "Username not registered please signup"
	starting_page
    fi

}


function signup
{
    flag=0
    usr_name=(`cat username.csv | cut -d " " -f1`)
    read -p "enter the username" user_name
    for i in ${usr_name[@]}
    do
	if [ $i = $user_name ]
	then
	    flag=1
	fi
    done
    if [ $flag -eq 1 ]
    then
	echo "username already registered"
	signup
    else
	echo $user_name >> username.csv
	pass
    fi

}


function starting_page
{
   echo "1.Signup"
   echo "2.Login"
   echo "3.Exit"
   read -p "Enter your choice " choice   
   case $choice in
      1)
	  signup
	  ;;
      2)
	  login
	  ;;
      3)
	  return
	  ;;
      *)
	  return
	  ;;
  esac
}
starting_page
