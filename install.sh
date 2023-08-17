#!/bin/bash

# Going to home folder
cd

# Instaliing requirements
# i3
echo -e "\nInstalling i3 window manager...\n"
sudo pacman -S i3

# polybar
echo -e "\nInstalling polybar...\n"
sudo pacman -S cmake cairo xcb-util-cursor xcb-util-image xcb-util-wm xcb-util-xrm pkg-config python xcb-proto libmpdclient libnl libcurl-compat
git clone https://github.com/polybar/polybar.git
cd polybar && mkdir build && cd build && cmake ..
make -j$(nproc)
sudo make install
cd
mkdir -p $HOME/.config/polybar
install -Dm644 /usr/share/doc/polybar/config $HOME/.config/polybar/config

# mate-terminal
echo -e "\nInstalling mate-terminal...\n"
sudo pacman -S mate-terminal

# compton
echo -e "\nInstalling compton...\n"
sudo pacman -S picom

# feh
echo -e "\nInstalling feh...\n"
sudo pacman -S feh imagemagick ffmpeg

# neofetch
echo -e "\nInstalling neofetch...\n"
sudo pacman -S neofetch

# brave-browser
echo -e "\nInstalling Dependencies for brave-browser...\n"
sudo pacman -S curl
yay -S brave-bin

# w3m
echo -e "\nInstalling w3m...\n"
sudo pacman -S w3m

# i3-gaps
echo -e "\nInstalling i3-gaps...\n"
yay -S i3-gaps

# ranger
echo -e "\nInstalling ranger...\n"
sudo pacman -S ranger

# rofi
echo -e "\nInstalling rofi...\n"
sudo pacman -S rofi

# wallset
echo -e "\nInstalling wallset...\n"
git clone https://github.com/terroo/wallset
cd wallset
sudo bash install.sh
sudo ./install.sh --force #force installing
cd

# polybar-themes
echo -e "\nInstalling polybar-themes...\n"
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
cd polybar-themes
chmod +x setup.sh
echo "vvvvvvvvvvvvvvvvvvvvv"
echo "Now choose option 1"
sleep 7
./setup.sh
cd

# zsh
echo -e "\nInstalling zsh...\n"
sudo pacman -S zsh

# oh-my-zsh
echo -e "\nInstalling oh-my-zsh...\n"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
chsh -s $(which zsh)
