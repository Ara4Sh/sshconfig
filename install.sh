#!/bin/bash
# Copyright (C) 2015 Arash Shams <xsysxpert@gmail.com>.
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
sshconfig=`which sshconfig`
CONFIGFILE="$HOME/.ssh/config"
BACKUPFILE="$HOME/.ssh/config.bak"
TEMPFILE="$HOME/.ssh/.install.tmp"
#Setup source url
src="https://raw.githubusercontent.com/Ara4Sh/sshconfig/master/sshconfig"

#Setup log file 
LOG=/tmp/sshconfig.install.log

#Checking for dependencies
wget=`which wget`
curl=`which curl`
sudo=`which sudo`

system() {
    echo "$@" >> $LOG
    eval "$@" 2>> $LOG
}

if [[ -f $sshconfig ]] && [[ $(sshconfig -v | grep --count 1.[1..5]) != 0 ]]; then
	echo "you are using old sshconfig, in 5 seconds your sshconfig will be upgrade and your config file ready to use or you can use CTRL-C to cancel"
	sleep 5
	system "cp $CONFIGFILE $BACKUPFILE"
	system "sed -e 's/^#.*//' $CONFIGFILE > $TEMPFILE"
	system "sed '/^$/N;/^\n$/D' $TEMPFILE > $CONFIGFILE"
	system "rm $TEMPFILE"
	system "sudo rm -f $sshconfig"
elif [[ -f sshconfig && $oldsshconfig = 0 ]];then
	echo "sshconfig already installed, in 5 seconds it will be upgrade or you can use CTRL-C to cancel"
	sleep 5
	system "sudo rm -f $sshconfig"
else
	echo -e "Seems this is your first time using SSHCONFIG\n"
	echo -e "Please remember that host blocks in your ~/.ssh/config file"
	echo -e "must be seperated with an empty line. Else SSHCONFIG can't work correctly"
	echo -e "for example\n"
	echo -e "Host arash
	HostName 172.18.0.2
	User	root
	Port	22
	Identity /home/arash/arash.pem
	
Host shams
	HostName 172.18.0.3
	User root
	Port 2223"
	echo -e "\nIf you dont have any Hosts in your config file ignore this message"
fi

if [[ ! -f $sudo ]]; then
	echo "Sudo is required please install it first"
	exit 1
fi

if [[ -f $wget ]]; then
	system "sudo $wget -O /usr/local/bin/ssc $src"
elif [[ -f $curl ]]; then
	system "sudo $curl -o /usr/local/bin/ssc $src"
else
	echo "cURL and wget not found! please install one of them"
	exit 1
fi
system "sudo chmod 755 /usr/local/bin/ssc"
system "ln -s /usr/local/bin/ssc /usr/local/bin/sshconfig"
if [[ $? -eq 0 ]]; then
	echo "Thank you for using sshconfig , Now you can run \"ssc help\""
else
	echo "Something wrong!!"
fi
