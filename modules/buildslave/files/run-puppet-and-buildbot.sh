#!/bin/bash

# MOZILLA DEPLOYMENT NOTES
# - This file is distributed to all Linux test slaves by Puppet, and placed at
#   /home/cltbld/run-puppet-and-buildbot.sh
# - It lives in the 'buildslave' puppet module

# this sleep lets NetworkManager get the network running before we get started
sleep 60

tmp=`mktemp`
/usr/sbin/puppetd --onetime --no-daemonize --server $1 --logdest console --logdest syslog --color false &> $tmp
# XXX don't care about result - bug 884615
rm $tmp
su - cltbld -c 'python /usr/local/bin/runslave.py'
