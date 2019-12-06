#!/bin/bash
###########
### RUN SCRIPT BEFORE MAKING A COPY OF SD CARD 
### Ensures script runs on new copies of image
if sudo echo "/home/pi/after_image.sh" >> /etc/xdg/lxsession/LXDE-pi/autostart; then
    echo "After_image script done! You can now burn the image"
else
    echo "!!!!!!!!!!!!!!!! ERROR !!!!!!!!!!!!!!!!!!"
    echo "Exit-code: $?, did you forget sudo?"
    echo "Please re-run script with sudo ./before_image.sh"
fi
