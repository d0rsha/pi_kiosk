# Raspberry Kiosk
# !ToDo 
* Check if timer works.

1. Copy new image to SD card
```bash
# From the raspberry pi
sudo raspi-config
# Set autologin to desktop
# In interfaces -> Enable VNC 
#               -> Enable SSH
# Setup VNC: Login, enable cloud, Authentication -> VNC Password. Enscryption -> Always on
# Setup VNC: (use VNC password to connect to server, it's safer than using root user)
# Edit /boot/config comment out the line (remove black edges from screen)
# disable_overscan=1
```

2. On first boot ensure WiFi / ethernet connection is established
3. Run first_boot.sh
```bash
sudo chmod +x first_boot.sh
sudo ./first_boot.sh
# Check that all went well(?), reboot manually
```

4. Install the chromium kiosk with second_boot.sh

```bash
sudo chmod +x second_boot.sh
sudo ./second_boot.sh
# Check that all went well(?), reboot manually
```

5. Enjoy

## Create image from SD card
Run `before_image.sh` script before shuting down pi.  
To copy and shrink image follow guide on: http://www.aoakley.com/articles/2015-10-09-resizing-sd-images.php  
Observe the guide only works on linux OS.



# Info about sytemd
```bash
# ngulia-kiosk.service, ngulia-check-network.service, ngulia-check-network.timer requieres sudo access
# example: sudo systemctl start ngula-kiosk.service 

# ngula-spinner is accesible from pi user and does not require sudo access
# example: systemctl --user start ngulia-spinner.service 
```

# Links I used developing these services 
### systemd 
* https://vic.demuzere.be/articles/using-systemd-user-units/
* https://unix.stackexchange.com/questions/198444/run-script-every-30-min-with-systemd
* https://thepihut.com/blogs/raspberry-pi-tutorials/auto-starting-programs-on-the-raspberry-pi
* https://blockdev.io/raspberry-pi-2-and-3-chromium-in-kiosk-mode/

### FBpyGIF displaying .png or .gif to screen
* https://www.madebymany.com/stories/fun-with-systemd-running-a-splash-screen-shutting-down-screens-and-an-iot-product-service-with-python-on-raspberry-pi
* https://www.raspberrypi.org/forums/viewtopic.php?t=19817
* https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/
* https://www.shell-tips.com/2010/06/14/performing-math-calculation-in-bash/

### VNC
* https://www.raspberrypi.org/documentation/remote-access/vnc/