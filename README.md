# Raspberry Kiosk

# Operations 
```bash
sudo systemctl <action> <service>
sudo systemctl <stop | start | enable | disable> <ngulia-kiosk ngulia-check-network.service ngulia-check-network.timer | ngulia-spinner>
```
### Services
|                               |                                               |
|------------------------------|------------------------------------------------|
|**ngulia-kiosk.service**          |Chromium window |
|**ngulia-check-network.service**  |Check if system has network-access every 5 min|
|**ngulia-check-network.timer**    |Triggers ngulia-check-network.service|
|**ngulia-spinner.service**        |Display loading spinner on screen|
|                               |                                               |

### Actions 
|                               |                                               |
|-------------------------------|------------------------------------------------|
|**stop**                       | Stop the service if it's running |
|**start**                      | Start the service if it's not running |
|**disable**                    | Disable the service (service will no longer be triggerd by system events |
|**enable**                     | Enable the service, the service will now be triggered by system event |
|                               |                                               |

# Create image from SD card
Run `before_image.sh` script before shuting down pi.  
To copy and shrink image follow guide on: http://www.aoakley.com/articles/2015-10-09-resizing-sd-images.php  
Observe the guide only works on linux OS.


# Fresh installation
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
git clone https://github.com/d0rsha/pi_kiosk.git
cd pi_kiosk
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

# Info about sytemd
```bash
# systemd runs in the background and is accesible from systemctl interface
# ngulia-kiosk.service, ngulia-check-network.service, ngulia-check-network.timer, ngulia-spinner.service 
# example: sudo systemctl start ngula-kiosk.service 
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