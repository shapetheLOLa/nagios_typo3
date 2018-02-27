#!/bin/bash
#Author Jan Koch - jan@janwkoch.de 

CURL=/usr/bin/curl
SED=/bin/sed
CP=/bin/cp
CLIENTURL=""
NAME=""

if [ 0 != $(id -u) ]; then echo "This script must be run as root"; exit 1; fi

echo -n "Enter Client URL and press [ENTER]: "
read CLIENTURL

for client in $CLIENTURL
do
	### Create client file from okCount example file
	echo 'Creating Client Checks...'

	NAME=$( echo $client| cut -d "." -f2 )
	$CP /tmp/check_okCountExample.sh /usr/local/nagios/libexec/check_okCount${NAME^}.sh
	$SED -i 's/example/'$NAME'/g' /usr/local/nagios/libexec/check_okCount${NAME^}.sh

	### Create client file from warningCount example file

	$CP /tmp/check_warningCountExample.sh /usr/local/nagios/libexec/check_warningCount${NAME^}.sh
	$SED -i 's/example/'$NAME'/g' /usr/local/nagios/libexec/check_warningCount${NAME^}.sh

	### create client file from errorCount example file

	$CP /tmp/check_errorCountExample.sh /usr/local/nagios/libexec/check_errorCount${NAME^}.sh
	$SED -i 's/example/'$NAME'/g' /usr/local/nagios/libexec/check_errorCount${NAME^}.sh
	
	### Backup commands.cfg to /backup/ and put new client checks into commands.cfg
	echo 'Adding client checks to commands.cfg...'

	$CP /usr/local/nagios/etc/objects/commands.cfg "/backup/commands.cfg-Bak-$(date +"%m-%d-%y-%r")"
	$SED 's/Example/'${NAME^}'/g' /tmp/commandsExample.txt >> /usr/local/nagios/etc/objects/commands.cfg
	
	### Create new client config from example.cfg and put it into the servers folder of Nagios
	echo 'Creating Server config...'	

	$CP /tmp/example.cfg /usr/local/nagios/etc/servers/$NAME.cfg
	$SED -i 's/Example/'${NAME^}'/g' /usr/local/nagios/etc/servers/$NAME.cfg
	$SED -i 's/2example/'${NAME}'/g' /usr/local/nagios/etc/servers/$NAME.cfg
	
        echo 'Please add the typo3 URL to the CLIENTS row in /usr/local/sbin/getTypo3.sh if you haven't already, and restart nagios'
done




