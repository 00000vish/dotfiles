#!/usr/bin/bash

echo " "
echo "[::]Updating System[::]"
echo " "
sudo pacman -Syu
echo " "

echo " "
echo "[::]Installing System[::]"
echo " "
sudo pacman -S firefox git \
     networkmanager-openvpn \
     tmux fish starship  \
     zip unzip timeshift \
     obs-studio qt6-wayland gimp \
     noto-fonts-cjk noto-fonts-emoji noto-fonts
echo " "

echo " "
echo "[::]Installing QEMU[::]"
echo " "
sudo pacman -S qemu-full libvirt dnsmasq swtpm virt-manager 
echo " "

sudo usermod -a -G libvirt $USER
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

echo " "
echo "[::]Setting Up Things[::]"
echo " "
git config --global core.editor vim
echo " "

echo " "
echo "[::] Install Complete [::]"
