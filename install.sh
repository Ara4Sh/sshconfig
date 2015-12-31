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

#Setup source url
src="https://raw.githubusercontent.com/Ara4Sh/sshconfig/master/sshconfig"

#Setup log file 
LOG=/tmp/sshconfig.install.log

#Checking for dependencies
wget=`which wget`
curl=`which curl`
sudo=`which sudo`

if [[ -f $sshconfig ]]; then
	echo "sshconfig is already installed, in 5 seconds it will be update or you can use CTRL-C to cancel"
	sleep 5
fi

if [[ ! -f $sudo ]]; then
	echo "Sudo is required please install it first"
	exit 1
fi

system() {
    echo "$@" >> $LOG
    eval "$@" 2>> $LOG 
}

if [[ -f $wget ]]; then
	system "sudo $wget -O /usr/local/bin/sshconfig $src"
elif [[ -f $curl ]]; then
	system "sudo $curl -o /usr/local/bin $src"
else
	echo "cURL and wget not found! please install one of them"
	exit 1
fi
system "sudo chmod 755 /usr/local/bin/sshconfig"
if [[ $? -eq 0 ]]; then
	echo "Done, Now you can run \"sshconfig help\""
else
	echo "Something wrong!!"
fi
