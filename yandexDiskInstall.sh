# Yandex Disk installation                                                                                                                                    

if [ -n "$1" ]
then
	cloudFolderPath=$1
else
	cloudFolderPath=~/Cloud
fi

mkdir $cloudFolderPath
echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/yandex.list > /dev/null
wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | sudo apt-key add -
apt-get update
sudo apt-get install -y yandex-disk

yandex-disk token lexachsar

# Create autosteart script for Yandex Disk in /etc/init.d/
#sudo rm -f -v /etc/init.d/YADisk.autostart

#sudo touch /etc/init.d/YADisk.autostart
#echo "#!/bin/sh" >> /etc/init.d/YADisk.autostart
#echo "yandex-disk start -d=$cloudFolderPath" >> /etc/init.d/YADisk.autostart
# Make it executable.
#chmod ugo+x /etc/init.d/YADisk.autostart
# Configure the init system to run this script at startup.
#update-rc.d YADisk.autostart defaults

yandex-disk start -d=$cloudFolderPath
