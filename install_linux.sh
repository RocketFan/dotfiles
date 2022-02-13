#!/bin/bash

# Link dotfiles
./install

# Install NVIM
sudo snap install nvim -y
echo 'alias vim="nvim"' >> ~/.bashrc

# Install vim plugins
nvim +PlugInstall +qall

# Install YCM for vim
sudo apt install build-essential cmake python3-dev -y
python3 ~/.local/share/nvim/plugged/youcompleteme/install.py --clangd-completer

# Install i3
sudo add-apt-repository -y ppa:regolith-linux/stable
sudo apt install i3-gaps -y
# For control brightness on laptops
sudo apt install light -y
sudo chmod +s /usr/bin/light
# Enable touchpad tap
sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null 
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
EndSection

EOF
