#!/bin/bash 

timeout 5 /home/pi/light-ping.sh
RES=$?
echo "<check-network.sh> Exit code: $RES"
if [ "$RES" -eq "0" ]; then 
    echo "<check-network.sh> Network online"
else 
    echo "<check-network.sh> Network not available"
    /home/pi/spinner.sh &
    /home/pi/light-ping.sh
    killall FBpyGIF
fi
