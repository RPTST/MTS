#!/bin/bash
# Commands that you don't want running as root would be invoked
# with: sudo -u $real_user
# So they will be run as the user who invoked the sudo command
# Keep in mind if the user is using a root shell (they're logged in as root),
# then $real_user is actually root
# sudo -u $real_user non-root-command
# Commands that need to be ran with root would be invoked without sudo
# root-command

if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi

if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
    # install dependencies
    apt install libxcb-randr0-dev libxrandr-dev
    apt install libxcb-xinerama0-dev libxinerama-dev libxcursor-dev
    apt install libxcb-cursor-dev libxkbcommon-dev xutils-dev
    apt install xutils-dev libpthread-stubs0-dev libpciaccess-dev
    apt install libffi-dev x11proto-xext-dev libxcb1-dev libxcb-*dev
    apt install bison flex libssl-dev libgnutls28-dev x11proto-dri2-dev
    apt install x11proto-dri3-dev libx11-dev libxcb-glx0-dev
    apt install libx11-xcb-dev libxext-dev libxdamage-dev libxfixes-dev
    apt install libva-dev x11proto-randr-dev x11proto-present-dev
    apt install libclc-dev libelf-dev git build-essential mesa-utils
    apt install libvulkan-dev ninja-build libvulkan1 python-mako
    apt install libdrm-dev libxshmfence-dev libxxf86vm-dev libunwind-dev
    apt install valgrind libzstd-dev vulkan-tools vulkan-utils
    apt install libxcb-glx0-dev libx11-xcb-dev libxcb-dri2-0-dev
    apt install libxcb-dri3-dev libxcb-present-dev
    # remove old versions first
    sudo -u $real_user rm -rf /home/pi/mesa_vulkan

# install meson
    apt purge meson -y
    pip3 install meson


# install mako
    pip3 install mako

# install v3dv
    sudo -u $real_user mkdir ~/projects/
    sudo -u $real_user cd ~/projects/
    sudo -u $real_user git clone https://gitlab.freedesktop.org/mesa/mesa.git mesa_vulkan

# build v3dv (± 30 min)
    sudo -u $real_user cd mesa_vulkan/
    sudo -u $real_user CFLAGS="-mcpu=cortex-a72 -mfpu=neon-fp-armv8" \
      CXXFLAGS="-mcpu=cortex-a72 -mfpu=neon-fp-armv8" \
      meson --prefix /usr \
      -D platforms=x11 \
      -D vulkan-drivers=broadcom \
      -D dri-drivers= \
      -D gallium-drivers=kmsro,v3d,vc4 \
      -D buildtype=release build
    sudo -u $real_user ninja -C build -j4
    ninja -C build install

# check your driver
    sudo -u $real_user glxinfo -B

else
    real_user=$(whoami)
fi
