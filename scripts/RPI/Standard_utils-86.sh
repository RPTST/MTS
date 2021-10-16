#!/bin/bash
# Update system
#
sudo apt update && sudo apt upgrade -y
sudo rpi-update
#
# Standard terminal utils install
sudo apt install -y bc curl ninja-build git ranger mc whowatch lsof nethogs fdupes  cheese steamlink ntfs-3g openssh-server ffmpeg ettercap-graphical stress ccze tilde nmap original-awk gawk curl git wget zip unzip unrar-free trash-cli ioping chkrootkit fping lshw arping hping3 exa hexcurse ipcalc iftop wavemon bmon build-essential make cmake gcc g++ python3 python3-pip python2 tshark saidar xlsx2csv pwgen libcrack2 openjdk-11-jdk openjdk-11-jre build-essential make cmake gcc g++ git curl wget htop ninja-build neofetch mosh screen bmon wavemon iftop ipcalc hexcurse exa hping3 arping lshw fping chkrootkit ioping trash-cli ranger mc whowatch lsof nethogs fdupes stress ccze tilde nmap original-awk gawk curl git wget zip unzip unrar-free tshark saidar xlsx2csv docx2txt pwgen libcrack2
sudo apt install -y gcc-arm-linux-gnueabihf
#
# Python2 pip install
mkdir ~/projects/
cd ~/projects/
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
sudo python2 get-pip.py
#
python3 -m pip install --upgrade --user s-tui
#
# install vulkan & dependencies
sudo apt install -y libxcb-randr0-dev libxrandr-dev
sudo apt install -y libxcb-xinerama0-dev libxinerama-dev libxcursor-dev
sudo apt install -y libxcb-cursor-dev libxkbcommon-dev xutils-dev
sudo apt install -y xutils-dev libpthread-stubs0-dev libpciaccess-dev
sudo apt install -y libffi-dev x11proto-xext-dev libxcb1-dev libxcb-*dev
sudo apt install -y bison flex libssl-dev libgnutls28-dev x11proto-dri2-dev
sudo apt install -y x11proto-dri3-dev libx11-dev libxcb-glx0-dev
sudo apt install -y libx11-xcb-dev libxext-dev libxdamage-dev libxfixes-dev
sudo apt install -y libva-dev x11proto-randr-dev x11proto-present-dev
sudo apt install -y libclc-dev libelf-dev git build-essential mesa-utils
sudo apt install -y libvulkan-dev ninja-build libvulkan1 python-mako
sudo apt install -y libdrm-dev libxshmfence-dev libxxf86vm-dev libunwind-dev
sudo apt install -y valgrind libzstd-dev vulkan-tools vulkan-utils
sudo apt install -y libxcb-glx0-dev libx11-xcb-dev libxcb-dri2-0-dev
sudo apt install -y libxcb-dri3-dev libxcb-present-dev

# remove old versions first
sudo rm -rf /home/pi/mesa_vulkan

# install meson
sudo apt purge meson -y
sudo pip3 install meson -y

# install mako
sudo pip3 install mako -y

# install v3dv
cd ~
git clone https://gitlab.freedesktop.org/mesa/mesa.git mesa_vulkan

# build v3dv (± 30 min)
cd mesa_vulkan
CFLAGS="-mcpu=cortex-a72 -mfpu=neon-fp-armv8" \
CXXFLAGS="-mcpu=cortex-a72 -mfpu=neon-fp-armv8" \
meson --prefix /usr \
    -D platforms=x11 \
    -D vulkan-drivers=broadcom \
    -D dri-drivers= \
    -D gallium-drivers=kmsro,v3d,vc4 \
    -D buildtype=release build
ninja -C build -j$(nproc)
sudo ninja -C build install
#
# Test that is all works do the following and install a dependency
    sudo apt-get install libassimp-dev

# download the demos
    git clone --recursive https://github.com/SaschaWillems/Vulkan.git  sascha-willems
    cd sascha-willems

# download some fonts
    python3 download_assets.py

# build the demos
    mkdir build; cd build
    cmake -DCMAKE_BUILD_TYPE=Debug  ..
    make -j$(nproc)
#
#    Install bpytop (a much better and more colorful htop command)
pip3 install bpytop -y
#
# Install ps-mem to see what your memory is doing
mkdir ~/projects/
cd ~/projects/
sudo wget -O /usr/local/bin/ps_mem https://raw.githubusercontent.com/pixelb/ps_mem/master/ps_mem.py
tee -a ~/.bashrc <<< "export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:bin:/usr/games:/usr/local/games""
tee -a ~/.bashrc <<< "export PATH=$HOME/.local/bin:$HOME/.local/usr/bin:$PATH"
sudo chmod +x /usr/local/bin/ps_mem
sudo ps_mem
#
# Install bat a more IDE color style cat command
wget https://github.com/sharkdp/bat/releases/download/v0.18.3/bat_0.18.3_armhf.deb
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
#
#filename=".bashrc"
#search="ls --color=auto"
#filename=".bashrc"
#search="ls --color=auto"
#replace="lsd"
#
#     mkdir $HOME/projects
#     cd $HOME/projects/
#     wget -P ~/projects https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_arm64.deb
#     sudo dpkg -i lsd_0.20.1_arm.deb
#     sed -i "s/$search/$replace/" $HOME/$filename
cd ~/projects/
wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-0.20.1-arm-unknown-linux-gnueabihf.tar.gz
tar -xf lsd-0.20.1-arm-unknown-linux-gnueabihf.tar.gz
cd
#wget https://github.com/xxxserxxx/gotop/releases/download/v4.1.2/gotop_v4.1.2_linux_arm64.tgz
wget https://github.com/xxxserxxx/gotop/releases/download/v4.1.2/gotop_v4.1.2_linux_arm7.tgz
tar -xf gotop_v4.1.2_linux_arm7.tgz
mkdir -p ~/.local/bin
cp gotop ~/.local/bin
gotop
#
#
#cd ~/projects/
# remove the old dphys version
#sudo /etc/init.d/dphys-swapfile stop
#sudo apt-get remove --purge dphys-swapfile
# install zram
#sudo wget -O /usr/bin/zram.sh https://raw.githubusercontent.com/novaspirit/rpi_zram/master/zram.sh
# set autoload
# sudo sed -i -e '$i \ /usr/bin/zram.sh &\n' /etc/rc.local
#sudo sed -i -e '$ i\/usr/bin/zram.sh &' /etc/rc.local
#sed -i '18i /usr/bin/zram.sh &' /etc/rc.local
# Make the script executable
#sudo chmod +x /usr/bin/zram.sh
#sudo nano /usr/bin/zram.sh
#
# Desktop enviroment install
sudo apt install -y xserver-xorg xfce4 xfce4-goodies
sudo systemctl set-default graphical.target.
sudo dpkg-reconfigure lightdm
sudo update-alternatives --config x-session-manager
sudo update-alternatives --config x-window-manager
#
# Setting up so there is a user dropdown for logins
lightname="/usr/share/lightdm/lightdm.conf.d/01_debian.conf"
lightsearch="greeter-hide-users=false"
lightreplace="greeter-hide-users=true"
sudo sed -i "s/$search/$replace/" $filename
#
# Install desktop apps
#
sudo apt install wget curl thunar mousepad lxterminal default-jdk default-jre bash-completion autojump cargo -y
#
# LSD for terminal
#
wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-0.20.1-arm-unknown-linux-gnueabihf.tar.gz
cargo install lsd
filename=".bashrc"
search="ls --color=auto"
replace="lsd"
sed -i "s/$search/$replace/" $HOME/$filename
#
# Fonts
#
cd ~/projects/
git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
sudo ./install.sh
sudo apt install -y fonts-font-awesome
mkdir -p ~/projects/fonts/
cd ~/projects/fonts/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SpaceMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Ubuntu.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/UbuntuMono.zip
unzip Meslo.zip -d ~/.local/share/fonts/
unzip RobotoMono.zip -d ~/.local/share/fonts/
unzip SpaceMono.zip -d ~/.local/share/fonts/
unzip Ubuntu.zip -d ~/.local/share/fonts/
unzip UbuntuMono.zip -d ~/.local/share/fonts/
#
# Themes
#
mkdir ~/.local/share/themes/
mkdir ~/Downloads/
cd ~/Downloads/
#
# Sysmontask
#
#sudo add-apt-repository ppa:camel-neeraj/sysmontask
#sudo apt update
#sudo apt install sysmontask python3-pip
# Install psutil if Ubuntu<=20.04, other-wise skip this step(more info given below) :
pip3 install psutil -y
sudo pip3 install -U psutil -y
#
# Flatpacks
#
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
latpak install -y --noninteractive flathub com.simplenote.Simplenote
latpak install -y --noninteractive flathub org.filezillaproject.Filezilla
#latpak install -y --noninteractive flathub org.gnome.Epiphany
#latpak install -y --noninteractive flathub com.github.Eloston.UngoogledChromium
#latpak install -y --noninteractive flathub io.gitlab.librewolf-community
#latpak install -y --noninteractive flathub io.mpv.Mpv
#latpak install -y --noninteractive flathub org.videolan.VLC
latpak install -y --noninteractive flathub com.rawtherapee.RawTherapee
latpak install -y --noninteractive flathub com.vscodium.codium
#latpak install -y --noninteractive flathub com.discordapp.Discord
#latpak install -y --noninteractive flathub com.skype.Client
#latpak install -y --noninteractive flathub us.zoom.Zoom
#latpak install -y --noninteractive flathub ch.protonmail.protonmail-bridge
#latpak install -y --noninteractive flathub org.mozilla.Thunderbird
#latpak install -y --noninteractive flathub ch.protonmail.protonmail-import-export-app
latpak install -y --noninteractive flathub org.ardour.Ardour
latpak install -y --noninteractive flathub org.atheme.audaciou
latpak install -y --noninteractive flathub com.github.wwmm.easyeffects
latpak install -y --noninteractive flathub org.gnome.Rhythmbox3
#latpak install -y --noninteractive flathub com.sublimetext.three
#latpak install -y --noninteractive flathub io.github.peazip.PeaZip
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/Raspbian_10.0/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/Raspbian_10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg > /dev/null
sudo apt update
sudo apt install -y albert
sudo apt install -y xrdp
sudo systemctl status xrdp
sudo adduser xrdp ssl-cert
#
