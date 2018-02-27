#!/bin/bash
statusfile="/tmp/example.txt"
warningCounter=`awk -F: '{print $1}' $statusfile|grep 1 |wc -l`
warningString=`awk '/1:/' $statusfile|awk -F: '{$1=""; print $0}'|sed ':a;N;$!ba;s/\n/ \n/g'`

if [ "$warningCounter" -gt "0" ]; then
	echo "WARNING - $warningCounter Errors|  $warningString"
	exit 1
	elif [ "$warningCounter" == 0 ]; then
	echo "OK - 0 services with warning"
	exit 0
fi
