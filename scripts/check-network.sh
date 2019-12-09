#!/bin/bash 
export XAUTHORITY=/home/pi/.Xauthority
export DISPLAY=:0

#echo "<check-network.sh> timeout 10s /home/pi/w8-network.sh"

if timeout 20 wget -q --spider https://dashboard.projectngulia.org > /dev/null; then
    #echo "<check-network.sh> Network online"
    systemctl stop ngulia-spinner
else 
    echo "<check-network.sh> Network not available"
    systemctl start ngulia-spinner
    ./home/pi/w8-network.sh
    echo "<check-network.sh> Network back online!"
    systemctl stop ngulia-spinner

    sleep 2

    #echo "<check-network.sh> search Chromium window, activate && refresh"
    set +e
    # supress err mess, bug: xdotool search fails on first try
    xdotool search --name " - Chromium" 2> /dev/null
    xdotool search --name " - Chromium" windowactivate && sleep 1 && xdotool keydown ctrl+F5 && xdotool keyup ctrl+F5
    set -e
fi

#echo "<check-network.sh> Ended gracefully"
