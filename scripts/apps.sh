#!/bin/bash
# Commands that you don't want running as root would be invoked
# with: sudo -u $real_user
# So they will be run as the user who invoked the sudo command
# Keep in mind if the user is using a root shell (they're logged in as root),
# then $real_user is actually root
# sudo -u $real_user non-root-command
# Commands that need to be ran with root would be invoked without sudo
# root-command

if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi

if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
    # Install Terminal Apps
    apt install -y tshark saidar xlsx2csv docx2txt pwgen libcrack2 htop bmon wavemon iftop ipcalc hexcurse exa hping3 arping lshw fping chkrootkit ioping trash-cli ranger mc whowatch lsof nethogs fdupes stress ccze tilde nmap
    # Install Desktop Apps
    add-apt-repository ppa:pbek/qownnotes
    add-apt-repository ppa:d-bannon/ppa-tomboy-ng
    apt install darktable celluloid parole pinta krita mypaint gparted gdebi tomboy-ng qownnotes
    
else
    real_user=$(whoami)
fi
