#!/bin/bash
mkdir ~/Apps
cd ~/Apps
wget https://github.com/prateekmedia/appimagepool/releases/download/3.1.0/appimagepool-x86_64.AppImage
wget https://github.com/AppImage/AppImageUpdate/releases/download/continuous/AppImageUpdate-x86_64.AppImage
wget https://github.com/AppImage/AppImageUpdate/releases/download/continuous/AppImageUpdate-i386.AppImage
wget https://github.com/app-outlet/app-outlet/releases/download/v2.0.2/App.Outlet-2.0.2.AppImage
wget https://github.com/X0rg/CPU-X/releases/download/continuous/CPU-X-x86_64.AppImage
wget https://github.com/Ultimaker/Cura/releases/download/4.11.0/Ultimaker_Cura-4.11.0.AppImage

chmod +x *.AppImage

./App.Outlet-2.0.2.AppImage
./appimagepool-x86_64.AppImage
./AppImageUpdate-x86_64.AppImage
./AppImageUpdate-i386.AppImag
./CPU-X-x86_64.AppImage
./Ultimaker_Cura-4.11.0.AppImage
