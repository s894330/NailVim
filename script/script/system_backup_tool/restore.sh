#!/bin/bash

# get root rights
echo -n "Please enter password for sudo rights: "
read -s pass
echo ""
echo "restore / ..."
echo $pass | sudo -S partclone.ext4 -r -d -s sda1Root_$1.img -o /dev/sda1

sync
sync
sync

echo "Done!"
