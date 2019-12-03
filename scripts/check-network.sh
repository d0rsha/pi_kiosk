#!/bin/bash 

timeout 5 /home/pi/light-ping.sh
RES=$?
echo "Exit code: $RES"
if [ "$RES" -eq "0" ]; then 
    echo "Network online"
    systemctl --user stop ngulia-spinner
else 
    echo "Network not available"
    systemctl --user start ngulia-spinner
    /home/pi/light-ping.sh
    systemctl --user stop ngulia-spinner
fi