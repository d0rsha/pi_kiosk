#!/bin/bash

# Install lightdm
apt list lightdm
sudo apt-get install -y lightdm

#Install plymouth
apt list plymouth
sudo apt-get install -y plymouth plymouth-themes
apt list pix-plym-splash
sudo apt-get install -y pix-plym-splash

# Setup splash image
sudo cp -f splash.png /usr/share/plymouth/themes/pix

# Setup config.txt
sudo sed -i '/disable_splash/d' /boot/config.txt
sudo echo "disable_splash=1" >> /boot/config.txt
sudo sed -i '/# Disable under-voltage warning/d' /boot/config.txt
sudo echo "# Disable under-voltage warning" >> /boot/config.txt
sudo sed -i '/avoid_warnings/d' /boot/config.txt
sudo echo "avoid_warnings=1" >> /boot/config.txt

# Setup cmdline.txt
if grep -Fxq 'splash quiet plymouth.ignore-serial-consoles logo.nologo vt.global_cursor_default=0' /boot/cmdline.txt ; then
  sudo echo 'splash quiet plymouth.ignore-serial-consoles logo.nologo vt.global_cursor_default=0' >> /boot/cmdline.txt
  sudo sed -i 's/console=tty1/console=tty3/g' /boot/cmdline.txt
fi  

# Setup plymouth
sudo sed -i '/message_sprite/d' /usr/share/plymouth/themes/pix/pix.script
sudo sed -i '/my_image/d' /usr/share/plymouth/themes/pix/pix.script

