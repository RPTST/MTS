#!/bin/bash
#
# Installation
# For Ubuntu=>20.04
#
sudo add-apt-repository ppa:camel-neeraj/sysmontask
sudo apt update
sudo apt install sysmontask python3-pip
# Install psutil if Ubuntu<=20.04, other-wise skip this step(more info given below) :
pip3 install psutil          
sudo pip3 install -U psutil
