#!/bin/bash
#
# Setting up box86
#
cd ~/projects/
git clone https://github.com/ptitSeb/box86.git
cd ~/projects/box86/
mkdir -p ~/projects/box86/build
cd build
#
# Install Box86
cmake .. -DRPI4=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
make
sudo make install
sudo systemctl restart systemd-binfmt
