#!/bin/bash

# Install essential package

sudo pacman -Syu git base-devel --noconfirm --needed
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay && makepkg -si --noconfirm --needed

yay -Syu python rustup nodejs npm make cmake unzip neovim kitty fd lazygit btop stow --noconfirm --needed

# Nvim config
# mv ~/.config/nvim ~/.config/nvim.bak
# mv ~/.local/share/nvim ~/.local/share/nvim.bak
# git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim

# Install Rust
rustup update stable

# Enable configs
stow --adopt ../
