#!/bin/bash

filename=$1

hostnames=$(grep node ${filename} | grep -v default | sed -e 's/.*"\(.*\)".*/\1/')
accepted_keys=$(puppetca --list --all | grep '+' | awk '{print $2}')

for host in ${hostnames}; do
    if ! `echo ${accepted_keys} | grep -q "${host}"`; then
        puppetca --sign $host
    fi
done
