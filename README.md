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
ssc add elastix root 192.168.0.100
ssc add nginx root 192.168.0.101 /home/arash/.ssh/arash.pem
ssc add aws-haproxy root 192.168.0.102 /home/arash/.ssh/arash2.pem 2223
```

#### Remove a Host(Alias) :
```
sshconfig remove NAME
```
Example :
```
ssc remove nginx
ssc remove aws-haproxy
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
ssc list aws-haproxy
>> Host: aws-haproxy  HostName: 192.168.0.102  User: root  Port: 22   IdentityKey: /home/arash/.ssh/arash.pem
```
#### Search for a Host
```
ssc search haproxy
>> Host: haproxy-pars Hostname: 192.168.0.151 User: arash Port: 22 
>> Host: haproxy-afra Hostname: 192.168.1.151 User: arash Port: 22 
>> Host: aws-haproxy Hostname: 192.168.1.102 User: root Port: 22 
```
#### Connect to a Host 
You can connect to a host if exist: 
```
ssc aws-lsb
```
#### Edit a Host
Experimental feature 
```
ssc edit nginx-front
```

#### Version and information 

```
ssc version
```

# Change log
Version 1.8:
- New installer file 
- Edit option included (testing)
- pretty output
 
# To do:
Share config with other Administrators

# ScreenShot
![alt scrsht](https://raw.githubusercontent.com/Ara4Sh/sshconfig/master/screenshot.png)
