#!/bin/bash

# Setup chromium autolaunch
export DISPLAY=$DISPLAY

echo "###########################################"
echo "# Setup kiosk.service"
cp -f scripts/kiosk.sh /home/pi/kiosk.sh
sudo chmod +x /home/pi/kiosk.sh

sudo cp -f systemd-services/ngulia-kiosk.service /lib/systemd/system/ngulia-kiosk.service

cp -f scripts/ping.sh /home/pi/ping.sh
sudo chmod +x /home/pi/ping.sh

sudo systemctl stop ngulia-kiosk 
sudo systemctl disable ngulia-kiosk 
sudo systemctl enable ngulia-kiosk 

echo "###########################################"
echo "# Setup splashscreen"
cp -f splash.png /home/pi/splash.png
chmod +x scripts/splash.sh
sudo ./scripts/splash.sh

ehco "###########################################"
echo "# Setup background image"
cp -f background.png /home/pi/background.png
pcmanfm --set-wallpaper="/home/pi/background.png"

echo "###########################################"
echo "# Prepare for future copies of image (Run ./before_image.sh before creating image of SD card)"
cp -f before_image.sh /home/pi/before_image.sh
chmod +x /home/pi/before_image.sh
cp -f before_image.sh /home/pi/after_image.sh
chmod +x /home/pi/after_image.sh

echo "###########################################"
echo "# Spinner.service"
cp -f spinner/* /home/pi/Pictures/spinner/
cp -f scripts/spinner.sh /home/pi/spinner.sh
chmod +x /home/pi/spinner.sh
#mkdir -p ~/.config/systemd/user
cp -f systemd-services/ngulia-spinner.service /lib/systemd/system/ngulia-spinner.service
#systemctl --user daemon-reload

echo "###########################################"
echo "# Check-network.service"
cp -f scripts/check-network.sh /home/pi/check-network.sh
chmod +x /home/pi/check-network.sh
sudo cp -f systemd-services/ngulia-check-network.service /lib/systemd/system/ngulia-check-network.service
sudo cp -f systemd-services/ngulia-check-network.timer /lib/systemd/system/ngulia-check-network.timer

sudo systemctl stop ngulia-check-network.timer
sudo systemctl disable ngulia-check-network.timer
sudo systemctl daemon-reload
sudo systemctl enable ngulia-check-network.timer

cp -f scripts/light-ping.sh /home/pi/light-ping.sh
chmod +x /home/pi/light-ping.sh

echo "###########################################"
echo "### second_boot.sh done, plz reboot pi ####"
echo "###########################################"
# reboot
