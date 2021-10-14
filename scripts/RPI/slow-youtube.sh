#!/bin/bash
#
# slow youtube
sudo apt install python3 python3-pip mpv firefox rpi-chromium-mods
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

#For Firefox
cd ~/projects/
wget https://github.com/RPTST/MTS/blob/main/src/aecec67f-0d10-4fa7-b7c7-609a2db280cf.zip
cp aecec67f-0d10-4fa7-b7c7-609a2db280cf.zip ~/.mozilla/extensions/
cd ~/.mozilla/extensions/
unzip aecec67f-0d10-4fa7-b7c7-609a2db280cf.zip

#Register the new URL scheme handler with XDG
xdg-mime default mpv-handler.desktop x-scheme-handler/mpv

# And that's it. Open a video on YouTube and you should see a new floating button in the bottom left-hand side of the website. Click it and the web browser should ask you if you want to allow the site to open mpv links:
echo "user_pref("browser.startup.homepage", "https://www.startpage.com");" >> /etc/xul-ext/ubufox.js

# Chrome update for native Widevine
cd ~/projects/
wget http://archive.raspberrypi.org/debian/pool/main/w/widevine/libwidevinecdm0_4.10.2252.0-1_armhf.deb
dpkg -i libwidevinecdm0_4.10.2252.0-1_armhf.deb
