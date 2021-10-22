#!/bin/bash
#
#
#
if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi
if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
#
DEVTOOLS() {
clear
echo "============= "
echo "System update"
echo "============= "
apt-get update
echo "============== "
echo "System updated"
echo "============== "
sleep 5
clear
echo "========================================= "
echo "Install base development tools"
echo "========================================= "
sleep 5
echo " "
apt install -y \
    build-essential openssh-server openssh-client make cmake gcc g++ git curl wget ninja-build \
    default-jdk default-jre mosh screen original-awk gawk curl git wget zip unzip unrar-free &&
clear
echo " "
echo "========================================= "
echo "Install base development tools"
echo "========================================= "
sleep 5
clear
}
#
#
STRSTERMINST () {
clear
echo "============= "
echo "System update"
echo "============= "
apt-get update
echo "============= "
echo "System update"
echo "============= "
sleep 5
clear
echo "========================================= "
echo "Installing Standard Terminal Apps"
echo "========================================= "
sleep 5
echo " "
apt-get install -y \
    pv tshark saidar xlsx2csv docx2txt pwgen neofetch libcrack2 htop bmon htop \
    wavemon iftop ipcalc hexcurse ncdu hping3 ntfs-3g arping lshw fping neofetch \
    curl wget iftop apt-transport-https unrar-free cifs-utils fuse3 gvfs-fuse gvfs-backends gvfs-bin \
    chkrootkit ioping trash-cli ranger mc whowatch lsof nethogs fdupes stress ccze tilde nmap &&
echo " "
echo "========================================= "
echo "Terminal Apps installed"
echo "========================================= "
sleep 5
clear
echo "========================================= "
echo "Installing GoTop App"
echo "========================================= "
sleep 5
echo " "
sudo -u $real_user mkdir ~/Projects
sudo -u $real_user cd ~/Projects
sudo -u $real_user wget https://github.com/xxxserxxx/gotop/releases/download/v4.1.2/gotop_v4.1.2_linux_amd64.tgz
sudo -u $real_user tar -xf gotop_v4.1.2_linux_amd64.tgz
mkdir -p /usr/local/bin/
mv gotop /usr/local/bin/gotop
echo " "
echo "========================================= "
echo "GoTop App installed"
echo "========================================= "
sleep 5
clear
}
#
#
ADDINSTPKGS () {
clear
echo "============= "
echo "System update"
echo "============= "
filenamea="sources.list"
searcha="bullseye main"
replacea="bullseye main contrib non-free"
sed -i "s/$searcha/$replacea/" /etc/apt/$filenamea
apt-get update
echo "============== "
echo "System updated"
echo "============== "
sleep 5
clear
echo "========================================= "
echo "Installing Non-Free Apps"
echo "========================================= "
echo " "
sleep 5
apt-get install -y \
    haveged less gdebi galculator grsync synaptic gparted bleachbit flac xorriso \
    faad faac mjpegtools x265 x264 mpg321 ffmpeg streamripper sox mencoder \
    dvdauthor twolame lame asunder aisleriot gnome-mahjongg gnome-chess dosbox \
    filezilla libxvidcore4 vlc obs-studio soundconverter hplip-gui cdrdao \
    frei0r-plugins jfsutils xfsprogs cdtool mtools clonezilla testdisk \
    cdrskin p7zip-full unrar-free keepassx hardinfo inxi gnome-disk-utility \
    simplescreenrecorder thunderbird simple-scan gimp gthumb remmina \
    gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-plugins-good \
    gnome-system-tools dos2unix dialog transmission-gtk handbrake \
    handbrake-cli pciutils zulumount-gui zulucrypt-gui zulupolkit \
    dirmngr openvpn network-manager-openvpn openvpn-systemd-resolved libqt5opengl5 &&
echo " "
echo "========================================= "
echo "Additional Non-Free software installed"
echo "========================================= "
sleep 5
clear
}
#
#
WIFI () {
clear
echo "============= "
echo "System update"
echo "============= "
apt-get update
echo "============= "
echo "System update"
echo "============= "
sleep 5
echo "========================================= "
echo "WIFI firmware installed"
echo "========================================= "
sleep 5
echo " "
apt-get -y install b43-fwcutter firmware-b43-installer firmware-b43legacy-installer
echo " "
echo "========================================= "
echo "WIFI firmware installed"
echo "========================================= "
sleep 5
clear
}
#
#
MMEDIA () {
clear
echo "============= "
echo "System update"
echo "============= "
apt-get update
echo "============== "
echo "System updated"
echo "============== "
sleep 5
clear
echo "========================================= "
echo "Installing multimedia repo"
echo "========================================= "
sleep 5
echo " "
echo 'deb http://www.deb-multimedia.org bullseye main non-free' | sudo tee /etc/apt/sources.list.d/dev-multimedia.list
wget https://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb
dpkg -i deb-multimedia-keyring_2016.8.1_all.deb
apt-get -y update
apt-get -y upgrade
echo " "
echo "========================================= "
echo "Added deb-multimedia.org to repos"
echo "========================================= "
sleep 5
clear
}
#
#
UPGDMO () {
clear
echo "============= "
echo "System update"
echo "============= "
apt-get update
aot-get upgrade -y
echo "============== "
echo "System updated"
echo "============== "
sleep 5
echo "========================================= "
echo "System fully upgraded!"
echo "========================================= "
sleep 5
clear
}
#
#
YTDLUP () {
clear
echo "============= "
echo "System update"
echo "============= "
apt-get update
echo "============== "
echo "System updated"
echo "============== "
sleep 5
clear
echo "========================================= "
echo "Installing YouTubeDL"
echo "========================================= "
sleep 5
echo " "
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/bin/youtube-dl
chmod a+rx /usr/bin/youtube-dl
echo " "
echo "========================================= "
echo "Updating Youtube-dl to the latest version"
echo "========================================= "
sleep 5
clear
}
#
#
ORACLE () {
clear
echo "============= "
echo "System update"
echo "============= "
apt-get update
echo "============== "
echo "System updated"
echo "============== "
sleep 5
clear
echo " "
echo "========================================= "
echo "Installing Oracle repo and latest java"
echo "========================================= "
sleep 5
clear
echo " "
sudo add-apt-repository ppa:linuxuprising/java
sudo apt install oracle-java17-installer --install-recommends
echo oracle-java17-installer shared/accepted-oracle-license-v1-3 select true | sudo /usr/bin/debconf-set-selections
echo " "
echo "========================================= "
echo "Enabled systemd-resolved service"
echo "========================================= "
sleep 5
clear
}
#
#
BPKERNEL () {
clear
echo "============= "
echo "System update"
echo "============= "
apt-get update
echo "============== "
echo "System updated"
echo "============== "
sleep 5
clear
echo "========================================= "
echo "Installing lastest back-port linux image and firmware"
echo "========================================= "
sleep 5
clear
echo " "
apt-get -y install -t bullseye-backports \
    firmware-linux firmware-linux-nonfree \
    linux-image-amd64 linux-headers-amd64 firmware-linux firmware-linux-nonfree firmware-misc-nonfree \
    firmware-misc-nonfree firmware-realtek firmware-atheros firmware-bnx2 firmware-bnx2x \
    firmware-brcm80211 firmware-ipw2x00 firmware-intelwimax firmware-iwlwifi firmware-bnx2 firmware-bnx2x \
    firmware-libertas firmware-netxen firmware-zd1211 gnome-nettool guvcview &&
echo " "
echo "========================================= "
echo "Newest kernel from backports installed"
echo "========================================= "
sleep 3
clear
}
#
#
FANCYSHELL () {
clear
echo "============= "
echo "System update"
echo "============= "
apt-get update
echo "============== "
echo "System updated"
echo "============== "
sleep 5
clear
echo "========================================= "
echo "Installing fancy shell"
echo "========================================= "
sleep 5
mkdir ~/projects/
cd ~/projects/
git clone --recursive https://github.com/andresgongora/synth-shell.git
cd synth-shell/
chmod +x setup.sh
echo "i u n Y n n n"| ./setup.sh
sleep 5
echo " "
echo "========================================= "
echo "fancy shell installed"
echo "========================================= "
sleep 5
clear
echo "========================================= "
echo "Installing new ls command"
echo "========================================= "
filename=".bashrc"
search="ls --color=auto"
replace="lsd"
wget -P ~/projects https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_arm64.deb
dpkg -i lsd-musl_0.20.1_arm64.deb
sed -i "s/$search/$replace/" ~/$filename
echo " "
echo "========================================= "
echo "New ls command installed"
echo "========================================= "
sleep 3
clear
}
#
#
CATCMDBAT () {
clear
echo "============= "
echo "System update"
echo "============= "
apt-get update
echo "============== "
echo "System updated"
echo "============== "
sleep 5
clear
echo "========================================= "
echo "Installing new cat command called bat"
echo "========================================= "
wget https://github.com/sharkdp/bat/releases/download/v0.18.3/bat_0.18.3_amd.deb -P /tmp/
dpkg -i bat_*.deb
bat /etc/profile
echo " "
echo "========================================= "
echo "New ls command installed"
echo "========================================= "
sleep 3
clear
}
#
#
XRTAFONTS () {
clear
echo "============= "
echo "System update"
echo "============= "
apt-get update
echo "============== "
echo "System updated"
echo "============== "
sleep 5
clear
echo "========================================= "
echo "Installing Nerd Font"
echo "========================================= "
sleep 5
echo " "
mkdir ~/Projects/
cd ~/Projects/
git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
bash install.sh
sleep 5
echo " "
echo "========================================= "
echo "Installing Awesome Font"
echo "========================================= "
apt-get install -y fonts-font-awesome
sleep 5
echo " "
echo "========================================= "
echo "Installing Extra Fonts"
echo "========================================= "
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SpaceMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Ubuntu.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/UbuntuMono.zip
unzip Meslo.zip -d /usr/local/share/fonts/
unzip RobotoMono.zip -d /usr/local/share/fonts/
unzip SpaceMono.zip -d /usr/local/share/fonts/
unzip Ubuntu.zip -d /usr/local/share/fonts/
unzip UbuntuMono.zip -d /usr/local/share/fonts/
echo " "
echo "========================================= "
echo "New Fonts installed"
echo "========================================= "
sleep 3
clear
}
#
#
LCPURGE () {
clear
echo "============= "
echo "System update"
echo "============= "
apt-get update
echo "============== "
echo "System updated"
echo "============== "
sleep 5
clear
echo "========================================= "
echo "Locals Purge to free up more Disk Space "
echo "========================================= "
apt-get install localepurge -y
localepurge
echo " "
echo "========================================= "
echo "Locals Purged!"
echo "========================================= "
sleep 3
clear
}
#
#
SYSMONTSK () {
clear
echo "============= "
echo "System update"
echo "============= "
apt-get update
echo "============== "
echo "System updated"
echo "============== "
sleep 5
clear
echo "========================================= "
echo "Installing Windows Modern System Monitor install"
echo "========================================= "
add-apt-repository ppa:camel-neeraj/sysmontask
apt update
apt install python3-pip sysmontask
pip3 install -U psutil -y
echo " "
echo "========================================= "
echo "Windows Modern System Monitor installed"
echo "========================================= "
sleep 3
clear
}
#
#
#
LXDEDSKINSTA () {
clear
echo "============= "
echo "System update"
echo "============= "
apt-get update
echo "============== "
echo "System updated"
echo "============== "
sleep 5
clear
echo "========================================= "
echo "Installing LXDE Desktop install"
echo "========================================= "
apt-get install -y \
    slim lightdm iceweasel lxterminal tint2 gsimplecal volumeicon nitrogen lxpanel task-lxde-desktop lxde software-properties-common \
    net-tools hsetroot qt5-style-plugins ttf-mscorefonts-installer scribus chromium dconf-editor fortune cowsay filezilla calibre \
    numix-gtk-theme greybird-gtk-theme breeze-icon-theme breeze-gtk-theme liferea shotcut aptitude synaptic arc-theme \
    audacity npm nemo praat gramps pdfchain syncthing git curl wget gdebi htop keepassxc openvpn thunar autossh icedove \
    vim emacs lxsession-default-apps libatk-adaptor libgail-common gedit gimp brasero libasound2 alsa-utils alsa-oss \
    alsa-tools-gui vlc libavcodec-extra-53 mpv mutter qt5ct timeshift firefox-esr galculator gdisk gnome-disk-utility \
    gnome-screenshot nemo nano papirus-icon-theme nvidia-detect libqt5opengl5 xinit xserver-xorg xorg xserver-xorg-video-all cups-client &&
sleep 5
echo " "
echo "========================================= "
echo "Removing unwanted LXDE utils and Apps"
echo "========================================= "
apt-get remove \
    lxlock light-locker gpicview deluge deluge-common deluge-gtk lxmusic xterm evince \
    evince-common clipit pcmanfm smplayer &&
echo " "
echo "========================================= "
echo "Installing FireJail"
echo "========================================= "
sleep 5
sudo -u $real_user mkdir ~/Project/
sudo -u $real_user cd ~/Project/
sudo -u $real_user wget https://github.com/netblue30/firejail/releases/download/0.9.64.2/firejail_0.9.64.2_1_amd64.deb
sudo -u $real_user tar -xf firejail_0.9.64.2_1_amd64.deb
dpkg -i firejail_0.9.64.2_1_amd64.deb
echo " "
echo "========================================= "
echo "Installing Nerd Fonts"
echo "========================================= "
sleep 5
sudo -u $real_user cd ~/projects/
git clone https://github.com/ryanoasis/nerd-fonts
sudo -u $real_user cd nerd-fonts
bash install.sh
echo " "
echo "========================================= "
echo "Installing Aswesome Fonts"
echo "========================================= "
apt-get install fonts-font-awesome-y
echo " "
echo "========================================= "
echo "Installing Additional Fonts"
echo "========================================= "
sudo -u $real_user mkdir -p ~/projects/fonts/
sudo -u $real_user cd ~/projects/fonts/
sudo -u $real_user wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
sudo -u $real_user wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip
sudo -u $real_user wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SpaceMono.zip
sudo -u $real_user wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Ubuntu.zip
sudo -u $real_user wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/UbuntuMono.zip
sudo -u $real_user mkdir -p /usr/local/share/fonts/
unzip Meslo.zip -d /usr/local/share/fonts/
unzip RobotoMono.zip -d /usr/local/share/fonts/
unzip SpaceMono.zip -d /usr/local/share/fonts/
unzip Ubuntu.zip -d /usr/local/share/fonts/
unzip UbuntuMono.zip -d /usr/local/share/fonts/
echo " "
echo "========================================= "
echo "LXDE Desktop + More installed"
echo "========================================= "
sleep 3
clear
}
#
#
#
#
SLOWFOX () { 
clear
echo "============= "
echo "System update"
echo "============= "
apt-get update
echo "============== "
echo "System updated"
echo "============== "
sleep 5
clear
echo "========================================= "
echo "Installing Slow Firefox fix"
echo "========================================= "
sleep 5
clear
echo " "
apt install python3 python3-pip mpv firefox-esr rpi-chromium-mods
python3 -m pip install --user --upgrade youtube-dl
mkdir ~/projects/
cd ~/projects/
wget https://github.com/akiirui/mpv-handler/releases/latest/download/mpv-handler-linux-x64.zip
unzip -d mpv-handler mpv-handler-linux-x64.zip
mkdir ~/.local/bin/ #just in case
mkdir ~/.local/share/applications/ #just in case
cp mpv-handler/mpv-handler ~/.local/bin/
cp mpv-handler/mpv-handler.desktop ~/.local/share/applications/
mkdir ~/.config/mpv-handler
cp mpv-handler/config.toml ~/.config/mpv-handler/
clear
echo " "
echo "========================================= "
echo "Slow Firefox fix installed"
echo "========================================= "
sleep 3
clear
}
#
#
# ---------------------------
# Main Menu
# ---------------------------
#
mainmenu () { while true
do
clear
echo "-------------------"
echo " Make eznixOS:"
echo "-------------------"
echo
echo " (a) Install base Development tools "
echo " (b) Install Standard Terminal Apps "
echo " (c) Install Additional software "
echo " (d) Install Broadcom WiFi drivers "
echo "     -- Reboot Now -- "
echo " (e) Add deb-multimedia.org (only if needed) "
echo " (f) Run multimedia upgrade (optional) "
echo " (g) Install youtube-dl "
echo " (h) Install Oracle Java "
echo " (j) Install newest kernel from backports "
echo "     -- Reboot Required -- "
echo " (k) Fancy Shell Install "
echo " (L) New Cat Commnad called Bat Install "
echo " (M) Extra Fonts Install "
echo " (N) Locals Purge to free up more Disk Space "
echo " (O) LXDE Desktop Install "
echo " (P) Windows System Monitor Install "
echo " (Q) Slow Firefox Alternative Install "
echo " "
echo " (x) Exit "
echo
read -p "Please enter your choice: " choice
case $choice in
  a|A) DEVTOOLS;;
  b|B) STRSTERMINST;;
  c|C) ADDINSTPKGS;;
  d|D) WIFI;;
  e|E) MMEDIA;;
  f|F) UPGDMO;;
  g|G) YTDLUP;;
  h|H) ORACLE;;
  j|J) BPKERNEL;;
  j|K) FANCYSHELL;;
  l|L) CATCMDBAT;;
  m|M) XRTAFONTS;;
  n|N) LCPURGE;;
  o|O) LXDEDSKINSTA;;
  p|P) SYSMONTSK;;
  q|Q) SLOWFOX;;
  x|X) exit;;
  *) echo "Invalid Answer, Please Try Again";;
#
esac
done
}
#
# Begin main program:
#
mainmenu
#
else
    real_user=$(whoami)
fi
#
done
#
