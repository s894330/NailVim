#!/bin/bash

# get root rights
echo -n "Please enter password for sudo rights: "
read -s pass
echo ""
echo "backup / ..."
echo $pass | sudo -S partclone.ext4 -c -d -s /dev/sda1 -o sda1Root_$1.img

sync
sync
sync

echo "Done!"
