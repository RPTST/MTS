#!/bin/bash
#
# mkeznixos -- Revision: 20210919 -- by eznix (https://sourceforge.net/projects/eznixos/)
# (GNU/General Public License version 3.0)
#
#
# ---------------------------------------
# Define Functions:
# ---------------------------------------
#
#
DEVTOOLS() {
clear
echo " "
apt install -y build-essential make cmake gcc g++ git curl wget ninja-build neofetch default-jdk default-jre mosh screen original-awk gawk curl git wget zip unzip unrar-free
clear
echo " "
echo "Install base development tools"
sleep 5
clear
}
#
#
OPTSRC () { 
clear
echo " "
apt-get -y update
echo " "
echo "Ran system update"
clear
echo " "
echo "Standar Terminal Apps install"
sleep 5
clear
echo " "
apt-get install -y pv tshark saidar xlsx2csv docx2txt pwgen libcrack2 htop bmon wavemon iftop ipcalc hexcurse hping3 arping lshw fping chkrootkit ioping trash-cli ranger mc whowatch lsof nethogs fdupes stress ccze tilde nmap
clear
echo " "
echo "Ran dist-upgrade"
sleep 5
clear
}
#
#
INSTPKGS () { 
clear
echo " "
apt-get -y install haveged less gdebi galculator grsync synaptic gparted bleachbit flac faad faac mjpegtools x265 x264 mpg321 ffmpeg streamripper sox mencoder dvdauthor twolame lame asunder aisleriot gnome-mahjongg gnome-chess dosbox filezilla libxvidcore4 vlc obs-studio soundconverter hplip-gui cdrdao frei0r-plugins htop jfsutils xfsprogs ntfs-3g cdtool mtools clonezilla testdisk numix-gtk-theme greybird-gtk-theme breeze-icon-theme breeze-gtk-theme xorriso cdrskin p7zip-full p7zip-rar keepassx hardinfo inxi gnome-disk-utility simplescreenrecorder thunderbird simple-scan gimp gthumb remmina arc-theme gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-plugins-good gnome-system-tools dos2unix dialog papirus-icon-theme transmission-gtk handbrake handbrake-cli rar unrar cifs-utils fuse3 gvfs-fuse gvfs-backends gvfs-bin pciutils squashfs-tools syslinux syslinux-common dosfstools isolinux live-build fakeroot linux-headers-amd64 lsb-release menu build-essential dkms curl wget iftop apt-transport-https dirmngr nvidia-detect openvpn network-manager-openvpn openvpn-systemd-resolved libqt5opengl5 zulumount-gui zulucrypt-gui zulupolkit neofetch firmware-linux firmware-linux-nonfree firmware-misc-nonfree firmware-realtek firmware-atheros firmware-bnx2 firmware-bnx2x firmware-brcm80211 firmware-ipw2x00 firmware-intelwimax firmware-iwlwifi firmware-libertas firmware-netxen firmware-zd1211 gnome-nettool guvcview
clear
echo " "
echo "Additional software installed"
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
apt-get -y update
echo 'deb http://www.deb-multimedia.org bullseye main non-free' | sudo tee /etc/apt/sources.list.d/dev-multimedia.list
wget https://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb
dpkg -i deb-multimedia-keyring_2016.8.1_all.deb
apt-get -y update
apt-get -y upgrade
clear
echo " "
echo "Added deb-multimedia.org repos"
sleep 5
clear
}
#
#
UPGDMO () {
clear
echo " "
apt-get -y update
apt-get -y upgrade
clear
echo " "
echo "Distribution fully upgraded"
sleep 5
clear
}
#
#
YTDLUP () {
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
apt-get -y install -t bullseye-backports linux-image-amd64 linux-headers-amd64
apt-get -y install -t bullseye-backports firmware-linux firmware-linux-nonfree firmware-misc-nonfree
apt-get -y install -t bullseye-backports firmware-realtek firmware-atheros firmware-bnx2 firmware-bnx2x firmware-brcm80211 firmware-ipw2x00 firmware-intelwimax firmware-iwlwifi firmware-libertas firmware-netxen firmware-zd1211
clear
echo " "
echo "Newest kernel from backports installed"
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
echo " (b) Install Terminal Apps "
echo " (c) Install additional software "
echo " (d) Install Broadcom WiFi drivers "
echo "     -- Reboot Now -- "
echo " (e) Add deb-multimedia.org (only if needed) "
echo " (f) Run multimedia upgrade (optional) "
echo " (g) Install youtube-dl "
echo " (h) Install Oracle Java "
echo " (j) Install newest kernel from backports "
echo "     -- Reboot Required -- "
echo " "
echo " (x) Exit "
echo
read -p "Please enter your choice: " choice
case $choice in
  a|A) DEVTOOLS;;
  b|B) OPTSRC;;
  c|C) INSTPKGS;;
  d|D) WIFI;;
  e|E) MMEDIA;;
  f|F) UPGDMO;;
  g|G) YTDLUP;;
  h|H) ORACLE;;
  j|J) BPKERNEL;;
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
