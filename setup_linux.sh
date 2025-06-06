#!/bin/bash
# [ $? -eq 0 ] checks if the previous command succeeded

set -e  # Exit script if any command fails

# First setup the WM config
xdg-user-dirs-update && \
cd ~/Documents && \
git clone git@github.com:Z-Alos/Arch-Configuration.git && \
cd Arch-Configuration && \
cp i3.config ~/.config/i3/config

# Keyboard Setup
cd "Keyboard Layouts" && \
cp Xmodmap_Dvorak.config ~/.Xmodmap && \
cp change_to_dvorak.sh ~ && \
bash ~/change_to_dvorak.sh

# Picom Setup
cd .. && \
cp picom.conf ~/.config/picom.conf

# Kitty Setup
cd kitty && \
cp current-theme.conf ~/.config/kitty/ && \
cp kitty.conf ~/.config/kitty/

# Neovim Setup
mkdir -p ~/.config/nvim
cd ~
cd Documents && \
git clone git@github.com:Z-Alos/Neovim-Config.git && \
cp -r Neovim-Config/* ~/.config/nvim && \
git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
