#!/bin/bash
#
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
