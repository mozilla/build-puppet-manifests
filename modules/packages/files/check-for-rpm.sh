#!/bin/bash

rpm=$1
creates=$2

if [[ -z $rpm || -z $creates ]]; then
    echo "Usage: [path to rpm] [file/dir the package creates]"
    exit 1
fi

name=`rpm -qpi $rpm | head -n1 | awk '{print $3}'`
# Check if the package (any version of it) is installed already
#rpm -ql $name &>/dev/null
#if [ $? == 0 ]; then
    # If it's installed, don't do anything, because forcing a different
    # version to be installed will prevent Puppet from installing it.
#    exit 0
#fi

if [ -e $creates ]; then
    cd /tmp
    wget -Orpm-$$.rpm $rpm
    rpm -i --justdb --ignoresize rpm-$$.rpm
    rm -f rpm-$$.rpm
fi
