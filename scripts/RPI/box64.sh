# Install box64
sudo apt update && sudo apt upgrade -y
sudo apt install screen dos2unix dosbox
mkdir ~/projects/
cd ~/projects/
git clone https://github.com/ptitSeb/box64
cd ~/projects/box64
mkdir -p ~/projects/box64/build
cd ~/projects/box64/build
cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
cmake -j4
sudo make install
sudo systemctl restart systemd-binfmt
