#!/bin/bash
clear
sudo df -lh
lodev=$(sudo losetup -f)
echo "found unused loop dev $lodev"
sudo losetup -P $lodev $RK3328_DIR/out/*.img
sudo rm -rf /mnt/friendlywrt-tmp
sudo mkdir -p /mnt/friendlywrt-tmp
sudo mount ${lodev}p1 /mnt/friendlywrt-tmp
sudo chown -R root:root /mnt/friendlywrt-tmp
sudo umount /mnt/friendlywrt-tmp
sudo losetup -d $lodev
exit 0
