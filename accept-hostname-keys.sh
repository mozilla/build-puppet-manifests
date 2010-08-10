#!/bin/bash

filename=$1

valid_hostnames=$(grep node ${filename} | grep -v default | sed -e 's/" inherits.*//' | sed -e 's/node "//')
unaccepted_hosts=$(puppetca --list)

for host in ${unaccepted_hosts}; do
    if `echo ${valid_hostnames} | grep -q "${host}"`; then
        puppetca --sign $host
    fi
done
