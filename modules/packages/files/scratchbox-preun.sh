#!/bin/sh

if [[ -e /builds/scratchbox/sbin/sbox_ctl ]]; then
    /builds/scratchbox/sbin/sbox_ctl stop
fi
if [[ -e /builds/scratchbox/sbin/sbox_umount_all ]]; then
    /builds/scratchbox/sbin/sbox_umount_all
fi
while [[ `mount | grep "^/builds/slave"` ]] ; do
    umount /builds/slave
    sleep 2
done
while [[ `mount | grep "^/home/cltbld/.ssh"` ]] ; do
    umount /home/cltbld/.ssh
    sleep 2
done
rm -rf /builds/scratchbox
rm -rf /scratchbox
