#!/bin/bash

cd ~/Downloads

#You need python 3.4 or later, python2 is not supported. You also need libinput release 1.0 or later. Install prerequisites
sudo apt-get install xdotool wmctrl

sudo apt-get install libinput-tools

#install git
sudo apt-get install git

#Install this software:
git clone http://github.com/bulletmark/libinput-gestures
cd libinput-gestures
sudo ./libinput-gestures-setup install

#configuration
libinput-gestures-setup start
libinput-gestures-setup autostart

cp /etc/libinput-gestures.conf ~/.config/libinput-gestures.conf
nano ~/.config/libinput-gestures.conf
