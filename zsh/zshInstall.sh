#!/bin/bash

###########################
# Installing dependencies #
###########################

# ZSH installation.
sudo apt-get -qq install zsh --assume-yes

# Making ZSH default shell 
read -r -p "Do you want to make ZSH your default shell? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
	sudo usermod -s /usr/bin/zsh $LOGNAME
	echo "Done."
        ;;
    *)
	echo "Aborting. You can do it in the future by executing the command:"
	echo "sudo usermod -s /usr/bin/zsh $LOGNAME"
        ;;
esac

# Needed for Oh-My-ZSH installation
sudo apt-get -qq install curl --assume-yes
sudo apt-get -qq install thefuck --assume-yes
# Oh-My-ZSH installation.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 

# git installation (for dracula colorscheme)
sudo apt-get -qq install git --assume-yes

# Dracula theme
git clone https://github.com/dracula/zsh.git
# Copy dracula theme for oh-my-zsh
cp -fv zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme

rm -fvr zsh
###########################
###########################

cp -fv config/.zshrc ~/
