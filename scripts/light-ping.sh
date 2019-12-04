#!/bin/bash

seconds=0

while true
do
    wget -q --spider https://dashboard.projectngulia.org

    if [ $? -eq 0 ]; then
        break
    else
        sleep 1
    fi

    ((seconds++))
    if [ $seconds -eq 180 ]; then
	echo "<ligh-ping.sh> Connection timeout $seconds seconds. Restarting network."
	((seconds=0))
	
	echo "<ligh-ping.sh> Disable network interface"
	ip link set wlan0 down
	sleep 4
	echo "<ligh-ping.sh> Enable network interface"
	ip link set wlan0 up
    fi
done

echo "<light-ping.sh> Established connection to https://dashboard.projectngulia.org"
echo "<light-ping.sh> Network back online"