#!/bin/bash
# Docker

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
