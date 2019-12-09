#!/bin/bash

seconds=0

while true
do
    if timeout 20 wget -q --spider https://dashboard.projectngulia.org > /dev/null; then
        break
    else
        sleep 1
    fi

    ((seconds++))
    if [ $seconds -eq 180 ]; then
	echo "<w8-network.sh> Connection timeout $seconds seconds. Restarting network."
	((seconds=0))
	
	#echo "<w8-network.sh> Disable network interface"
	ip link set wlan0 down
	sleep 4
	#echo "<w8-network.sh> Enable network interface"
	ip link set wlan0 up
    fi
done

#echo "<w8-network.sh> Established connection to https://dashboard.projectngulia.org"
