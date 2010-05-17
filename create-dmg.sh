#!/bin/bash

PACKAGE_MAKER="/Developer/usr/bin/packagemaker"

DIR_TO_PACKAGE=$1
PACKAGE_BASENAME=$2
PACKAGE_SHORTNAME=$3
INSTALLDIR=$4

if [[ -z $DIR_TO_PACKAGE || -z $PACKAGE_BASENAME || -z $PACKAGE_SHORTNAME || -z $INSTALLDIR ]]; then
    echo "Usage: $0 dir-to-package package-base-name package-short-name installdir"
    exit 1
fi
if [[ ! -x $PACKAGE_MAKER ]]; then
    echo "Couldn't find packagemaker"
    exit 1
fi
if [[ ! -d $DIR_TO_PACKAGE ]]; then
    echo "$DIR_TO_PACKAGE doesn't exist or isn't readable"
    exit 1
fi
if [[ -e $PACKAGE_BASENAME.dmg ]]; then
    echo "$PACKAGE_BASENAME.dmg already exists"
    exit 1
fi

DIR_TO_PACKAGE=${DIR_TO_PACKAGE%/}
tmp=`mktemp -d -t magic`

trap "rm -rf $tmp" EXIT

rsync -av $DIR_TO_PACKAGE $tmp
echo $PACKAGE_MAKER -r $tmp -v -i com.mozilla.$PACKAGE_SHORTNAME -o $tmp/$PACKAGE_BASENAME.pkg -l $INSTALLDIR
$PACKAGE_MAKER -r $tmp -v -i com.mozilla.$PACKAGE_SHORTNAME -o $tmp/$PACKAGE_BASENAME.pkg -l $INSTALLDIR
rm -rf $tmp/`basename $DIR_TO_PACKAGE`
echo hdiutil makehybrid -hfs -hfs-volume-name "Mozilla $PACKAGE_BASENAME" -o ./$PACKAGE_BASENAME.dmg $tmp
hdiutil makehybrid -hfs -hfs-volume-name "Mozilla $PACKAGE_BASENAME" -o ./$PACKAGE_BASENAME.dmg $tmp
