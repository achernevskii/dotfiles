#!/bin/bash
sudo modprobe -r bcm5974
sudo modprobe bcm5974

dbus-launch
libinput-gestures-setup restart
