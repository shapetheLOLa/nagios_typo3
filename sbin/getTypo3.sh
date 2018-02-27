#!/bin/bash
#Author Jan Koch - jan@janwkoch.de

CURL=/usr/bin/curl
SED=/bin/sed
CLIENTS='changeme' # e.g. https://www.changeme.de/?type=898978, https://www.changeme2.de/?type=42348, ...
NAME=""
TOUCH=/usr/bin/touch

for client in $CLIENTS 
do
	NAME=$(  echo $client| cut -d"." -f2 )
	$CURL $client > /tmp/$NAME.txt
	$SED -i 's/|/\n/g' /tmp/$NAME.txt
done


