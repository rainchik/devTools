#!/bin/bash
for HUNGRY_PROC in `bash ~/swap_use.sh`; 
do
DOCKER_PROC=`pstree  -s -p $HUNGRY_PROC  | grep $HUNGRY_PROC | awk -F"--" {'print $4'} | awk -F"(" {'print $2'} | sed 's/)//g'`
CONTAINER_ID=`ps aux | grep $DOCKER_PROC | grep -v grep | grep -oP "[a-z0-9]{64}" | uniq`
CONTAINER_NAME=`docker inspect $CONTAINER_ID | jq '.[]|.Name' -r | sed 's/\///g'`
docker ps | grep $CONTAINER_NAME
done

