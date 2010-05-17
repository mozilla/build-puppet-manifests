#!/bin/bash

PUPPET="puppet"

if ! which ${PUPPET} &>/dev/null; then
    echo "Couldn't find puppet executable, bailing..."
    exit 1
fi

for site in `ls site-*.pp`; do
    echo -n "Testing $site..."
    if `${PUPPET} --confdir=. --vardir=. --parseonly --loadclasses $site`; then
        echo "OK"
    fi
done
