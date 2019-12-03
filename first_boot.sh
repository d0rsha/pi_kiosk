#!/bin/bash

echo "Remove unnecessary packets"
sudo apt-get purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y
sudo apt-get purge smartsim java-common minecraft-pi libreoffice* -y
sudo apt-get clean -y
sudo apt-get autoremove -y

echo "Upgrade machine"
sudo apt-get update -y 
sudo apt-get upgrade -y 
sudo apt-get dist-upgrade -y 
sudo apt-get autoremove -y 
sudo apt-get autoclean -y 

echo "Install packets needed for chromium kiosk"
apt list unclutter
sudo apt-get install -y unclutter
apt list sed
sudo apt-get install -y sed
apt list xdotool
sudo apt-get install -y xdotool
apt list chromium-browser
sudo apt-get install -y chromium-browser

echo "Open chromium to enfore first run installation and create folder-structure needed for scripts"
timeout 10 chromium-browser https://google.com

echo "First boot ended gracefully, rebooting now..."
echo "###########################################"
echo "## first.sh done, plz reboot your system ##"
echo "###########################################"
# reboot
