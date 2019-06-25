#/bin/bash



sudo pacman -Sy --noconfirmy
sudo pacman -Su
# Dependencies needed for AUR packages compilation
sudo pacman -S --needed base-devel

mkdir build

#################################
#  Non automatic installation.  #
#  User interruption is needed. #
#################################

# Yandex Disk installation
cloudFolderPath=~/Cloud
mkdir $cloudFolderPath

cd build/
git clone https://aur.archlinux.org/yandex-disk.git
cd yandex-disk/
makepkg -sri
yandex-disk setup

cd ../../

# PyCharm installation
sudo pacman -Sy --noconfirm pycharm

# install TrueCrypt
sudo pacman -Sy --noconfirm truecrypt

# install VeraCrypt
sudo pacman -Sy --noconfirm veracrypt

# install workflowy
echo -en "\033[37;1;41m Workflowy \033[0m Installation \n"
wget -t 0 "https://github.com/workflowy/desktop/releases/download/v0.0.5/WorkFlowy-0.0.5-x86_64.AppImage"
chmod a+x WorkFlowy.AppImage
./Workflowy.AppImage
#rm -f -v Workflowy.AppImage

# MySql installation
echo -en "\033[37;1;41m MySql \033[0m Installation \n"
sudo pacman -Sy --noconfirm mariadb

#################################
#  Automatic installation begin #
#################################

# install microsoft fonts
echo -en "\033[37;1;41m Microsoft Fonts \033[0m Installation \n"
apt-get -qq --assume-yes install msttcorefonts
fc-cache -fv

# install telegram
echo -en "\033[37;1;41m Telegram \033[0m Installation \n"
sudo pacman -Sy --noconfirm telegram-desktop

# install spotify
#echo -en "\033[37;1;41m Spotify \033[0m Installation \n"
#sudo apt-get-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
#echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt-get/sources.list.d/spotify.list
#apt-get update
#apt-get -qq --assume-yes install spotify-client

# install ssh
echo -en "\033[37;1;41m SSH \033[0m Installation \n"
sudo pacman -Sy --noconfirm openssh
# install flash for firefox
echo -en "\033[37;1;41m FlashPlayer(pepper flash) \033[0m (for Firefox) Installation \n"
apt-get -qq --assume-yes install browser-plugin-freshplayer-pepperflash
# install chrome
echo -en "\033[37;1;41m Chromium \033[0m Installation \n"
sudo pacman -Sy --noconfirm chromium

# install unetbootin
echo -en "\033[37;1;41m Unetbootin \033[0m Installation \n"
#add-apt-repository -y ppa:gezakovacs/ppa
#apt-get update
#apt-get -qq --assume-yes install unetbootin

# change virtual workspaces (unity option)
# echo -en "\033[37;1;41m Wirtual Workspaces Layout Changing (Ubuntu ONLY) \033[0m\n"
# dconf write /org/compiz/profiles/unity/plugins/core/vsize 1
# dconf write /org/compiz/profiles/unity/plugins/core/hsize 4

# install intellij idea
echo -en "\033[37;1;41m Intellij Idea \033[0m Installation \n"
#add-apt-repository -y ppa:ubuntuhandbook1/apps
#apt-get update
#apt-get -qq --assume-yes install intellij-idea-community

# install octave
echo -en "\033[37;1;41m Octave \033[0m Installation \n"
sudo pacman -Sy --noconfirm octave

# install ru package for libreoffice
echo -en "\033[37;1;41m LibreOffice RU package \033[0m Installation \n"
sudo pacman -Sy --noconfirm libreoffice-fresh-ru

# install vim
echo -en "\033[37;1;41m Vim \033[0m Installation \n"
sudo pacman -Sy --noconfirm vim

# install g++
echo -en "\033[37;1;41m GCC \033[0m Installation \n"
sudo pacman -Sy --noconfirm gcc

# install tmux
echo -en "\033[37;1;41m TMUX \033[0m Installation \n"
sudo pacman -Sy --noconfirm tmux

# install nmap
echo -en "\033[37;1;41m NMap \033[0m Installation \n"
sudo pacman -Sy --noconfirm nmap

# install git
echo -en "\033[37;1;41m Git \033[0m Installation \n"
sudo pacman -Sy --noconfirm git

# install xclip for github ssh key add
sudo pacman -Sy --noconfirm xclip

# install CryptSetup
echo -en "\033[37;1;41m Crypt Setup \033[0m Installation \n"
sudo pacman -Sy --noconfirm cryptsetup

# install curl
echo -en "\033[37;1;41m Curl \033[0m Installation \n"
sudo pacman -Sy --noconfirm curl

# MySql-workbench installation
echo -en "\033[37;1;41m MySql-Workbench \033[0m Installation \n"
sudo pacman -Sy --noconfirm mysql-workbench

# Synergy installation
echo -en "\033[37;1;41m Synergy \033[0m Installation \n"
sudo pacman -Sy --noconfirm synergy

# htop installation
echo -en "\033[37;1;41m htop \033[0m Installation \n"
sudo pacman -Sy --noconfirm htop

# ranger installation
echo -en "\033[37;1;41m ranger \033[0m Installation \n"
sudo pacman -Sy --noconfirm ranger

# cmus installation
echo -en "\033[37;1;41m cmus \033[0m Installation \n"
sudo pacman -Sy --noconfirm cmus

# youtube-dl installation
#sudo wget https://yt-dl.org/latest/youtube-dl -O /usr/local/bin/youtube-dl
#sudo chmod a+x /usr/local/bin/youtube-dl
