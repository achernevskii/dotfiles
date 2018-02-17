# Dependencies

## Appearence

### Install the arc-theme
sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"
apt-get -qq update
apt-get -qq --assume-yes install arc-theme
rm -f -v /etc/apt/sources.list.d/arc-theme.list

# Config files copy

cp -r -f -v xfce4 ~/.config 
