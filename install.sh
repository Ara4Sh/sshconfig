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
sshconfig=`which ssc`

#Setup source url
src="https://raw.githubusercontent.com/Ara4Sh/sshconfig/master/sshconfig"

#Setup log file 
LOG=/tmp/sshconfig.install.log

#Checking for dependencies
wget=`which wget`
curl=`which curl`
sudo=`which sudo`

success() {
        printf "\n  \033[32mSuccess: %s\033[0m\n\n" "$@"
        # exit 0
}

error() {
        printf "\n  \033[31mError: %s\033[0m\n\n" "$@"
        exit 1
}

print() {
        printf "  \033[36m%10s\033[0m : \033[90m%s\033[0m\n" "$1" "$2"
}

system() {
	echo "$@" >> $LOG
	eval "$@" 2>> $LOG
}

if [[ -f $sshconfig ]];then
	print "Upgrading SSC in next 5 seconds use CTRL-C to cancel"
	sleep 5
	system "sudo rm -f $sshconfig"
	system "sudo rm -f /usr/bin/sshconfig"
else
print "This is your first time using SSHCONFIG
Please remember that host blocks in your ~/.ssh/config file must be seperated with an empty line
for example : 

Host arash
	HostName 172.18.0.2
	User	root
	Port	22
	Identity /home/arash/arash.pem
	
Host shams
	HostName 172.18.0.3
	User root
	Port 2223

If you dont have any Hosts in your config file ignore this message"
fi

if [[ ! -f $sudo ]]; then
	error "Sudo is required please install it first"
	exit 1
fi

if [[ -f $wget ]]; then
	system "sudo $wget -O /usr/bin/ssc $src"
elif [[ -f $curl ]]; then
	system "sudo $curl -o /usr/bin/ssc $src"
else
	error "cURL and wget not found! please install one of them"
	exit 1
fi
system "sudo chmod 755 /usr/bin/ssc"
system "sudo ln -s /usr/bin/ssc /usr/bin/sshconfig"
if [[ $? -eq 0 ]]; then
	success "Thank you for using sshconfig , Now run \"ssc help\""
else
	error "Something wrong!! check /tmp/sshconfig.install.log for more information "
fi
