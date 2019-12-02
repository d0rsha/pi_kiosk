#############
## Spinner ##
sping[0]="- Waiting for filesystem to resize, system will reboot shortly   "
sping[1]="\\ Waiting for filesystem to resize, system will reboot shortly.  "
sping[2]="| Waiting for filesystem to resize, system will reboot shortly.. "
sping[3]="/ Waiting for filesystem to resize, system will reboot shortly..."
#############

while 1; do
for i in "${sping[@]}"
do
    echo -ne "\r$i"
    sleep 0.2
done; done
printf "\n%s\n"  "Filesystem resized. Rebooting now!"
