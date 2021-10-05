#!/bin/bash
# Commands that you don't want running as root would be invoked
# with: sudo -u $real_user
# So they will be run as the user who invoked the sudo command
# Keep in mind if the user is using a root shell (they're logged in as root),
# then $real_user is actually root
# sudo -u $real_user non-root-command
# Commands that need to be ran with root would be invoked without sudo
# root-command
filename=".bashrc"
search="ls --color=auto"
replace="lsd"

     mkdir $HOME/projects
     cd $HOME/projects/
     wget -P ~/projects https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd-musl_0.20.1_arm64.deb
     sudo dpkg -i lsd-musl_0.20.1_arm64.deb
     sed -i "s/$search/$replace/" $HOME/$filename
#     sudo apt install cargo rust
#     cargo install lsd
