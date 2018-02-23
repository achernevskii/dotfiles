#!/bin/bash

apt-get -qq --assume-yes update
apt-get -qq --assume-yes upgrade
apt-get install -qq --assume-yes ubuntu-restricted-extras

#install microsoft fonts
echo -en "\033[37;1;41m Microsoft Fonts \033[0m Installation \n"
apt-get -qq --assume-yes install msttcorefonts
fc-cache -fv

#install telegram
echo -en "\033[37;1;41m Telegram \033[0m Installation \n"
add-apt-repository -y ppa:atareao/telegram
apt-get -qq --assume-yes update
apt-get -qq --assume-yes install telegram

#install spotify
echo -en "\033[37;1;41m Spotify \033[0m Installation \n"
sudo apt-get-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt-get/sources.list.d/spotify.list
apt-get update
apt-get -qq --assume-yes install spotify-client

#install ssh
echo -en "\033[37;1;41m SSH \033[0m Installation \n"
apt-get -qq --assume-yes install ssh
#install flash for firefox
echo -en "\033[37;1;41m FlashPlayer(pepper flash) \033[0m (for Firefox) Installation \n"
apt-get -qq --assume-yes install browser-plugin-freshplayer-pepperflash
#install chrome
echo -en "\033[37;1;41m Chromium \033[0m Installation \n"
apt-get -qq --assume-yes install chromium-browser

#install unetbootin
echo -en "\033[37;1;41m Unetbootin \033[0m Installation \n"
add-apt-repository -y ppa:gezakovacs/ppa
apt-get update
apt-get -qq --assume-yes install unetbootin

#change virtual workspaces (unity option)
#echo -en "\033[37;1;41m Wirtual Workspaces Layout Changing (Ubuntu ONLY) \033[0m\n"
#dconf write /org/compiz/profiles/unity/plugins/core/vsize 1
#dconf write /org/compiz/profiles/unity/plugins/core/hsize 4

#install intellij idea
echo -en "\033[37;1;41m Intellij Idea \033[0m Installation \n"
add-apt-repository -y ppa:ubuntuhandbook1/apps
apt-get update
apt-get -qq --assume-yes install intellij-idea-community

#install octave
echo -en "\033[37;1;41m Octave \033[0m Installation \n"
apt-get -qq --assume-yes install octave

#install ru package for libreoffice
echo -en "\033[37;1;41m LibreOffice RU package \033[0m Installation \n"
apt-get -qq --assume-yes install libreoffice-l10n-ru

#install vim
echo -en "\033[37;1;41m Vim \033[0m Installation \n"
apt-get -qq --assume-yes install vim

#install g++
echo -en "\033[37;1;41m GCC \033[0m Installation \n"
apt-get -qq --assume-yes install g++

#install tmux
echo -en "\033[37;1;41m TMUX \033[0m Installation \n"
apt-get -qq --assume-yes install tmux

#install nmap
echo -en "\033[37;1;41m NMap \033[0m Installation \n"
apt-get -qq --assume-yes install nmap

#install git
echo -en "\033[37;1;41m Git \033[0m Installation \n"
apt-get -qq --assume-yes install git

#install xclip for github ssh key add
apt-get -qq --assume-yes install xclip

#install TrueCrypt
echo -en "\033[37;1;41m True Crypt \033[0m Installation \n"
git clone https://github.com/AuditProject/truecrypt-verified-mirror.git
cd truecrypt-verified-mirror/Linux
tar -xzvf truecrypt-7.1a-linux-console-x64.tar.gz
./truecrypt-7.1a-setup-console-x64

#install CryptSetup
echo -en "\033[37;1;41m Crypt Setup \033[0m Installation \n"
apt-get -qq --assume-yes install cryptsetup

#install workflowy
echo -en "\033[37;1;41m Workflowy \033[0m Installation \n"
wget https://github.com/workflowy/desktop/releases/download/v0.0.1/WorkFlowy-0.0.1-x86_64.AppImage
chmod a+x WorkFlowy.AppImage
./Workflowy.AppImage
rm -f -v Workflowy.AppImage

#install curl
echo -en "\033[37;1;41m Curl \033[0m Installation \n"
apt-get -qq --assume-yes install curl

#MySql installation
echo -en "\033[37;1;41m MySql \033[0m Installation \n"
apt-get -qq --assume-yes install mysql-server

#MySql-workbench installation
echo -en "\033[37;1;41m MySql-Workbench \033[0m Installation \n"
apt-get -qq --assume-yes install mysql-workbench

#PyCharm installation
echo -en "\033[37;1;41m PyCharm \033[0m Installation \n"
wget -t 0 https://download.jetbrains.com/python/pycharm-community-2017.3.3.tar.gz
tar -xzvf pycharm-community-2017.3.3.tar.gz --directory /opt/

echo -en "\033[37;1;41m Please, create desktop entry and close the applivation \033[0m\n"
/opt/pycharm-community-2017.3.3/bin/pycharm.sh
