#!/bin/bash

# Install NVIM
sudo snap install nvim
echo 'alias vim="nvim"' >> ~/.bashrc

# Install i3
sudo add-apt-repository -y ppa:regolith-linux/stable
sudo apt install i3-gaps

# Link dotfiles
./install

# Install vim plugins
nvim +PlugInstall +qall

# Install YCM for vim
sudo apt install build-essential cmake3 python3-dev
python3 ~/.local/share/nvim/plugged/youcompleteme/install.sh --clangd-completer
