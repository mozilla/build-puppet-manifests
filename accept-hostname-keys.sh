#!/bin/bash

filename=$1

# valid_hostnames is a newline-separated list of node names (just hostname, no domain)
valid_hostnames=$(grep node ${filename} | grep -v default | sed -e 's/" inherits.*//' | sed -e 's/node "//')

# this will be a list of fqdns, either domain-specific, or build.mozilla.org
unaccepted_hosts=$(puppetca --list)

for host in ${unaccepted_hosts}; do
    # get the short (no domain) version
    short=$(echo "$host" | cut -d . -f 1)
    # and search for it among the valid_hostnames list
    if `echo "${valid_hostnames}" | grep -q "^${short}"`; then
        puppetca --sign $host
    fi
done
