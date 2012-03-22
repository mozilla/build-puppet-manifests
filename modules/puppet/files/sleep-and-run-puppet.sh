#!/bin/bash

# We sleep before running Puppet because there's no way to wait on network
# availability when launching through launchd.
sleep 60
/usr/bin/puppetd --verbose --no-daemonize --logdest console --color false --server $1
