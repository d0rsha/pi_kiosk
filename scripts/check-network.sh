#!/bin/bash 
trap '[ "$pid" ] && kill "$pid"' EXIT

timeout 5 /home/pi/light-ping.sh
RES=$?
echo "Exit code: $RES"
if [ "$RES" -eq "0" ]; then 
    echo "Network online"
else 
    echo "Network not available"
    /home/pi/spinner.sh &
    /home/pi/light-ping.sh
fi


pid=$!
echo running once