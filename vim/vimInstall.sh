#!/bin/bash

###########################
# Installing dependencies #
###########################

sudo apt-get install vim

# curl installation
sudo apt install curl --assume-yes

#cmake installation
sudo apt-get install build-essential cmake --assume-yes

#Python installation
sudo apt-get install python-dev python3-dev --assume-yes

########################
# General installation #
########################

# vim plug installation
# Download plug.vim and put it in the "autoload" directory.
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

chown $USERNAME /home/$USERNAME/.vim

cp -f -v config/.vimrc ~/
### INSTALL PLUGINS FIRST (:PlugInstall)

vim +source ~/.vimrc +qall
vim +PlugInstall +qall

#YouCompleteMe clang installation
sudo  ~/.vim/plugged/YouCompleteMe/install.py --clang-completer
