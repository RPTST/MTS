# Update system
#
sudo apt update && sudo apt upgrade -y
sudo rpi-update
#
# Standard terminal utils install
sudo apt install -y curl git ranger mc whowatch lsof nethogs bashtop fdupes stress ccze tilde nmap original-awk gawk curl git wget zip unzip unrar-free trash-cli ioping chkrootkit fping lshw arping hping3 exa hexcurse ipcalc iftop wavemon bmon build-essential make cmake gcc g++ python3 python3-pip python2 tshark saidar xlsx2csv pwgen libcrack2 openjdk-11-jdk openjdk-11-jre build-essential make cmake gcc g++ git curl wget htop ninja-build neofetch mosh screen bmon wavemon iftop ipcalc hexcurse exa hping3 arping lshw fping chkrootkit ioping trash-cli ranger mc whowatch lsof nethogs fdupes stress ccze tilde nmap original-awk gawk curl git wget zip unzip unrar-free tshark saidar xlsx2csv docx2txt pwgen libcrack2
sudo apt install gcc-arm-linux-gnueabihf
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
sudo apt install libxcb-randr0-dev libxrandr-dev
sudo apt install libxcb-xinerama0-dev libxinerama-dev libxcursor-dev
sudo apt install libxcb-cursor-dev libxkbcommon-dev xutils-dev
sudo apt install xutils-dev libpthread-stubs0-dev libpciaccess-dev
sudo apt install libffi-dev x11proto-xext-dev libxcb1-dev libxcb-*dev
sudo apt install bison flex libssl-dev libgnutls28-dev x11proto-dri2-dev
sudo apt install x11proto-dri3-dev libx11-dev libxcb-glx0-dev
sudo apt install libx11-xcb-dev libxext-dev libxdamage-dev libxfixes-dev
sudo apt install libva-dev x11proto-randr-dev x11proto-present-dev
sudo apt install libclc-dev libelf-dev git build-essential mesa-utils
sudo apt install libvulkan-dev ninja-build libvulkan1 python-mako
sudo apt install libdrm-dev libxshmfence-dev libxxf86vm-dev libunwind-dev
sudo apt install valgrind libzstd-dev vulkan-tools vulkan-utils
sudo apt install libxcb-glx0-dev libx11-xcb-dev libxcb-dri2-0-dev 
sudo apt install libxcb-dri3-dev libxcb-present-dev

# remove old versions first
sudo rm -rf /home/pi/mesa_vulkan

# install meson
sudo apt purge meson -y
sudo pip3 install meson

# install mako
sudo pip3 install mako

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
pip3 install bpytop
#
# Install ps-mem to see what your memory is doing
sudo wget -O /usr/local/bin/ps_mem https://raw.githubusercontent.com/pixelb/ps_mem/master/ps_mem.py
tee -a ~/.bashrc <<< "export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:bin:/usr/games:/usr/local/games""
tee -a ~/.bashrc <<< "export PATH=$HOME/.local/bin:$HOME/.local/usr/bin:$PATH"
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
wget -P ~/projects https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_arm64.deb
sudo dpkg -i lsd-musl_0.20.1_arm64.deb
sed -i "s/ls --color=auto/lsd/" $HOME/.bashrc
#
wget https://github.com/xxxserxxx/gotop/releases/download/v4.1.2/gotop_v4.1.2_linux_arm64.tgz
mkdir -p ~/.local/bin
cp gotop ~/.local/bin
#
