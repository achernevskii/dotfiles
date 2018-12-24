#!/bin/bash

# Dependencies

sudo pacman -S --needed yay

#################################### SOURCES ##############################################
#1) https://wiki.archlinux.org/index.php/Steam/Game-specific_troubleshooting#Civilization_V #
#2) https://steamcommunity.com/app/8930/discussions/1/540744299662467088?ctp=2              #
###########################################################################################

# 1) If you are getting an instant crash/close upon launch, make sure you have the following packages installed:
yay -S --needed lib32-intel-tbb
sudo pacman -S --needed lib32-libcurl-compat lib32-libcurl-gnutls lib32-openal

# 2) edit the file /etc/pulse/daemon.conf and set 
# default-fragment-size-msec = 5
# Then remove ; at the start of line 
# And run command "pulseaudio -k"
sudo cp -fv "daemon.conf" /etc/pulse/
pulseaudio -k

