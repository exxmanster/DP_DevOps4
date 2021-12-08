#!/bin/bash



 choose() { echo ${1:RANDOM%${#1}:1} $RANDOM; }

 pass_sc (){
        # choose '!@#$%^\&'
        # choose '0123456789'
        # choose 'abcdefghijklmnopqrstuvwxyz'
        # choose 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    for i in $( seq 1 $(( RANDOM )) )
    do
        choose '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
        choose '!@#$%^\&'
    done
         }
         
         
 
 pass(){
   for i in $( seq 1 $(( RANDOM )) )
    do
        choose '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    done   
        }
while getopts ":sc" opt; do
  case $opt in
    
   
    s)
       pass_sc | sort -R | head - ${LENGTH} | awk '{printf "%s",$1}'
   
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
 done
pass_sc | sort -R | head -5 | awk '{printf "%s",$1}'
 echo ""

