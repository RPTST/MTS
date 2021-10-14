#!/bin/bash
# Docker
# Update your system

sudo apt update && sudo apt upgrade -y
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

# Install Docker

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo apt install docker.io
sudo docker run hello-world

# Install Docker-compose

sudo curl -L "https://github.com/docker/compose/releases/download/v2.0.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version


sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker


# Install Portainer

sudo docker run -d \
--name="portainer" \
--restart on-failure \
-p 9000:9000 \
-p 8000:8000 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainer_data:/data \
portainer/portainer-ce:latest


# Install templetes

# Under the add external templetes option paste this link
# https://github.com/SelfhostedPro/selfhosted_templates/blob/master/Template/portainer-v2.json

# lazydocker
mkdir ~/projects/
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
docker build -t lazyteam/lazydocker \
--build-arg BASE_IMAGE_BUILDER=arm64v8/golang \
--build-arg GOARCH=arm64 \
https://github.com/jesseduffield/lazydocker.git
docker run --rm -it -v \
/var/run/docker.sock:/var/run/docker.sock \
-v /yourpath:/.config/jesseduffield/lazydocker \
lazyteam/lazydocker
