#!/bin/bash
TOP10SWAP_LIST=`grep VmSwap /proc/*/status | sort -rn -k 2 | head`

IFS=$'\n'; 
for i in $TOP10SWAP_LIST; do 
PID_PROC=`echo $i | awk -F"/" '{print $3}'`;  
NAME_PROC=`ps -q $PID_PROC -o comm=`;
SWAP_USE=`echo $i|awk '{print $2}'`
echo $NAME_PROC" PID:"$PID_PROC" swap: "$SWAP_USE

done
