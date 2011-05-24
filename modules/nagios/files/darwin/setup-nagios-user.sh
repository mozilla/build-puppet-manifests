#!/bin/bash

if [ -a /var/db/.puppet_nagios_user_setup ]
  then
    exit
  else
    /usr/bin/dscl localhost -create /Local/Default/Users/nagios
    /usr/bin/dscl localhost -create /Local/Default/Users/nagios UserShell /usr/bin/false
    /usr/bin/dscl localhost -create /Local/Default/Users/nagios UniqueID 510
    /usr/bin/dscl localhost -create /Local/Default/Groups/nagios
    /usr/bin/dscl localhost -create /Local/Default/Groups/nagios UniqueID 1010
    touch /var/db/.puppet_nagios_user_setup
fi


