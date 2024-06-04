#!/usr/bin/bash

echo " "
echo "[::]Updating System[::]"
echo " "
sudo pacman -Syu
echo " "

echo " "
echo "[::]Installing System[::]"
echo " "
sudo pacman -S firefox mpv gimp networkmanager-openvpn pipewire bluez bluez-utils fish timeshift hyprpaper alacritty rofi waybar starship git zip unzip tmux neovim plasma-meta
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
echo "[::] Install Complete [::]"
