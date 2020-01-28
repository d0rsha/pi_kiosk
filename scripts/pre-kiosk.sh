#!/bin/bash
xset s noblank
xset s off
xset -dpms

echo "-------------[ Chromium kiosk ]------------" 
echo "Waiting for WiFi/ethernet connection..."
while true; do
    if ifconfig wlan0 | grep inet > /dev/null; then
	echo "Interface wlan0 is up!"
	break
    fi
    # Throws error ...
    # if ifconfig eth0 | grep inet > /dev/null; then
	# echo "Interface eth0 is up!"
	# break
    # fi
true; done
echo "Network is up!"
echo "Checking connection to server..."
echo "Please hold on"

i=0
while true
do
    i=$(expr $i + 1)
    echo -ne "\r <Test-ping: $i> wget -q --spider https://dashboard.projectngulia.org"
    if wget --quiet --timeout=10 --tries=4 --spider https://dashboard.projectngulia.org > /dev/null; then
        break
    fi
done

echo "<w8-network.sh> Established connection to https://dashboard.projectngulia.org"
echo "<w8-network.sh> Network online"
echo "Opening browser..."
echo "Please hold on"
sleep 1
echo "-------------[ Chromium kiosk ]------------" 
