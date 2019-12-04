#!/bin/bash 
DISPLAY=:0

timeout 5 /home/pi/light-ping.sh
RES=$?
echo "<check-network.sh> Exit code: $RES"
if [ "$RES" -eq "0" ]; then 
    echo "<check-network.sh> Network online"
    systemctl stop ngulia-spinner
else 
    echo "<check-network.sh> Network not available"
    systemctl start ngulia-spinner
    ./home/pi/light-ping.sh
    systemctl stop ngulia-spinner
    sleep 2
    xdotool search --name " - Chromium" windowactivate %1 && sleep 1 && xdotool keydown ctrl+F5 && xdotool keyup ctrl+F5
fi

