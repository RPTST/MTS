#!/bin/bash

##
# BASH menu script that checks:
#   - Memory usage
#   - CPU load
#   - Number of TCP connections 
#   - Kernel version
##

server_name=$(hostname)

function memory_check() {
    echo ""
	echo "Memory usage on ${server_name} is: "
	free -h
	echo ""
}

function cpu_check() {
    echo ""
	echo "CPU load on ${server_name} is: "
    echo ""
	uptime
    echo ""
}

function tcp_check() {
    echo ""
	echo "TCP connections on ${server_name}: "
    echo ""
	cat  /proc/net/tcp | wc -l
    echo ""
}

function kernel_check() {
    echo ""
	echo "Kernel version on ${server_name} is: "
	echo ""
	uname -r
    echo ""
}

function all_checks() {
	memory_check
	cpu_check
	tcp_check
	kernel_check
}

function DEVTOOLS() {
	clear
	echo "Install base development tools"
	echo " "
	apt install -y build-essential openssh-server openssh-client make cmake libc glibc gcc g++ git curl wget ninja-build default-jdk default-jre mosh screen original-awk gawk curl git wget zip unzip unrar-free &&
	clear
	echo " "
	echo "Base development tools Installed"
}

function STRSTERMINST() { 
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
	apt-get install -y pv tshark saidar xlsx2csv docx2txt pwgen neofetch libcrack2 htop bmon htop wavemon iftop ipcalc hexcurse ncdu hping3 ntfs-3g arping lshw fping neofetch curl wget iftop apt-transport-https rar unrar cifs-utils fuse3 gvfs-fuse gvfs-backends gvfs-bin chkrootkit ioping trash-cli ranger mc whowatch lsof nethogs fdupes stress ccze tilde nmap
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

function ADDINSTPKGS () { 
	clear
	echo " "
	apt-get update
	echo " "
	echo "System update"
	clear
	echo " "
	echo "Installing Additional Multimedia Apps"
	sleep 5
	clear
	echo " "
	apt-get install -y haveged less gdebi galculator grsync synaptic gparted bleachbit flac xorriso faad faac mjpegtools x265 x264 mpg321 ffmpeg streamripper sox mencoder dvdauthor twolame lame asunder aisleriot gnome-mahjongg gnome-chess dosbox filezilla libxvidcore4 vlc obs-studio soundconverter hplip-gui cdrdao frei0r-plugins jfsutils xfsprogs cdtool mtools clonezilla testdisk cdrskin p7zip-full p7zip-rar keepassx hardinfo inxi gnome-disk-utility simplescreenrecorder thunderbird simple-scan gimp gthumb remmina gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-plugins-good gnome-system-tools dos2unix dialog transmission-gtk handbrake handbrake-cli pciutils zulumount-gui zulucrypt-gui zulupolkit dirmngr nvidia-detect openvpn network-manager-openvpn openvpn-systemd-resolved libqt5opengl5
	clear
	echo " "
	echo "Additional Multimedia software installed"
	sleep 5
	clear
}

function MMEDIA () {
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
	apt-get update
	apt-get -y upgrade
	clear
	echo " "
	echo "Added deb-multimedia.org to repos"
	sleep 5
	clear
}

#
#
function WIFI () { 
	clear
	echo " "
	apt-get install b43-fwcutter firmware-b43-installer firmware-b43legacy-installer -y
	clear
	echo " "
	echo "Additional software installed"
	sleep 5
	clear
}

function UPGDMO () {
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

function YTDLUP () {
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

function ORACLE () {
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

function BPKERNEL () { 
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
	apt-get -y install -t bullseye-backports firmware-linux firmware-linux-nonfree linux-image-amd64 linux-headers-amd64 firmware-linux firmware-linux-nonfree firmware-misc-nonfree firmware-misc-nonfree firmware-realtek firmware-atheros firmware-bnx2 firmware-bnx2x firmware-brcm80211 firmware-ipw2x00 firmware-intelwimax firmware-iwlwifi firmware-bnx2 firmware-bnx2x firmware-libertas firmware-netxen firmware-zd1211 gnome-nettool guvcview
	clear
	echo " "
	echo "Newest kernel from backports installed"
	sleep 3
	clear
}



##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

##
# Color Functions
##

ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}

menu(){
echo -ne "
My First Menu
$(ColorGreen '1)') Memory usage
$(ColorGreen '2)') CPU load
$(ColorGreen '3)') Number of TCP connections 
$(ColorGreen '4)') Kernel version
$(ColorGreen '5)') Check All
$(ColorGreen '0)') Exit
$(ColorBlue 'Choose an option:') "
        read a
        case $a in
	        1) memory_check ; menu ;;
	        2) cpu_check ; menu ;;
	        3) tcp_check ; menu ;;
	        4) kernel_check ; menu ;;
	        5) all_checks ; menu ;;
		0) exit 0 ;;
		*) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}

# Call the menu function
menu
