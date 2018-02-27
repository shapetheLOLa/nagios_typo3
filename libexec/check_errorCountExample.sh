#!/bin/bash
statusfile="/tmp/example.txt"
errorCounter=`awk -F: '{print $1}' $statusfile|grep 2 |wc -l`
errorString=`awk '/2:/' $statusfile|awk -F: '{$1=""; print $0}'|sed ':a;N;$!ba;s/\n/ \n/g'`

if [ "$errorCounter" -gt "0" ]; then
	echo "CRITICAL - $errorCounter Services critical| $errorString"
	exit 2
	elif [ "$errorCounter" == 0 ]; then
	echo "OK - 0 services critical"
	exit 0
fi
