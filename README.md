# sshconfig : ```ssc```
Minimal command to Add/Remove/list ssh aliases in $HOME/.ssh/config

to contribute please fork add your code and make a pull request. feel free to add something new and helpful

#Installation
``` curl -L http://git.io/sshconfig | bash ```

Available on Linux , BSD and OSX
 
#Usage
##Add a Host:
to add a host use the following command:

``` ssc add NAME USERNAME HOSTNAME [IdentityKey] [PORT] ```


#Example : 
##Add new Host block:
To add one new Host block
``` ssc add arash root 192.168.0.100```
```ssc add arash1 root 192.168.0.101 /home/arash/.ssh/id_rsa```
```ssc add arash2 root 192.168.0.102 /home/arash/.ssh/id_rsa 2223```

##Remove a Host:
To remove a Host just a name is enough

``` sshconfig remove NAME```
``` ssc remove arash1 ```

##List Existing Hosts 
Show Existing Hosts 

``` ssc list ```

Show information about a host

``` ssc list HOST ```
``` ssc list arash1 ```

##Version and information 

```ssc version```

#Change log
Version 1.6:
- Remove comments from confg file
- New name : ssc
- Now lists has colored output
- New install script
- Fixing config file in install script
 
#To do:

Adding autocomplete for bash and zsh

Better documentation

~~Colorful output~~

Connect to a host using sshconfig

~~adding more information when you use list command~~

~~duplicate entries~~

~~IdentityKey and Port conflicts~~

