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

while true
do
    echo -ne "\r"
    echo "wget -q --spider https://dashboard.projectngulia.org"
    if wget --quiet --timeout=4 --tries=2 --spider https://dashboard.projectngulia.org > /dev/null; then
        break
    fi
done

echo "<light-ping.sh> Established connection to https://dashboard.projectngulia.org"
echo "<light-ping.sh> Network online"
echo "Opening browser..."
echo "Please hold on"
echo "-------------[ Chromium kiosk ]------------" 
