#!/bin/bash
# Install Oracle Java 17 LTS On Ubuntu, Debian, Linux Mint Or Pop!_OS
sudo add-apt-repository ppa:linuxuprising/java
sudo apt install oracle-java17-installer --install-recommends
echo oracle-java17-installer shared/accepted-oracle-license-v1-3 select true | sudo /usr/bin/debconf-set-selections
# If this does not work:
# echo oracle-java17-installer shared/accepted-oracle-licence-v1-3 boolean true | sudo /usr/bin/debconf-set-selections
