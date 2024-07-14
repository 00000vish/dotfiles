#!/usr/bin/bash

echo " "
echo "[::]Updating System[::]"
echo " "
sudo pacman -Syu
echo " "

echo " "
echo "[::]Installing System[::]"
echo " "
sudo pacman -S firefox mpv gimp networkmanager-openvpn \
     pipewire bluez bluez-utils fish timeshift hyprpaper \
     alacritty rofi waybar starship git zip unzip \
     tmux neovim qt6ct cliphist wl-clipboard polkit-kde-agent \
     noto-fonts-cjk noto-fonts-emoji noto-fonts
echo " "

echo " "
read -p 'Install KDE Desktop Enviroment?  (yes/skip): ' kdede
if [ $kdede = "yes" ]
  then
    echo " "
    echo "[::]Installing KDE Desktop Enviroment[::]"
    echo " "
    sudo pacman -S plasma-meta kde-applications 
fi
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
echo "[::]Uninstalling Junk[::]"
echo " "
sudo pacman -Runs wofi kitty 
echo " "

echo " "
echo "[::]Setting Up Things[::]"
echo " "
git clone https://github.com/00000vish/neovim ~/.config/nvim
git config --global core.editor nvim
echo " "

echo " "
echo "[::] Install Complete [::]"
