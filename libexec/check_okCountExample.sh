#!/bin/bash
statusfile="/tmp/example.txt"
okCounter=`awk -F: '{print $1}' $statusfile|grep 0 |wc -l`
okString=`awk '/0:/' $statusfile|awk -F: '{$1=""; print $0}'|sed ':a;N;$!ba;s/\n/ \n/g'`

if [ "$okCounter" > "0" ]; then
	echo "OK - $okCounter Services OK| $okString"
	exit 0
fi
