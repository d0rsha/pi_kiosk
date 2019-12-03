#!/bin/bash 
timeout 5 /home/pi/light-ping.sh
RES=$?
echo "Exit code: $RES"
if [ "$RES" -eq "0" ]; then 
    echo "Network online"
    systemctl stop ngulia-spinner
else 
    echo "Network not available"
    systemctl start ngulia-spinner
    /home/pi/light-ping.sh
    systemctl stop ngulia-spinner
fi

exit 0