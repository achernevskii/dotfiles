#!/bin/bash

echo "Note down the lowest among the numbers for fan_min."
echo "Note down the highest among the numbers for fan_max."
cd /sys/devices/platform/applesmc.768/
cat fan*_min
cat fan*_max

echo "Note down the highest among the numbers you might obtain."
echo "Divide the number by 1000."
echo "The value you will obtain is max_temp value for mbpfan configuration."
echo "For example, I got 105000. Therefore, my max_temp is 105."
cat /sys/devices/platform/coretemp.*/hwmon/hwmon*/temp*_max

#https://github.com/dgraziotin/mbpfan/tags
cd ~/Downloads/
tar xfvz mbpfan-1.9.1.tar.gz
cd mbpfan-1.9.1

#Install the build-essential package, which contains what is required for compiling basic source code like the one of mbpfan.
sudo apt-get update && sudo apt-get install build-essential

#Compile, install, and test mbpfan
make
sudo make install
sudo make tests

sudo gedit /etc/mbpfan.conf

#The content of the file will be the following:

#min_fan_speed = 2000    # default is 2000
#max_fan_speed = 6200    # default is 6200
#low_temp = 63            # try ranges 55-63, default is 63
#high_temp = 66            # try ranges 58-66, default is 66
#max_temp = 86            # do not set it > 90, default is 86
#polling_interval = 7    # default is 7

sudo cp mbpfan.service /etc/systemd/system/
sudo systemctl enable mbpfan.service
