#!/bin/bash
###########
### RUN SCRIPT BEFORE MAKING A COPY OF SD CARD 
### Ensures script runs on new copies of image
sudo echo "./home/pi/after_image.sh" >> /etc/xdg/lxsession/LXDE-pi/autostart

echo "After_image script done! You can now burn the image"
