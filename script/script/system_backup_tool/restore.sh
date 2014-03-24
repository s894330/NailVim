#!/bin/bash

echo "restore / ..."
sbin/partclone.ext4 -r -d -s sda1Root_$1.img -o /dev/sda1

echo "restore /usr ..."
sbin/partclone.ext4 -r -d -s sda5Usr_$1.img -o /dev/sda5

sync
sync
sync

echo "Done!"
