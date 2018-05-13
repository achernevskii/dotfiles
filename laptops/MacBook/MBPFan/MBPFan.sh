#!/bin/bash

echo "Note down the lowest among the numbers for fan_min."
echo "Note down the highest among the numbers for fan_max."
cat /sys/devices/platform/applesmc.768/fan*_min
cat /sys/devices/platform/applesmc.768/fan*_max

echo "Note down the highest among the numbers you might obtain."
echo "Divide the number by 1000."
echo "The value you will obtain is max_temp value for mbpfan configuration."
echo "For example, I got 105000. Therefore, my max_temp is 105."
cat /sys/devices/platform/coretemp.*/hwmon/hwmon*/temp*_max

#https://github.com/dgraziotin/mbpfan/tags
wget -t 0 https://github.com/dgraziotin/mbpfan/archive/v2.0.2.tar.gz
tar xfvz v2.0.2.tar.gz
rm -v -f v2.0.2.tar.gz

cd mbpfan-2.0.2

#Install the build-essential package, which contains what is required for compiling basic source code like the one of mbpfan.
sudo apt-get update && sudo apt-get install build-essential

#Compile, install, and test mbpfan
make
sudo make install
sudo make tests

# Remove mbpfan insrtallation folder
cd ../
rm -f -v -r mbpfan-2.0.2

# Copy MBPFan dotfile ti it's destination folder
cp -f -v config/mbpfan.conf /etc/

#The content of the file will be the following:

#min_fan_speed = 2000    # default is 2000
#max_fan_speed = 6200    # default is 6200
#low_temp = 63            # try ranges 55-63, default is 63
#high_temp = 66            # try ranges 58-66, default is 66
#max_temp = 86            # do not set it > 90, default is 86
#polling_interval = 7    # default is 7

#sudo cp mbpfan.service /etc/systemd/system/
#sudo systemctl enable mbpfan.service
