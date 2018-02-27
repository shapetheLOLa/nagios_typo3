# nagios_typo3
#### Nagios Typo3 Monitoring



I didn't like the existing typo3 nagios monitoring solution so I created my own one.



This script uses the directorys used when nagios core is built from **source**.



Copy getTypo3.sh and createNewClient.sh to /usr/local/sbin/ and the other files to /tmp/

I've used "|" as separator in the typo3 file, which sed will use to create newlines. 

Add your client urls to the CLIENTS list in getTypo3.sh and run it once manually to create the txt file. After the getTypo3.sh script ran there should be a new .txt file in /tmp/ which should look like this : 

![typo3.tyt](https://image.ibb.co/dJCS0x/Bildschirmfoto_2018_02_27_um_12_58_04.png)

I know this is not the normal way for nagios to monitor hosts and services, but our developers prefered this over the normal typo3 nagios check. 

If you have questions, feel free to ask.

