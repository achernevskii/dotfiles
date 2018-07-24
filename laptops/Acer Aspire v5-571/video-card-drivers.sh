#!/bin/sh

# A script to install video drivers on manjaro linux

sudo mhwd -i pci video-hybrid-intel-nvidia-390xx-bumblebee

user=$USER

sudo gpasswd -a $user bumblebee

# TODO Checkout systemctl manual and this commands.
sudo systemctl enable bubmlebeed.service
sudo systemctl start bumblebeed.service
