#!/bin/bash

# https://github.com/NaveenSai29/abigroups

if [[ $(uname -o) == *'Android'* ]];then
	abigroups_ROOT="/data/data/com.termux/files/usr/opt/abigroups"
else
	export abigroups_ROOT="/opt/abigroups"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run abigroups type \`abigroups\` in your cmd"
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | auth : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $abigroups_ROOT/auth/usernames.dat 2> /dev/null || { 
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $abigroups_ROOT/auth/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $abigroups_ROOT
	bash ./abigroups.sh
fi
