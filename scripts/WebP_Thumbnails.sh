# Install WebP Thumbnails In GTK App
sudo apt install libwebp-dev libgdk-pixbuf2.0-dev meson build-essential
mkdir ~/projects/
cd ~/projects/
wget https://github.com/aruiz/webp-pixbuf-loader/archive/refs/tags/0.0.3.tar.gz
tar -xf 0.0.3.tar.gz
cd webp-pixbuf-loader-0.0.3
meson builddir -Dgdk_pixbuf_query_loaders_path=/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders
ninja -C builddir
sudo ninja -C builddir install
sudo sed -i 's/\/usr\/local\/bin\/gdk-pixbuf-thumbnailer/\/usr\/bin\/gdk-pixbuf-thumbnailer/g' /usr/local/share/thumbnailers/webp-pixbuf.thumbnailer
