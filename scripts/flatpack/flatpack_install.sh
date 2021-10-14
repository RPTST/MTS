# Install 0 A.D. (updated)
sudo apt update
sudo apt upgrade -y
sudo apt install flatpak -y
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo reboot
