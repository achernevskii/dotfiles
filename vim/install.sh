#!/bin/bash

###########################
# Installing dependencies #
###########################

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

### INSTALL PLUGINS FIRST (:PlugINatall)

#YouCompleteMe clang installation
~/.vim/plugged/YouCompleteMe/install.py --clang-completer
