#!/bin/bash

while true
do
    wget -q --spider https://dashboard.projectngulia.org

    if [ $? -eq 0 ]; then
        break
    else
        sleep 1 s
    fi
done

echo "<light-ping.sh> Established connection to https://dashboard.projectngulia.org"
echo "<light-ping.sh> Network back online"