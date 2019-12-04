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

while true
do
    echo -ne "\r"
    echo "wget -q --spider https://dashboard.projectngulia.org"
    if timeout 3 wget -q --spider https://dashboard.projectngulia.org > /dev/null; then
        break
    else
        for x in {1..3}; do
        for i in "${sping[@]}"
        do
            echo -ne "\r$i"
            sleep 0.25
        done; done
    fi
done

echo "<light-ping.sh> Established connection to https://dashboard.projectngulia.org"
echo "<light-ping.sh> Network online"
