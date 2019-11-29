# Setup chromium autolaunch
export DISPLAY=$DISPLAY

sudo cp -f kiosk.sh /home/pi/kiosk.sh
sudo chmod +x /home/pi/kiosk.sh

sudo cp -f kiosk.service /lib/systemd/system/kiosk.service

sudo cp -f ping.sh /home/pi/ping.sh
sudo chmod +x /home/pi/ping.sh

sudo systemctl stop kiosk 
sudo systemctl disable kiosk 
sudo systemctl enable kiosk 
sudo systemctl status kiosk | cat
# sudo systemctl start kiosk &

# Setup splash
sudo cp -f splash.png /home/pi/splash.png
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

# ReBoot
sudo reboot
