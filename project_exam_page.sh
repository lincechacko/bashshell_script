#!/bin/bash
<<doc
Name :
Date :
Description :
Sample input :
sample output :
doc
#usr_name=(`cat username.csv | cut -d " " -f1`)
#passwrd2=(`cat password.csv | cut -d " " -f1`)

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
    usr_name=(`cat username.csv | cut -d " " -f1`)
    passwrd2=(`cat password.csv | cut -d " " -f1`)
    read -p "Enter the username " username_2
    length_2=${#usr_name[@]}
    length2=$(($length_2-1))
    for i in `seq 0 1 $length2`
    do
	if [ $username_2 = ${usr_name[$i]} ]
	then
	    flag2=1
	    usernamepos=$i
	fi
    done
    if [ $flag2 -eq 1 ]
    then
	read -s -p "Enter the password" passwrd21
	if [ $passwrd21 = ${passwrd2[$i]} ]
	then
	    echo "password match"

	else
	    echo "password is incorrect"
	    login
	fi
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
