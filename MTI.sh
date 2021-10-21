#!/bin/bash
#
#
DEVTOOLS() {
clear
echo " "
apt install -y \
    build-essential openssh-server openssh-client make cmake libc glibc gcc g++ git curl wget ninja-build \
    default-jdk default-jre mosh screen original-awk gawk curl git wget zip unzip unrar-free &&
clear
echo " "
echo "Install base development tools"
sleep 5
clear
}
#
#
STRSTERMINST () { 
clear
echo " "
apt-get -y update
echo " "
echo "System update"
clear
echo " "
echo "Installing Standard Terminal Apps"
sleep 5
clear
echo " "
apt-get install -y \
    pv tshark saidar xlsx2csv docx2txt pwgen neofetch libcrack2 htop bmon htop \
    wavemon iftop ipcalc hexcurse ncdu hping3 ntfs-3g arping lshw fping neofetch \
    curl wget iftop apt-transport-https rar unrar cifs-utils fuse3 gvfs-fuse gvfs-backends gvfs-bin \
    chkrootkit ioping trash-cli ranger mc whowatch lsof nethogs fdupes stress ccze tilde nmap &&
clear
echo " "
echo "Terminal Apps installed"
sleep 5
clear
echo " "
echo "Installing GoTop App"
sleep 5
clear
echo " "
wget https://github.com/xxxserxxx/gotop/releases/download/v4.1.2/gotop_v4.1.2_linux_arm7.tgz -P /tmp/
tar -xf /tmp/gotop_v4.1.2_linux_arm7.tgz
mkdir -p /usr/local/bin
cp /tmp/gotop /usr/local/bin/
clear
echo " "
echo "GoTop App installed"
sleep 5
clear
}
#
#
ADDINSTPKGS () { 
clear
echo " "
apt-get -y update
echo " "
echo "System update"
clear
echo " "
echo "Installing Additional Multimedia Apps"
sleep 5
clear
echo " "
apt-get install -y \
    haveged less gdebi galculator grsync synaptic gparted bleachbit flac xorriso \
    faad faac mjpegtools x265 x264 mpg321 ffmpeg streamripper sox mencoder \
    dvdauthor twolame lame asunder aisleriot gnome-mahjongg gnome-chess dosbox \
    filezilla libxvidcore4 vlc obs-studio soundconverter hplip-gui cdrdao \
    frei0r-plugins jfsutils xfsprogs cdtool mtools clonezilla testdisk \
    cdrskin p7zip-full p7zip-rar keepassx hardinfo inxi gnome-disk-utility \
    simplescreenrecorder thunderbird simple-scan gimp gthumb remmina \
    gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-plugins-good \
    gnome-system-tools dos2unix dialog transmission-gtk handbrake \
    handbrake-cli pciutils zulumount-gui zulucrypt-gui zulupolkit \
    dirmngr nvidia-detect openvpn network-manager-openvpn openvpn-systemd-resolved libqt5opengl5 &&
clear
echo " "
echo "Additional Multimedia software installed"
sleep 5
clear
}
#
#
WIFI () { 
clear
echo " "
apt-get -y install b43-fwcutter firmware-b43-installer firmware-b43legacy-installer
clear
echo " "
echo "Additional software installed"
sleep 5
clear
}
#
#
MMEDIA () {
clear
echo " "
apt-get update
echo " "
echo "System updated"
clear
echo " "
echo "Installing multimedia repo"
sleep 5
clear
echo " "
echo 'deb http://www.deb-multimedia.org bullseye main non-free' | sudo tee /etc/apt/sources.list.d/dev-multimedia.list
wget https://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb
dpkg -i deb-multimedia-keyring_2016.8.1_all.deb
apt-get -y update
apt-get -y upgrade
clear
echo " "
echo "Added deb-multimedia.org to repos"
sleep 5
clear
}
#
#
UPGDMO () {
clear
echo " "
echo "System will be upgraded"
clear
echo " "
apt-get update
apt-get upgrade -y
clear
echo " "
echo "System fully upgraded"
sleep 5
clear
}
#
#
YTDLUP () {
clear
echo " "
apt-get update
echo " "
echo "System updated"
clear
echo " "
echo "Installing YouTubeDL"
sleep 5
clear
echo " "
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/bin/youtube-dl
chmod a+rx /usr/bin/youtube-dl
clear
echo " "
echo "Updating Youtube-dl to the latest version"
sleep 5
clear
}
#
#
ORACLE () {
clear
echo " "
apt-get update
echo " "
echo "System updated"
clear
echo " "
echo "Installing Oracle repo and latest java"
sleep 5
clear
echo " "
sudo add-apt-repository ppa:linuxuprising/java
sudo apt install oracle-java17-installer --install-recommends
echo oracle-java17-installer shared/accepted-oracle-license-v1-3 select true | sudo /usr/bin/debconf-set-selections
clear
echo " "
echo "Enabled systemd-resolved service"
sleep 5
clear
}
#
#
BPKERNEL () { 
clear
echo " "
apt-get update
echo " "
echo "System updated"
clear
echo " "
echo "Installing lastest back-port linux image and firmware"
sleep 5
clear
echo " "
apt-get -y install -t bullseye-backports \
    firmware-linux firmware-linux-nonfree \
    linux-image-amd64 linux-headers-amd64 firmware-linux firmware-linux-nonfree firmware-misc-nonfree \
    firmware-misc-nonfree firmware-realtek firmware-atheros firmware-bnx2 firmware-bnx2x \
    firmware-brcm80211 firmware-ipw2x00 firmware-intelwimax firmware-iwlwifi firmware-bnx2 firmware-bnx2x \
    firmware-libertas firmware-netxen firmware-zd1211 gnome-nettool guvcview &&
clear
echo " "
echo "Newest kernel from backports installed"
sleep 3
clear
}
#
#
FANCYSHELL () { 
clear
echo " "
apt-get update
echo " "
echo "System updated"
clear
echo " "
echo "Installing fancy shell"
sleep 5
clear
echo " "
mkdir $HOME/projects/
cd $HOME/projects/
git clone --recursive https://github.com/andresgongora/synth-shell.git
cd synth-shell/
chmod +x setup.sh
echo "i u n Y n n n"| ./setup.sh
sleep 5
clear
echo " "
echo "fancy shell installed"
sleep 5
echo " "
echo "Installing new ls command"
clear
echo " "
filename=".bashrc"
search="ls --color=auto"
replace="lsd"
wget -P ~/projects https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_arm64.deb
dpkg -i lsd-musl_0.20.1_arm64.deb
sed -i "s/$search/$replace/" $HOME/$filename
clear
echo " "
echo "New ls command installed"
sleep 3
clear
#
#
CATCMDBAT () { 
clear
echo " "
apt-get update
echo " "
echo "System updated"
clear
echo " "
echo "Installing new cat command called bat"
sleep 5
clear
echo " "
wget https://github.com/sharkdp/bat/releases/download/v0.18.3/bat_0.18.3_amd.deb -P /tmp/
dpkg -i bat_*.deb
bat /etc/profile
clear
echo " "
echo "New ls command installed"
sleep 3
clear
#
#
XRTAFONTS () { 
clear
echo " "
apt-get update
echo " "
echo "System updated"
clear
echo " "
echo "Installing Extra Fonsts"
sleep 5
clear
echo " "
cd /tmp/
git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
bash install.sh
cd /tmp/
apt-get install -y fonts-font-awesome
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip -P /tmp/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip -P /tmp/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SpaceMono.zip -P /tmp/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Ubuntu.zip -P /tmp/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/UbuntuMono.zip -P /tmp/
unzip Meslo.zip -d ~/.local/share/fonts/
unzip RobotoMono.zip -d ~/.local/share/fonts/
unzip SpaceMono.zip -d ~/.local/share/fonts/
unzip Ubuntu.zip -d ~/.local/share/fonts/
unzip UbuntuMono.zip -d ~/.local/share/fonts/
clear
echo " "
echo "New Fonts installed"
sleep 3
clear
#
#
LCPURGE () { 
clear
echo " "
apt-get update
echo " "
echo "System updated"
clear
echo " "
echo "Locals Purge to free up more Disk Space "
sleep 5
clear
echo " "
apt-get install localepurge -y
localepurge
clear
sleep 5
echo " "
echo "Locals Purged!"
sleep 3
clear
#
#
SYSMONTSK () { 
clear
echo " "
apt-get update
echo " "
echo "System updated"
clear
echo " "
echo "Installing Windows Modern System Monitor install"
sleep 5
clear
echo " "
add-apt-repository ppa:camel-neeraj/sysmontask
apt update
apt install python3-pip sysmontask 
pip3 install -U psutil -y
clear
echo " "
echo "Windows Modern System Monitor installed"
sleep 3
clear
#
#
LXDEDSKINSTA () { 
clear
echo " "
apt-get update
echo " "
echo "System updated"
clear
echo " "
echo "Installing LXDE Desktop install"
sleep 5
clear
echo " "
apt-get install -y \
    slim lightdm iceweasel lxterminal tint2 gsimplecal volumeicon nitrogen lxpanel task-lxde-desktop lxde software-properties-common \
    net-tools hsetroot qt5-style-plugins ttf-mscorefonts-installer scribus chromium dconf-editor fortune cowsay filezilla calibre \
    numix-gtk-theme greybird-gtk-theme breeze-icon-theme breeze-gtk-theme liferea shotcut aptitude synaptic arc-theme \
    audacity npm nemo praat gramps pdfchain syncthing git curl wget gdebi htop keepassxc openvpn thunar autossh icedove \
    vim emacs lxsession-default-apps libatk-adaptor libgail-common gedit gimp brasero libasound2 alsa-utils alsa-oss \
    alsa-tools-gui vlc libavcodec-extra-53 mpv mutter qt5ct timeshift firefox-esr galculator gdisk gnome-disk-utility \
    gnome-screenshot nemo nano papirus-icon-theme nvidia-detect libqt5opengl5 &&
apt-get remove \
    lxlock light-locker gpicview deluge deluge-common deluge-gtk lxmusic xterm evince \
    evince-common clipit pcmanfm smplayer &&
echo " "
echo "Installing FireJail"
sleep 5
mkdir ~/Project/
cd ~/Project/
wget https://github.com/netblue30/firejail/releases/download/0.9.64.2/firejail_0.9.64.2_1_amd64.deb
tar -xf firejail_0.9.64.2_1_amd64.deb
dpkg -i firejail_0.9.64.2_1_amd64.deb
echo " "
echo "Installing additional Fonts"
sleep 5
cd ~/projects/
git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
bash install.sh
apt-get install fonts-font-awesome-y
mkdir -p ~/projects/fonts/
cd ~/projects/fonts/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SpaceMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Ubuntu.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/UbuntuMono.zip
mkdir -p /usr/local/share/fonts/
unzip Meslo.zip -d /usr/local/share/fonts/
unzip RobotoMono.zip -d /usr/local/share/fonts/
unzip SpaceMono.zip -d /usr/local/share/fonts/
unzip Ubuntu.zip -d /usr/local/share/fonts/
unzip UbuntuMono.zip -d /usr/local/share/fonts/
clear
echo " "
echo "LXDE Desktop + More installed"
sleep 3
clear
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
done
#
