# Install Devinici 17

mkdir ~/projects/
cd ~/projects/
sudo apt install libssl1.1 ocl-icd-opencl-dev fakeroot xorriso
wget https://github.com/RPTST/MTS/blob/main/src/makeresolvedeb_1.5.1_multi.sh.tar.gz
* Goto https://www.blackmagicdesign.com/products/davinciresolve/ and download devinici 17
*Make sure both the DaVinci Resolve and the MakeResolveDeb script (the extracted .sh files) are in the same folder (the DaVinci_Resolve run file and makeresolvedeb sh file should be in the same folder).
cd ~/projects/DaVinci_Resolve*_Linux
./makeresolvedeb*.sh DaVinci_Resolve_*_Linux.run
sudo dpkg -i davinci-resolve*_amd64.deb
