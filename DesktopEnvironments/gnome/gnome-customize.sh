#!/bin/bash

################## SOURCES ###################
# https://wiki.archlinux.org/index.php/GNOME #
##############################################

# Set "Night Light" temperature to 4500
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 4500

# Show date in the top bar 
gsettings set org.gnome.desktop.interface clock-show-date true

# Merge window title bar into the activity bar.
yay -S gnome-shell-extension-no-title-bar
gnome-shell-extension-tool -e no-title-bar@franglais125.gmail.com

# Alt-tab switches windows only on current workspace
gsettings set org.gnome.shell.app-switcher current-workspace-only true

# Use Alt + Left Shift to change input layout
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Alt>Shift_L']"

# Power button now hibernates laptop
gsettings set org.gnome.settings-daemon.plugins.power power-button-action hibernate
