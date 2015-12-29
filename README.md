# sshconfig
Minimal command to Add/Remove/list ssh aliases in $HOME/.ssh/config

#Installation
It is a simple Shellscript to configure a file so download and place it in your $PATH. 
Binaries coming soon .

#Usage
##Add a Host:
to add a host use the following command:

``` sshconfig add NAME USERNAME HOSTNAME [IdentityKey] [PORT] ```


#Example : 
##Add new Host block:
To add one new Host block
``` sshconfig add arash root 192.168.0.100```

``` sshconfig add arash1 root 192.168.0.101 /home/arash/.ssh/id_rsa```

``` sshconfig add arash2 root 192.168.0.102 /home/arash/.ssh/id_rsa 2223```

``` sshconfig -a``` or ``` sshconfig a``` also works.

##Remove a Host:
To remove a Host just a name is enough

``` sshconfig remove NAME```

``` sshconfig remove arash1 ```

``` sshconfig -r``` or ```sshconfig r ``` also works.

##List Existing Hosts 
Show Existing Hosts 

```sshconfig list```

```sshconfig ls```

```sshconfig show```

##Version and information 

```sshconfig version```


#To do:

Better documentation

duplicate entries

New Featurs 
