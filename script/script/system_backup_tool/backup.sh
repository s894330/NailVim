#!/bin/bash

echo "backup / ..."
sbin/partclone.ext4 -c -d -s /dev/sda1 -o sda1Root_$1.img

echo "backup /usr ..."
sbin/partclone.ext4 -c -d -s /dev/sda5 -o sda5Usr_$1.img

sync
sync
sync

echo "Done!"
