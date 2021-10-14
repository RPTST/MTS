# remove the old dphys version
sudo /etc/init.d/dphys-swapfile stop
sudo apt-get remove --purge dphys-swapfile
# install zram
sudo wget -O /usr/bin/zram.sh https://raw.githubusercontent.com/novaspirit/rpi_zram/master/zram.sh
# set autoload
sudo sed -i -e '$i \ /usr/bin/zram.sh &\n' /etc/rc.local
# Make the script executable
sudo chmod +x /usr/bin/zram.sh
sudo nano /usr/bin/zram.sh
sudo reboot
