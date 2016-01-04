# sshconfig
Minimal command to Add/Remove/list ssh aliases in $HOME/.ssh/config

to contribute please fork add your code and make a pull request. feel free to add something new and helpful

#Installation
``` curl -L http://git.io/sshconfig | bash ```

Available on Linux , BSD and OSX
 
#Usage
##Add a Host:
to add a host use the following command:

``` sshconfig add NAME USERNAME HOSTNAME [IdentityKey] [PORT] ```


#Example : 
##Add new Host block:
To add one new Host block
``` sshconfig add arash root 192.168.0.100
sshconfig add arash1 root 192.168.0.101 /home/arash/.ssh/id_rsa
sshconfig add arash2 root 192.168.0.102 /home/arash/.ssh/id_rsa 2223```

##Remove a Host:
To remove a Host just a name is enough

``` sshconfig remove NAME
sshconfig remove arash1 ```

##List Existing Hosts 
Show Existing Hosts 

```sshconfig list```

Show information about a host

``` sshconfig list HOST
sshconfig list arash1 ```

##Version and information 

```sshconfig version```

#Change log
Version 1.5:
- List now shows all hosts with full information
- Show details of a host
- Change checking process
- Checking for host already exist
 
#To do:

Better documentation

Colorful output

Connect to a host using sshconfig

~~adding more information when you use list command~~

~~duplicate entries~~

~~IdentityKey and Port conflicts~~

