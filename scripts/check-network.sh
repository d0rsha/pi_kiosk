#!/bin/bash 
sudo timeout 5 /home/pi/ping.sh
RES=$?
echo "Exit code: $RES"
if [ "$RES" -eq "0" ]; then 
    echo "Network online"
    sudo systemctl stop ngulia-spinner
else 
    echo "Network not available"
    sudo systemctl start ngulia-spinner
    sudo /home/pi/ping.sh
    sudo systemctl stop ngulia-spinner
fi

exit 0