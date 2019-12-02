#!bin/bash 
sudo timeout 5 /home/pi/ping.sh
echo "Exit code: $?"
if [ "$?" -eq "0" ]; then 
    echo "Network online"
    sudo systemctl stop ngulia-spinner.service
else 
    echo "Network not available"
    sudo systemctl start ngulia-spinner.sevice
    sudo /home/pi/ping.sh
    sudo systemctl stop ngulia-spinner.service
fi

exit 0