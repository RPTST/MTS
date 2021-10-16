#!/bin/bash

sudo apt install software-properties-common
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt-get install appimagelauncher
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_armhf.deb
dpkg -i appimagelauncher_2.2.0-travis995.0f91801.bionic_armhf.deb

mkdir ~/Apps
cd ~/Apps
wget https://github.com/prateekmedia/appimagepool/releases/download/3.1.0/appimagepool-x86_64.AppImage
wget https://github.com/AppImage/AppImageUpdate/releases/download/continuous/AppImageUpdate-x86_64.AppImage
wget https://github.com/AppImage/AppImageUpdate/releases/download/continuous/AppImageUpdate-i386.AppImage
wget https://github.com/app-outlet/app-outlet/releases/download/v2.0.2/App.Outlet-2.0.2.AppImage
wget https://github.com/X0rg/CPU-X/releases/download/continuous/CPU-X-x86_64.AppImage
wget https://github.com/Ultimaker/Cura/releases/download/4.11.0/Ultimaker_Cura-4.11.0.AppImage
wget https://github.com/streamlink/streamlink-appimage/releases/download/2.4.0-1/streamlink-2.4.0-1-cp39-cp39-manylinux2014_x86_64.AppImage
wget https://github.com/streamlink/streamlink-appimage/releases/download/2.4.0-1/streamlink-2.4.0-1-cp39-cp39-manylinux2014_aarch64.AppImage
wget https://github.com/srevinsaju/Thunderbird-AppImage/releases/download/stable/Thunderbird-91.2_20211004152603.AppImage
wget https://github.com/radiium/turntable/releases/download/v0.2.0-beta/Turntable-0.2.0-beta-x86_64.AppImage
wget https://github.com/cmatomic/VLCplayer-AppImage/releases/download/3.0.11.1/VLC_media_player-3.0.11.1-x86_64.AppImage
wget https://github.com/dalboris/vpaint/releases/download/v1.7/VPaint-1.7-x86_64.AppImage
wget https://github.com/kbumsik/VirtScreen/releases/download/0.3.1/VirtScreen.AppImage
wget https://github.com/durasj/webamp-desktop/releases/download/v0.3.0/webamp-desktop-0.3.0-x86_64.AppImage
wget https://github.com/probonopd/XChat/releases/download/continuous/XChat_IRC-5d0dbe1-x86_64.AppImage
wget https://github.com/BeeeQueue/yuna/releases/download/v1.4.23/Yuna-1.4.23.AppImage
wget https://github.com/flameshot-org/flameshot/releases/download/v0.9.0/Flameshot-0.9.0.x86_64.AppImage
wget https://github.com/dmooney65/fmradio/releases/download/untagged-d88616653b8f7b6d1402/fmradio-0.9.4-x86_64.AppImage
wget https://github.com/jitsi/jitsi-meet-electron/releases/download/v2.9.0/jitsi-meet-x86_64.AppImage
wget https://github.com/martijnmichel/nordvpn-linux/releases/download/v0.6.0/NordVPN.for.Linux-0.6.0.AppImage
wget https://github.com/notepadqq/notepadqq/releases/download/continuous/notepadqq-.glibc2.14-x86_64.AppImage
wget https://github.com/mmatyas/openblok/releases/download/v0.8.3/openblok_v083_linux-x64.AppImage
wget https://github.com/unofficial-protonmail-desktop/application/releases/download/v1.2.1/Unofficial-desktop-client-for-ProtonMail-1.2.1.AppImage
wget https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.3.8.10/qBittorrent-Enhanced-Edition.AppImage
wget https://github.com/mypaint/mypaint/releases/download/v2.0.1/MyPaint-v2.0.1.AppImage
wget https://github.com/nextcloud/desktop/releases/download/v3.3.5/Nextcloud-3.3.5-x86_64.AppImage
wget https://github.com/olive-editor/olive/releases/download/0.1.0/Olive-1e3cf53-x86_64.AppImage
wget https://github.com/openaudible/openaudible/releases/download/v3.1.2/OpenAudible_3.1.2_x86_64.AppImage
wget https://files.openscad.org/OpenSCAD-2021.01-x86_64.AppImage
wget https://github.com/knapsu/plex-media-player-appimage/releases/download/v2.58.0.1076-38e019da/Plex_Media_Player_2.58.0.1076-38e019da_x64_20201205.AppImage
wget https://github.com/pop-os/popsicle/releases/download/1.3.0/Popsicle_USB_Flasher-1.3.0-x86_64.AppImage
wget https://github.com/suciptoid/postman-appimage/releases/download/continous/Postman-8.12.4-x86_64.AppImage
wget https://download.opensuse.org/repositories/home:/pbek:/QOwnNotes/AppImage/QOwnNotes-latest-x86_64.AppImage
wget https://github.com/hizzlekizzle/RetroArch-AppImage/releases/download/Linux_LTS_Nightlies/RetroArch-Linux-x86_64-Nightly.AppImage
wget https://github.com/SabakiHQ/Sabaki/releases/download/v0.52.0/sabaki-v0.52.0-linux-x64.AppImage
wget https://sourceforge.net/projects/scribus/files/scribus-devel/1.5.5/scribus-1.5.5-linux-x86_64.AppImage/download
wget https://github.com/mltframework/shotcut/releases/download/v21.09.20/shotcut-linux-x86_64-210920.AppImage
wget https://github.com/smallbasic/SmallBASIC/releases/download/v12.23/SmallBASIC-SDL_12.23-2-x86_64.AppImage
wget https://github.com/evpo/EncryptPad/releases/download/v0.5.0.1/encryptpad0_5_0_1.AppImage
wget https://github.com/balena-io/etcher/releases/download/v1.6.0/balenaEtcher-1.6.0-x64.AppImage
wget https://github.com/tkashkin/GameHub/releases/download/0.16.1-2-master/GameHub-bionic-0.16.1-2-master-2ec448a-x86_64.AppImage
wget https://github.com/tkashkin/GameHub/releases/download/0.16.1-2-master/GameHub-bionic-0.16.1-2-master-2ec448a.flatpak
wget https://github.com/keepassxreboot/keepassxc/releases/download/2.6.6/KeePassXC-2.6.6-x86_64.AppImage
wget https://download.kde.org/stable/kdenlive/21.08/linux/kdenlive-21.08.2-x86_64.appimage
wget https://download.kde.org/stable/krita/4.4.8/krita-4.4.8-x86_64.appimage
wget https://libreoffice.soluzioniopen.com/stable/full/LibreOffice-fresh.full-x86_64.AppImage
wget https://download.librepcb.org/releases/0.1.5/librepcb-0.1.5-linux-x86_64.AppImage
wget https://github.com/LibreSprite/LibreSprite/releases/download/v1.0-beta.1/libreSprite-x64-pre-release.AppImage
wget https://www.linphone.org/snapshots/AppImages/Linphone-4.3.0-beta.72+5ff2e5af.AppImage
wget https://github.com/cnr-isti-vclab/meshlab/releases/download/Meshlab-2021.07/MeshLab2021.07-linux.AppImage
wget https://github.com/cnr-isti-vclab/meshlab/releases/download/Meshlab-2021.07/MeshLab2021.07d-linux.AppImage
wget https://github.com/moonlight-stream/moonlight-qt/releases/download/v3.1.4/Moonlight-3.1.4-x86_64.AppImage


chmod +x *.AppImage
#Just double click on the app to install
