#!/bin/bash
# Test script
if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi

if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
    sudo -u $real_user mkdir test11
    sudo -u $real_user cd test11/
    sudo -u $real_user touch testme.txt
else
    real_user=$(whoami)
fi
