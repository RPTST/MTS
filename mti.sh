#!/bin/bash
# shellcheck disable=2034,2059
true
# VERSION=1.0.0
#
# Master Tool Installer
#
################################################ Variable 1

INTERACTIVE=True
REPO='https://raw.githubusercontent.com/RPTST/MTS/master'
SCRIPTS = '~/projects'

################################ Network vars

IFCONFIG=$(ifconfig)
clear
IP="/sbin/ip"
IFACE=$(lshw -c network | grep "logical name" | awk '{print $3}')
clear
INTERFACES="/etc/network/interfaces"
clear
ADDRESS=$($IP route get 1 | awk '{print $NF;exit}')
NETMASK=$(ifconfig "$IFACE" | grep Mask | sed s/^.*Mask://)
GATEWAY=$($IP route | awk '/default/ { print $3 }')

if ! [ -x "$(command -v nslookup)" ]; then
	apt-get install dnsutils -y -q
else
	echo 'dnsutils is installed.' >&2
  clear
fi
if ! [ -x "$(command -v ifup)" ]; then
	apt-get install ifupdown -y -q
else
	echo 'ifupdown is installed.' >&2
  clear
fi

nslookup google.com
if [[ $? > 0 ]]
then
	whiptail --msgbox "Network NOT OK. You must have a working Network connection to run this script." "$WT_HEIGHT" "$WT_WIDTH"
        exit 1
else
	echo "Network OK."
  clear
fi

################################ Whiptail size

calc_wt_size() {
  WT_HEIGHT=17
  WT_WIDTH=$(tput cols)

  if [ -z "$WT_WIDTH" ] || [ "$WT_WIDTH" -lt 60 ]; then
    WT_WIDTH=80
  fi
  if [ "$WT_WIDTH" -gt 178 ]; then
    WT_WIDTH=120
  fi
  WT_MENU_HEIGHT=$((WT_HEIGHT-7))
}

################################################ Whiptail check

        if [ $(dpkg-query -W -f='${Status}' whiptail 2>/dev/null | grep -c "ok installed") -eq 1 ]; then
        echo "Whiptail is already installed..."
        clear
else
    {
    i=1
    while read -r line; do
        i=$(( i + 1 ))
        echo $i
    done < <(apt-get install whiptail -y)
  } | whiptail --title "Progress" --gauge "Please wait while installing Whiptail..." 6 60 0

fi

################################################ Check if root

if [ "$(whoami)" != "root" ]; then
        whiptail --msgbox "Sorry you are not root. You must type: sudo techandtool" "$WT_HEIGHT" "$WT_WIDTH"
        exit
fi
################################################ Do finish

ASK_TO_REBOOT=0
do_finish() {
  if [ $ASK_TO_REBOOT -eq 1 ]; then
    whiptail --yesno "Would you like to reboot now?" 20 60 2
    if [ $? -eq 0 ]; then # yes
      sync
      reboot
    fi
  fi
  exit 0
}
################################################ Check Ubuntu OS


DISTRO=$(lsb_release -sd | cut -d ' ' -f 2)
version(){
    local h t v

    [[ $2 = "$1" || $2 = "$3" ]] && return 0

    v=$(printf '%s\n' "$@" | sort -V)
    h=$(head -n1 <<<"$v")
    t=$(tail -n1 <<<"$v")

    [[ $2 != "$h" && $2 != "$t" ]]
}

if ! version 21.04 "$DISTRO" 21.04; then
    whiptail --msgbox "Ubuntu version $DISTRO is tested on 21.04 - 20.04 no support is given for other releases." "$WT_HEIGHT" "$WT_WIDTH"
    #exit
fi

if [ $(dpkg-query -W -f='${Status}' ubuntu-server 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  	whiptail --msgbox "'ubuntu-server' is not installed, this doesn't seem to be a server. Please install the server version of Ubuntu and restart the script" "$WT_HEIGHT" "$WT_WIDTH"
    exit 1
fi

################################################ Master Tool Installer


do_mti() {
  FUN=$(whiptail --backtitle "Master Tool Installer'" --title "Master Tool Installer" --menu "Tech and tool" "$WT_HEIGHT" "$WT_WIDTH" "$WT_MENU_HEIGHT" --cancel-button Back --ok-button Select \
  "0 Install Terminal Tools" "Terminal Tools" \
  "1 Install Apps" "Install Apps" \
  "2 Install Option 2" "Test Option 2" \
  "3 Install Option 3" "Test Option 3" \
  "4 Install Teamspeak" "Team Speak" \
    3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 1 ]; then
    return 0
  elif [ $RET -eq 0 ]; then
    case "$FUN" in
      0\ *) do_terminal ;;
      1\ *) do_apps ;;
      2\ *) do_option1 ;;
      3\ *) do_option2 ;;
      4\ *) do_teamspeak ;;
      *) whiptail --msgbox "Programmer error: unrecognized option" 20 60 1 ;;
    esac || whiptail --msgbox "There was an error running option $FUN" 20 60 1
 else
   exit 1
  fi
}

################################################ Install Terminal Apps

do_terminal() {
function terminalutils {
  echo "running terminal function"
  sudo apt-get install bash-completion bc curl cmatrix elinks feh file-roller gnome-keyring gtop hardinfo htop inxi jq jshon neofetch ntp numlockx openssh rsync speedtest-cli tlp wget zenity bpytop bmon wavemon iftop ipcalc hexcurse exa hping3 arping lshw fping chkrootkit ioping trash-cli ranger mc whowatch lsof nethogs fdupes stress ccze tilde nmap original-awk gawk tshark saidar xlsx2csv pwgen libcrack2 tasksel htop lynx -y
}

function archive {
 echo "running archive function"
 sudo apt-get install unrar unzip zip p7zip
}

function javautils {
 echo "running Java function"
 sudo apt-get install default-jre default-jdk
}

whiptail --title "Apps" --checklist --separate-output "Choose:" 20 78 15 \
"Terminal Utils" "" on \
"Archive Utils" "" off \
"Java Utils" "" off 2>results

while read choice
do
        case $choice in
                Terminal) terminalutils
                ;;
                Archive) archive
                ;;
                Java) javautils
                ;;
                *)
                ;;
        esac
done < results
}

################################################ Install Apps

do_apps() {
  FUN=$(whiptail --backtitle "Apps" --title "Master Tool Installer" --menu "Master Tool Installer" >
  "1 Internet" "Browser" \
  "2 option11" "Option 11" \
  "3 option12" "option 12" \
    3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 1 ]; then
    return 0
  elif [ $RET -eq 0 ]; then
    case "$FUN" in
      1\ *) do_browser ;;
      2\ *) do_option11 ;;
      3\ *) do_option12 ;;
      *) whiptail --msgbox "Programmer error: unrecognized option" 20 60 1 ;;
    esac || whiptail --msgbox "There was an error running option $FUN" 20 60 1
 else
   exit 1
  fi
}

################### Browser

do_browser() {
	whiptail --msgbox "Under construction..." "$WT_HEIGHT" "$WT_WIDTH"
}

################### Option11

do_option11() {
	whiptail --msgbox "Under construction..." "$WT_HEIGHT" "$WT_WIDTH"
}

################### Option12

do_option12() {
	whiptail --msgbox "Under construction..." "$WT_HEIGHT" "$WT_WIDTH"
}


################################################ Install Nextcloud 2.1

do_option1() {
#mkdir -p "$SCRIPTS"
#wget "$NCREPO"/nextcloud_install_production.sh -P "$SCRIPTS"
#bash "$SCRIPTS"/nextcloud_install_production.sh
	whiptail --msgbox "Under construction..." "$WT_HEIGHT" "$WT_WIDTH"
}

################################################ Install Nextcloud 2.1

do_option2() {
#mkdir -p "$SCRIPTS"
#wget "$NCREPO"/nextcloud_install_production.sh -P "$SCRIPTS"
#bash "$SCRIPTS"/nextcloud_install_production.sh
	whiptail --msgbox "Under construction..." "$WT_HEIGHT" "$WT_WIDTH"
}

################################################ Install Teamspeak 2.5

do_teamspeak() {
# Add user
useradd teamspeak3
sed -i 's|:/home/teamspeak3:|:/home/teamspeak3:/usr/sbin/nologin|g' /etc/passwd

# Get Teamspeak
wget http://ftp.4players.de/pub/hosted/ts3/releases/3.0.10.3/teamspeak3-server_linux-amd64-3.0.10.3.tar.gz -P >

# Unpack Teamspeak
tar xzf /tmp/teamspeak3-server_linux-amd64-3.0.10.3.tar.gz

# Move to right directory
mv /tmp/teamspeak3-server_linux-amd64 /usr/local/teamspeak3

# Set ownership
chown -R teamspeak3 /usr/local/teamspeak3

# Add to upstart
ln -s /usr/local/teamspeak3/ts3server_startscript.sh /etc/init.d/teamspeak3
update-rc.d teamspeak3 defaults

# Warning
echo -e "\e[32m"
echo    "+--------------------------------------------------------------------+"
echo    "| Next you will need to copy/paste 3 things to a safe location       |"
echo    "|                                                                    |"
echo -e "|         \e[0mLOGIN, PASSWORD, SECURITY TOKEN\e[32m                            |"
echo    "|                                                                    |"
echo -e "|         \e[0mIF YOU FAIL TO DO SO, YOU HAVE TO REINSTALL TEAMSPEAK\e[32m    |"
echo -e "|         \e[0mIn 30 Sec the script will continue, so be quick!/e[32m           |"
echo    "+--------------------------------------------------------------------+"
echo
read -p "Press any key to start copying the important stuff to a safe location..." -n1 -s
echo -e "\e[0m"
echo

# Start service
service teamspeak3 start && sleep 30
echo
function ask_yes_or_no() {
    read -p "$1 ([y]es or [N]o): "
    case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
        y|yes) echo "yes" ;;
        *)     echo "no" ;;
    esac
}

ufw allow 9987/udp
ufw allow 30033/tcp
ufw allow 10011/tcp
ufw allow 41144/tcp

whiptail --msgbox "Teamspeak is now installed..." "$WT_HEIGHT" "$WT_WIDTH"
}

################################################ Tools 3

do_tools() {
FUN=$(whiptail --backtitle "Tools" --title "Master Tool Installer - Tools " --menu "Tool" "$WT_HEIGHT" "$WT_WIDTH" "$WT_MENU_HEIGHT" --cancel-button Back --ok-button Select \
"1 Show LAN IP, Gateway, Netmask" "Ifconfig" \
"2 Show WAN IP" "External IP address" \
"3 Change Hostname" "Your machine's name" \
"4 Internationalisation Options" "Change language, time, date and keyboard layout" \
"5 Connect to WLAN" "Please have a wifi dongle/card plugged in before start" \
"6 Show folder size" "Using ncdu" \
"7 Show folder content" "with permissions" \
"8 Show connected devices" "blkid" \
"9 Show disks usage" "df -h" \
"10 Show system performance" "HTOP" \
"11 Disable IPV6" "Via sysctl.conf" \
"12 Find text" "In a given directory" \
"13 OOM fix" "Auto reboot on out of memory errors" \
"14 Generate new SSH keys" "" \
"18 Set dns to Google and OpenDns" "Try google first if no response after 1 sec. switch to next NS" \
"19 Add progress bar" "Apply's to apt-get update, install & upgrade" \
"20 Boot to terminal by default" "Only if you use a GUI/desktop now" \
"21 Boot to GUI/desktop by default" "Only if you have a GUI installed and have terminal as default" \
"22 Delete line containing a string of text" "Warning, deletes every line containing the string!" \
"23 Set swappiness" "" \
"24 Upgrade Ubuntu Kernel" "To the latest version" \
"25 Backup your system" "" \
"26 Restore backup" "Made with the option above" \
"27 Protect SSH with Fail2Ban" "" \
"28 Protect SSH with Google 2 factor authentication" "" \
"29 Distribution upgrade" "Only LTS" \
"30 Notify email address upon SSH login" "Only for 'ROOT'" \
"31 Notify email address upon SSH login" "User defined account" \
"32 Check internet speed" "" \
  3>&1 1>&2 2>&3)
RET=$?
if [ $RET -eq 1 ]; then
  return 0
elif [ $RET -eq 0 ]; then
  case "$FUN" in
    1\ *) do_ifconfig ;;
    2\ *) do_wan_ip ;;
    3\ *) do_change_hostname ;;
    4\ *) do_internationalisation_menu ;;
    5\ *) do_wlan ;;
    6\ *) do_foldersize ;;
    7\ *) do_listdir ;;
    8\ *) do_blkid ;;
    9\ *) do_df ;;
    10\ *) do_htop ;;
    11\ *) do_disable_ipv6 ;;
    12\ *) do_find_string ;;
    13\ *) do_oom ;;
                14\ *) do_ssh_keys ;;
    18\ *) do_dns ;;
    19\ *) do_progressbar ;;
    20\ *) do_bootterminal ;;
    21\ *) do_bootgui ;;
    22\ *) do_stringdel ;;
    23\ *) do_swappiness ;;
    24\ *) do_ukupgrade ;;
    25\ *) do_backup ;;
    26\ *) do_restore_backup ;;
    27\ *) do_fail2ban_ssh ;;
    28\ *) do_2fa ;;
    29\ *) do_ltsupgrade ;;
    30\ *) do_rootmailssh ;;
    31\ *) do_usermailssh ;;
                32\ *) do_internetspeed ;;
    *) whiptail --msgbox "Programmer error: unrecognized option" 20 60 1 ;;
  esac || whiptail --msgbox "There was an error running option $FUN" 20 60 1
else
 exit 1
fi
}
################################ Network details

do_ifconfig() {
whiptail --msgbox "\
Interface: $IFACE
LAN IP: $ADDRESS
Netmask: $NETMASK
Gateway: $GATEWAY\
" "$WT_HEIGHT" "$WT_WIDTH"
}

################################ Wan IP

do_wan_ip() {
  WAN=$(wget -qO- http://ipecho.net/plain ; echo)
  whiptail --msgbox "WAN IP: $WAN" "$WT_HEIGHT" "$WT_WIDTH"
}

################################ Hostname

do_change_hostname() {
  whiptail --msgbox "\
Please note: RFCs mandate that a hostname's labels \
may contain only the ASCII letters 'a' through 'z' (case-insensitive),
the digits '0' through '9', and the hyphen.
Hostname labels cannot begin or end with a hyphen.
No other symbols, punctuation characters, or blank spaces are permitted.\
" "$WT_HEIGHT" "$WT_WIDTH"

  CURRENT_HOSTNAME=$(cat < /etc/hostname | tr -d " \t\n\r")
  NEW_HOSTNAME=$(whiptail --inputbox "Please enter a hostname" 20 60 "$CURRENT_HOSTNAME" 3>&1 1>&2 2>&3)
  if [ $? -eq 0 ]; then
    echo "$NEW_HOSTNAME" > /etc/hostname
    sed -i "s/127.0.1.1.*$CURRENT_HOSTNAME/127.0.1.1\t$NEW_HOSTNAME/g" /etc/hosts
  fi

  CURRENT_HOSTNAME1=$(cat < /etc/hostname | tr -d " \t\n\r")
  whiptail --msgbox "This is your new current hostname: $CURRENT_HOSTNAME1" "$WT_HEIGHT" "$WT_WIDTH"
}

################################ Internationalisation

do_internationalisation_menu() {
  FUN=$(whiptail --backtitle "Internationalisation" --title "Master Tool Installer" --menu >
    "I1 Change Locale" "Set up language and regional settings to match your location" \
    "I2 Change Timezone" "Set up timezone to match your location" \
    "I3 Change Keyboard Layout" "Set the keyboard layout to match your keyboard" \
    3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 1 ]; then
    return 0
  elif [ $RET -eq 0 ]; then
    case "$FUN" in
      I1\ *) do_change_locale ;;
      I2\ *) do_change_timezone ;;
      I3\ *) do_configure_keyboard ;;
      *) whiptail --msgbox "Programmer error: unrecognized option" 20 60 1 ;;
    esac || whiptail --msgbox "There was an error running option $FUN" 20 60 1
  fi
}

######

do_configure_keyboard() {
  dpkg-reconfigure keyboard-configuration &&
  printf "Reloading keymap. This may take a short while\n" &&
  invoke-rc.d keyboard-setup start
}

######

do_change_locale() {
  dpkg-reconfigure locales
}

######

do_change_timezone() {
  dpkg-reconfigure tzdata
}
################################ Show folder size

do_foldersize() {
        if [ $(dpkg-query -W -f='${Status}' ncdu 2>/dev/null | grep -c "ok installed") -eq 1 ];
then
      ncdu /
else
      apt-get install ncdu -y
            ncdu /
fi
}

################################ Show disk usage

do_df() {
  DF=$(df -h)
  whiptail --msgbox "$DF" "$WT_HEIGHT" "$WT_WIDTH" --scrolltext --title "Scroll with your mouse or page up/down or arrow keys"
}

################################ Show system performance

do_htop() {
        if [ $(dpkg-query -W -f='${Status}' htop 2>/dev/null | grep -c "ok installed") -eq 1 ]; then
    htop
else

    {
    i=1
    while read -r line; do
        i=$(( $i + 1 ))
        echo $i
    done < <(apt-get install htop -y)
  } | whiptail --title "Progress" --gauge "Please wait while installing Htop..." 6 60 0

    htop
fi
}
################################ Disable IPV6

do_disable_ipv6() {
 if grep -q "net.ipv6.conf.all.disable_ipv6 = 1" "/etc/sysctl.conf"; then
   echo "Already applied..."
 else
 echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
 fi

 if grep -q "net.ipv6.conf.default.disable_ipv6 = 1" "/etc/sysctl.conf"; then
   echo "Already applied..."
 else
 echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
 fi

  if grep -q "net.ipv6.conf.lo.disable_ipv6 = 1" "/etc/sysctl.conf"; then
   echo "Already applied..."
 else
 echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf
 fi

 echo
 sysctl -p
 echo

if grep -q "net.ipv6.conf.all.disable_ipv6 = 1" "/etc/sysctl.conf"; then
   whiptail --msgbox "IPV6 is now disabled..." "$WT_HEIGHT" "$WT_WIDTH"
fi
}
################################ Progress bar

do_progressbar() {
if grep -q "Dpkg::Progress-Fancy "1";" "/etc/apt/apt.conf.d/99progressbar"; then
  whiptail --msgbox "Already installed..." "$WT_HEIGHT" "$WT_WIDTH"
else
  echo "Dpkg::Progress-Fancy "1";" > /etc/apt/apt.conf.d/99progressbar
  if [ $? -eq 1 ]; then
    whiptail --msgbox "There where errors running this command. Please run this tool in debug mode: sudo bash >
  else
          whiptail --msgbox "You now have a fancy progress bar, outside this installer run apt or apt-get inst>
  fi
fi
}

################################ Check internet speed

do_internetspeed() {
if              [ -f /usr/sbin/speedtest-cli ]; then
        rm /usr/sbin/speedtest-cli
fi
        wget -O speedtest-cli https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py
  mv speedtest-cli /usr/sbin/speedtest-cli
        chmod +x /usr/sbin/speedtest-cli
        speedtest-cli
}

################################################ Install

do_install() {

  {
  i=1
  while read -r line; do
      i=$(( $i + 1 ))
      echo $i
  done < <(apt-get update)
} | whiptail --title "Progress" --gauge "Please wait while updating" 6 60 0

  FUN=$(whiptail --backtitle "Install software packages" --title "Master Tool Installer" -->
      "I1 Install Package" "User defined" \
      "I2 Install Webmin" "Graphical interface to manage headless systems" \
      "I3 Install SSH Server" "Needed by a remote machine to be accessable via SSH" \
      "I4 Install SSH Client" "Needed by the local machine to connect to a remote machine" \
      "I5 Change SSH-server port" "Change SSH-server port" \
      "I6 Install ClamAV" "Antivirus, set daily scans, infections will be emailed" \
      "I7 Install Fail2Ban" "Install a failed login monitor, needs jails for apps!!!!" \
      "I8 Install Nginx" "Install Nginx webserver" \
      "I9 Install Zram-config" "For devices with low RAM, compresses your RAM content (RPI)" \
      "I10 Install NFS Client" "Install NFS client to be able to mount NFS shares" \
      "I11 Install NFS Server" "Install NFS server to be able to broadcast NFS shares" \
      "I12 Install DDClient" "Update Dynamic Dns with WAN IP, dyndns.com, easydns.com etc." \
      "I13 Install AtoMiC-ToolKit" "Installer for Sabnzbd, Sonar, Couchpotato etc." \
      "I14 Install OpenVPN" "Connect to an OpenVPN server to secure your connections" \
      "I15 Install Network manager" "Advanced network tools" \
      "I16 Install Plesk" "Hosting platform, ONLY for a clean Ubuntu 14.04 server!" \
      "I17 Install Plex" "Powerfull Media manager, also sets daily updates" \
      "I18 Install Vnc server" "With LXDE minimal/core desktop, only use with SSH." \
      "I20 Install Virtualbox" "Virtualize any OS Windows, ubuntu etc." \
      "I21 Install Virtualbox extension pack" "Expand Virtualbox's capability's" \
      "I22 Install Virtualbox guest additions" "Enables features such as USB, shared folders etc. in side the guest" \
    3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 1 ]; then
    return 0
  elif [ $RET -eq 0 ]; then
    case "$FUN" in
      I1\ *) do_install_package ;;
      I2\ *) do_install_webmin ;;
      I3\ *) do_install_SSH_server ;;
      I4\ *) do_install_SSH_client ;;
      I5\ *) do_ssh ;;
      I6\ *) do_clamav ;;
      I7\ *) do_fail2ban ;;
      I8\ *) do_nginx ;;
      I9\ *) do_install_zram ;;
      I10\ *) do_install_nfs_client ;;
      I11\ *) do_install_nfs_server ;;
      I12\ *) do_install_ddclient ;;
      I13\ *) do_atomic ;;
      I14\ *) do_openvpn ;;
      I15\ *) do_install_networkmanager ;;
      I16\ *) do_plesk ;;
      I17\ *) do_install_plex ;;
      I18\ *) do_install_vnc ;;
      I20\ *) do_virtualbox ;;
      I21\ *) do_vboxextpack ;;
      I22\ *) do_vboxguestadd ;;
      *) whiptail --msgbox "Programmer error: unrecognized option" 20 60 1 ;;
    esac || whiptail --msgbox "There was an error running option $FUN" 20 60 1
 else
   exit 1
  fi
}
################################ Install package

do_install_package() {
        PACKAGE=$(whiptail --inputbox "Package name?" "$WT_HEIGHT" "$WT_WIDTH" 3>&1 1>&2 2>&3)

        if [ $(dpkg-query -W -f='${Status}' $PACKAGE 2>/dev/null | grep -c "ok installed") -eq 1 ]; then
        echo "$PACKAGE is already installed!"
else
        apt-get install "$PACKAGE" -y
  whiptail --msgbox "$PACKAGE is now installed..." "$WT_HEIGHT" "$WT_WIDTH"
fi
}
################################ Install Plesk

do_plesk() {
  {
  i=1
  while read -r line; do
      i=$(( $i + 1 ))
      echo $i
  done < <(apt-get update)
} | whiptail --title "Progress" --gauge "Please wait while updating" 6 60 0

apt-get remove apparmor -y
wget -O - http://autoinstall.plesk.com/one-click-installer | sh
/etc/init.d/psa status
apt-get install mcrypt -y
apt-get install php-mcrypt -y
apt-get install php-ioncube-loader -y
apt-get install php-apc -y
apt-get install php-memcached memcached -y
apt-get install php-imap -y
phpenmod imap
do_update
service apache2 restart
}
################################ Install Zram-config

do_install_zram() {
if [ $(dpkg-query -W -f='${Status}' zram-config 2>/dev/null | grep -c "ok installed") -eq 1 ]; then
      echo "Zram is already installed!"
else
apt-get install zram-config -y
whiptail --msgbox "Zram-config is now installed..." "$WT_HEIGHT" "$WT_WIDTH"
ASK_TO_REBOOT=1
do_finish
fi
}
################################# Update

do_update() {
  if [ $(dpkg-query -W -f='${Status}' aptitude 2>/dev/null | grep -c "ok installed") -eq 1 ]; then
        echo "Aptitude is already installed!"
  else
      apt-get install aptitude -y
  fi

   {
    i=1
    while read -r line; do
        i=$(( $i + 1 ))
        echo $i
    done < <(sleep 1 && apt-get autoclean)
  } | whiptail --title "Progress" --gauge "Please wait while auto cleaning" 6 60 0

    {
    i=1
    while read -r line; do
        i=$(( $i + 1 ))
        echo $i
    done < <(sleep 1 && apt-get autoremove -y)
  } | whiptail --title "Progress" --gauge "Please wait while auto removing un-needed dependancies" 6 60 0

    {
    i=1
    while read -r line; do
        i=$(( $i + 1 ))
        echo $i
    done < <(apt-get update)
  } | whiptail --title "Progress" --gauge "Please wait while updating" 6 60 0

    {
    i=1
    while read -r line; do
        i=$(( $i + 1 ))
        echo $i
    done < <(sleep 1 && apt-get upgrade -y)
  } | whiptail --title "Progress" --gauge "Please wait while upgrading" 6 60 0

    {
    i=1
    while read -r line; do
        i=$(( $i + 1 ))
        echo $i
    done < <(sleep 1 && apt-get install -fy)
  } | whiptail --title "Progress" --gauge "Please wait while forcing install of dependancies" 6 60 0

    {
    i=1
    while read -r line; do
        i=$(( $i + 1 ))
        echo $i
    done < <(sleep 1 && apt-get dist-upgrade -y)
 } | whiptail --title "Progress" --gauge "Please wait while doing dist-upgrade" 6 60 0

    {
    i=1
    while read -r line; do
        i=$(( $i + 1 ))
        echo $i
    done < <(aptitude full-upgrade -y)
  } | whiptail --title "Progress" --gauge "Please wait while upgrading with aptitude" 6 60 0

        dpkg --configure --pending

  if [ -f "$SCRIPTS"/mti.sh ]; then
          rm "$SCRIPTS"/mti.sh
  fi

  if [ -f /usr/sbin/mti ]; then
          rm /usr/sbin/mti
  fi
          mkdir -p "$SCRIPTS"
          wget -q https://github.com/RPTST/MTS/mti.sh -P "$SCRIPTS"
          cp "$SCRIPTS"/techandtool.sh /usr/sbin/techandtool
          chmod +x /usr/sbin/techandtool

          if [ -f "$SCRIPTS"/mti.sh ]; then
                  rm "$SCRIPTS"/mti.sh
          fi
          exec mti
}

################################################ Reboot

do_reboot() {
  whiptail --yesno "Would you like to reboot now?" "$WT_HEIGHT" "$WT_WIDTH"
  if [ $? -eq 0 ]; then # yes
    reboot
  fi
}

################################################ Poweroff

do_poweroff() {
    whiptail --yesno "Would you like to shutdown now?" "$WT_HEIGHT" "$WT_WIDTH"
    if [ $? -eq 0 ]; then # yes
      shutdown now
    fi
}

################################################ System Info

do_option22() {
      E='echo -e';e='echo -en';trap "R;exit" 2
    ESC=$( $e "\e")
   TPUT(){ $e "\e[${1};${2}H";}
  CLEAR(){ $e "\ec";}
  CIVIS(){ $e "\e[?25l";}
   DRAW(){ $e "\e%@\e(0";}
  WRITE(){ $e "\e(B";}
   MARK(){ $e "\e[7m";}
 UNMARK(){ $e "\e[27m";}
      R(){ CLEAR ;stty sane;$e "\ec\e[37;44m\e[J";};
   HEAD(){ DRAW
           for each in $(seq 1 13);do
           $E "   x                                          x"
           done
           WRITE;MARK;TPUT 1 5
           $E "BASH SELECTION MENU                       ";UNMARK;}
           i=0; CLEAR; CIVIS;NULL=/dev/null
   FOOT(){ MARK;TPUT 13 5
           printf "ENTER - SELECT,NEXT                       ";UNMARK;}
  ARROW(){ read -s -n3 key 2>/dev/null >&2
           if [[ $key = $ESC[A ]];then echo up;fi
           if [[ $key = $ESC[B ]];then echo dn;fi;}
     M0(){ TPUT  4 20; $e "Login info";}
     M1(){ TPUT  5 20; $e "Network";}
     M2(){ TPUT  6 20; $e "Disk";}
     M3(){ TPUT  7 20; $e "Routing";}
     M4(){ TPUT  8 20; $e "Time";}
     M5(){ TPUT  9 20; $e "ABOUT  ";}
     M6(){ TPUT 10 20; $e "EXIT   ";}
      LM=6
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
     ES(){ MARK;$e "ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
        0) S=M0;SC;if [[ $cur == "" ]];then R;$e "\n$(w        )\n";ES;fi;;
        1) S=M1;SC;if [[ $cur == "" ]];then R;$e "\n$(ifconfig )\n";ES;fi;;
        2) S=M2;SC;if [[ $cur == "" ]];then R;$e "\n$(df -h    )\n";ES;fi;;
        3) S=M3;SC;if [[ $cur == "" ]];then R;$e "\n$(route -n )\n";ES;fi;;
        4) S=M4;SC;if [[ $cur == "" ]];then R;$e "\n$(date     )\n";ES;fi;;
        5) S=M5;SC;if [[ $cur == "" ]];then R;$e "\n$($e by oTo)\n";ES;fi;;
        6) S=M6;SC;if [[ $cur == "" ]];then R;exit 0;fi;;
esac;POS;done
}

################################################ System info

do_system() {
if [ $(dpkg-query -W -f='${Status}' landscape-common 2>/dev/null | grep -c "ok installed") -eq 1 ]; then
        echo "Landscape-common is already installed..."
else
  {
   i=1
   while read -r line; do
       i=$(( $i + 1 ))
       echo $i
   done < <(apt-get update && apt-get install landscape-common -y)
 } | whiptail --title "Progress" --gauge "Please wait while installing landscape..." 6 60 0
fi

  HEADER=$(bash /etc/update-motd.d/00-header)
  SYSINFO=$(landscape-sysinfo)
  UPDATESAV=$(bash /etc/update-motd.d/90-updates-available)
  FSCK=$(bash /etc/update-motd.d/98-fsck-at-reboot)
  REBOOT=$(bash /etc/update-motd.d/98-reboot-required )
  RELEASE=$(bash /etc/update-motd.d/91-release-upgrade)

  whiptail --title "System Information - Scroll down for more info" --msgbox "\
  $HEADER\

  $SYSINFO\

  $UPDATESAV
  $FSCK
  $REBOOT
  $RELEASE\
  " "$WT_HEIGHT" "$WT_WIDTH" --scrolltext
}

################################################ Main menu
calc_wt_size
while true; do
  FUN=$(whiptail --backtitle "Master Installer - main menu" --title "Master Installer" --me>
    "1 MTI" "Stuff" \
    "2 Tools" "Various tools" \
    "3 Packages" "Install various software packages" \
    "4 Firewall" "Enable/disable and open/close ports" \
    "5 Raspberry" "Specific tools for RPI 1, 2, 3 and zero" \
    "6 Update & upgrade" "Updates and upgrades packages and get the latest version of this tool" \
    "7 Reboot" "Reboots your machine" \
    "8 Shutdown" "Shutdown your machine" \
    "9 About Tech and Tool" "Information about this tool" \
    "10 System Information" "Show available updates, releases and sys info" \
    "11 Alt System Information" "Show sytem information" \
    3>&1 1>&2 2>&3)
  RET=$?
  if [ $RET -eq 1 ]; then
        do_finish
  elif [ $RET -eq 0 ]; then
    case "$FUN" in
      1\ *) do_mti ;;
      2\ *) do_tools ;;
      3\ *) do_install ;;
      4\ *) do_firewall ;;
      5\ *) do_Raspberry ;;
      6\ *) do_update ;;
      7\ *) do_reboot ;;
      8\ *) do_poweroff ;;
      9\ *) do_about ;;
      10\ *) do_system ;;
      11\ *) do_option22 ;;
      *) whiptail --msgbox "Programmer error: unrecognized option" 20 60 1 ;;
    esac || whiptail --msgbox "There was an error running option $FUN" 20 60 1
 else
   exit 1
  fi
done
