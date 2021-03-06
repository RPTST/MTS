#!/bin/bash
#
# Update system
#
sudo apt update && sudo apt upgrade -y
sudo rpi-update
#
# Standard terminal utils install
sudo apt install -y curl git ranger mc whowatch lsof nethogs fdupes bashtop  cheese steamlink ntfs-3g openssh openssh-server ffmpeg ettercap-graphical yersinia stress ccze tilde nmap original-awk gawk curl git wget zip unzip unrar-free trash-cli ioping chkrootkit fping lshw arping hping3 exa hexcurse ipcalc iftop wavemon bmon build-essential make cmake gcc g++ python3 python3-pip python2 tshark saidar xlsx2csv pwgen libcrack2 openjdk-11-jdk openjdk-11-jre
#
# Python2 pip install
mkdir ~/projects/
cd ~/projects/
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
sudo python2 get-pip.py
#
python3 -m pip install --upgrade --user s-tui
#
# Install ps-mem to see what your memory is doing
sudo wget -O /usr/local/bin/ps_mem https://raw.githubusercontent.com/pixelb/ps_mem/master/ps_mem.py
sudo chmod +x /usr/local/bin/ps_mem
tee -a ~/.bashrc <<< "export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:bin:/usr/games:/usr/local/games""
tee -a ~/.bashrc <<< "export PATH=$HOME/.local/bin:$HOME/.local/usr/bin:$PATH"
sudo ps_mem
#
# Install bat a more IDE color style cat command
wget https://github.com/sharkdp/bat/releases/download/v0.18.3/bat_0.18.3_arm64.deb
sudo dpkg -i bat_*.deb
bat /etc/profile
#
#
# install dependencies
cd ~/projects/
git clone --recursive https://github.com/andresgongora/synth-shell.git
cd ~/projects/synth-shell/
chmod +x setup.sh
# cd $HOME/projects/synth-shell
echo "i u n Y n n n"| ./setup.sh
#
wget -P ~/projects https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_arm64.deb
sudo dpkg -i lsd-musl_0.20.1_arm64.deb
sed -i "s/ls --color=auto/lsd/" $HOME/.bashrc
#
wget https://github.com/xxxserxxx/gotop/releases/download/v4.1.2/gotop_v4.1.2_linux_arm64.tgz
mkdir -p ~/.local/bin
cp gotop ~/.local/bin
#
