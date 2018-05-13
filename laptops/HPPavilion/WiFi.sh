sudo apt-get install git build-essential
git clone https://github.com/neurobin/MT7630E.git
cd MT7630E/
chmod +x install test uninstall
sudo ./install
cd ../
rm -fvr MT7630E/
