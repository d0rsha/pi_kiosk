#!/bin/bash

echo "#####################################################"
echo "Remove unnecessary packets"
sudo apt-get purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y
sudo apt-get purge smartsim java-common minecraft-pi libreoffice* -y
sudo apt-get clean -y
sudo apt-get autoremove -y
echo " "

echo "#####################################################"
echo "Upgrade machine"
sudo apt-get update -y 
sudo apt-get upgrade -y 
sudo apt-get dist-upgrade -y 
sudo apt-get autoremove -y 
sudo apt-get autoclean -y 
echo "#####################################################"
echo " "

echo "Install packets needed for chromium kiosk"
apt list unclutter
sudo apt-get install -y unclutter
apt list sed
sudo apt-get install -y sed
apt list xdotool
sudo apt-get install -y xdotool
apt list chromium-browser
sudo apt-get install -y chromium-browser
# FBpyGIF
sudo apt install libjpeg62-turbo-dev libfreetype6-dev libwebp-dev -y
sudo apt install -y python3-pip
/usr/bin/yes | sudo pip3 install fbpygif
echo " "

echo "#####################################################"
echo "Open chromium to enfore first run installation and create folder-structure needed for scripts"
timeout 10 chromium-browser https://google.com
echo " "

echo "#####################################################"
echo "# allow-hotplug wlan0"
if cat /etc/network/interfaces | grep "allow-hotplug wlan0" > /dev/null; then
    echo "Already enabled"
else 
    echo "allow-hotplug wlan0" >> /etc/network/interfaces
fi
echo " "

echo "#####################################################"
echo "# Always use eth0 interface name for ethernet "
if  grep -Fxq 'net.ifnames=0' /boot/cmdline.txt > /dev/null ; then
    echo "# Switch to old naming scheme; "
    echo "# /!\ Ethernet interface should be named eth0 instead of en<MAC-ADDDRESS> after reboot /!\ "
    sudo echo " net.ifnames=0" >> /boot/cmdline.txt
fi
echo " "

echo "First boot ended gracefully, rebooting now..."
echo "################################################"
echo "## first_boot.sh done, plz reboot your system ##"
echo "################################################"
# reboot
