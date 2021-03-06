#!/bin/bash
###########
#### This script should run everytime a new .img file has been written to SD card. 
#### before_image.sh creates trigger that start this script on next boot.
#### 

sudo raspi-config --expand-rootfs

sudo sed -i '/\/home\/pi\/after_image.sh/d' /etc/xdg/lxsession/LXDE-pi/autostart 

echo "Everyday boot ended gracefully, rebooting..."
sleep 1
sudo reboot
