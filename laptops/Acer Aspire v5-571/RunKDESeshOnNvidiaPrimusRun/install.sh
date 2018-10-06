#!/bin/sh

sudo chmod a+x config/kde-primusrun.desktop
sudo mv config/kde-primusrun.desktop /usr/share/xsessions/

sudo chmod a+x config/primus-kde 
sudo mv config/primus-kde /usr/local/bin/
