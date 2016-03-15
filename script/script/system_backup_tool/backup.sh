#!/bin/bash

echo "backup / ..."
sbin/partclone.ext4 -c -d -s /dev/sda1 -o sda1Root_$1.img

sync
sync
sync

echo "Done!"
