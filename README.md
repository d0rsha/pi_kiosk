# Raspberry Kiosk

1. Use PiBakery to write simple.xml as image to SD card

```bash
# If you use other method to copy image:
sudo raspi-config
# Set autologin to desktop
```

2. On first boot ensure WiFi / ethernet connection is established
3. Run first_boot.sh

```bash
sudo chmod +x first_boot.sh
sudo ./first_boot.sh
```

4. Install the chromium kiosk with second_boot.sh

```bash
sudo chmod +x second_boot.sh
sudo ./second_boot.sh
```

5. Enjoy

## Create image from SD card

Run `before_image.sh` script before shuting down pi.  
To copy and shrink image follow guide on: http://www.aoakley.com/articles/2015-10-09-resizing-sd-images.php  
Observe the guide only works on linux OS.