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
     tmux fish starship alacritty \
     zip unzip less code \
     docker docker-compose docker-buildx \
     obs-studio qt6-wayland gimp \
     noto-fonts-cjk noto-fonts-emoji noto-fonts \
     gnome-themes-standard
echo " "

echo " "
echo "[::]Installing QEMU[::]"
echo " "
sudo pacman -S qemu-full libvirt dnsmasq swtpm virt-manager virt-viewer
echo " "

sudo usermod -a -G libvirt $USER
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

echo " "
echo "[::]Setting Up Things[::]"
echo " "
git config --global core.editor vim
git config --global init.defaultBranch main
git config --global credential.helper store
dconf load / < ./.gnome.dconf
echo " "

echo " "
echo "[::] Install Complete [::]"
