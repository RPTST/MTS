# Install flatpack
#
sudo apt update
sudo apt upgrade -y
sudo apt install flatpak -y
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#
