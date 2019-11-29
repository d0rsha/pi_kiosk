#!/bin/bash

# Remove unnecessary packets 
sudo apt-get purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y
sudo apt-get purge smartsim java-common minecraft-pi libreoffice* -y
sudo apt-get clean -y
sudo apt-get autoremove -y

# Upgrade machine 
sudo apt-get update -y 
sudo apt-get upgrade -y 
sudo apt-get dist-upgrade -y 
sudo apt-get autoremove -y 
sudo apt-get autoclean -y 

# Install packets needed for chromium kiosk
apt list unclutter
sudo apt-get install -y unclutter
apt list sed
sudo apt-get install -y sed
apt list xdotool
sudo apt-get install -y xdotool
apt list chromium-browser
sudo apt-get install -y chromium-browser

# Open chromium to create folder-structure needed for scripts 
chromium-browser https://google.com &
sleep 5s

echo "First boot ended gracefully"
