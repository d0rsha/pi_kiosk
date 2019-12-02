#!/bin/bash
xset s noblank
xset s off
xset -dpms

#############
## Spinner ##
sping[0]="- Waiting for network   "
sping[1]="\\ Waiting for network.  "
sping[2]="| Waiting for network.. "
sping[3]="/ Waiting for network..."
#############

while ! timeout 0.2 ping -c 1 -n google.com &> /dev/null; do
for i in "${sping[@]}"
do
    echo -ne "\r$i"
    sleep 0.2
done; done
printf "\n%s\n"  "Network online!"