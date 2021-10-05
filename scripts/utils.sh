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
    # Install OS dependencies
    apt install -y build-essential make cmake gcc g++ git curl wget ninja-build neofetch default-jdk default-jre mosh screen original-awk gawk curl git wget zip unzip unrar-free bpytop
else
    real_user=$(whoami)
fi
