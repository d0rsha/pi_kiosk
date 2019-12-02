# Setup chromium autolaunch
export DISPLAY=$DISPLAY

sudo cp -f scripts/kiosk.sh /home/pi/kiosk.sh
sudo chmod +x /home/pi/kiosk.sh

sudo cp -f systemd-services/ngulia-kiosk.service /lib/systemd/system/ngulia-kiosk.service

sudo cp -f scripts/ping.sh /home/pi/ping.sh
sudo chmod +x /home/pi/ping.sh

sudo systemctl stop ngulia-kiosk 
sudo systemctl disable ngulia-kiosk 
sudo systemctl enable ngulia-kiosk 

# Setup splash
sudo cp -f scripts/splash.png /home/pi/splash.png
sudo chmod +x splash.sh
sudo ./splash.sh

# Setup background 
sudo cp -f background.png /home/pi/background.png
pcmanfm --set-wallpaper="/home/pi/background.png"

# Prepare for future copies of image 
sudo cp -f before_image.sh /home/pi/before_image.sh
sudo chmod +x /home/pi/before_image.sh
sudo cp -f before_image.sh /home/pi/after_image.sh
sudo chmod +x /home/pi/after_image.sh


########################
## Setup spinner service 

# Spinner
sudo cp -f spinner/* /home/pi/Pictures/spinner/
sudo cp -f scripts/spinner.sh /home/pi/spinner.sh
sudo chmod +x /home/pi/spinner.sh
sudo cp -f systemd-services/ngulia-spinner.service /lib/systemd/system/ngulia-spinner.service
#sudo systemctl enable ngulia-spinner (?)

# Check-network
sudo cp -f scripts/check-network.sh /home/pi/check-network.sh
sudo chmod +x /home/pi/check-network.sh
sudo cp -f systemd-services/ngulia-check-network.service /lib/systemd/system/ngulia-check-network.service
sudo cp -f systemd-services/ngulia-check-network.timer /lib/systemd/system/ngulia-check-network.timer
#sudo systemctl enable ngulia-spinner (?)
sudo systemctl enable ngulia-check-network.timer

# ReBoot
sudo reboot
