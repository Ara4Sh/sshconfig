# sshconfig : ```ssc```
Minimal command to Add/Remove/list ssh aliases in $HOME/.ssh/config

to contribute please fork add your code and make a pull request. feel free to add something new and helpful

# Installation
SSC is available on Linux , BSD and OSX

```
curl -L http://git.io/sshconfig | bash 
```
 
# Usage

#### Add a Host(Alias) :
```
ssc add NAME USERNAME HOSTNAME [IdentityKey] [PORT]
ssc add NAME USERNAME HOSTNAME [PORT]
scc add NAME USERNAME HOSTNAME [IdentityKey]
```
PORT and Identitykey are optional , PORT is 22 by default and Identitykey is your ssh private key generating by ssh-keygen in $HOME/.ssh .

Example : 
``` 
ssc add arash root 192.168.0.100
ssc add arash1 root 192.168.0.101 /home/arash/.ssh/arash.pem
ssc add arash2 root 192.168.0.102 /home/arash/.ssh/arash2.pem 2223
```

#### Remove a Host(Alias) :
```
sshconfig remove NAME
```
Example :
```
ssc remove arash1
ssc remove arash2
```
#### List Existing Hosts(Aliases) :
List all Hosts(Aliases) :
```
ssc list
```

Show information for a Host(Alias) :

```
ssc list HOST
```
Example:
```
ssc list arash1
>> Host  arash1  HostName  192.168.0.101  User  root  Port  22   IdentityKey   /home/arash/.ssh/arash.pem
```

#### Version and information 

```
ssc version
```

# Change log
Version 1.6:
- Remove comments from confg file
- New name : ssc
- Now lists has colored output
- New install script
- Fixing config file in install script
 
# To do:

Connect to a host using sshconfig

Better output

Edit Host names

Search function with keyword

Share config with other Administrators

Adding autocomplete for bash and zsh

# ScreenShot
![alt scrsht](https://raw.githubusercontent.com/Ara4Sh/sshconfig/master/screenshot.png)
