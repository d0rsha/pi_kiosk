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
    if ifconfig enxb827eb64eb3f | grep inet > /dev/null; then
	echo "Interface enxb827eb64eb3f is up!"
	break
    fi
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
echo " "
echo "Established connection to https://dashboard.projectngulia.org"
echo "Network online"
echo "Opening browser..."
echo "Please hold on"
sleep 2
echo "-------------[ Chromium kiosk ]------------" 
