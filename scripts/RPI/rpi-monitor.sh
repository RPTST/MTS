#!/bin/bash
#
# Install RPI monitor
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 2C0D3C0F
sudo wget http://goo.gl/vewCLL -O /etc/apt/sources.list.d/rpimonitor.list
sudo apt update
sudo apt install -y rpimonitor
sudo service rpimonitor stop
sudo service rpimonitor start
sudo service rpimonitor restart
sudo service rpimonitor status
echo -e "Open a browser"
echo -e "http://<IP_ADDRESS>:8888"
