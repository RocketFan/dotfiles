#!/bin/bash

##########
# DotBot #
##########

# Link dotfiles
./install

################
# Dependencies #
################

# Install some packages
sudo apt install git wget -y

# Install compositior for opacity
sudo apt install picom -y

##############
# Nerd Fonts #
##############

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
FONT_URL=https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack

# Hack fonts
wget -O "Hack Regular Nerd Font Complete.ttf" "$FONT_URL/Regular/complete/Hack Regular Nerd Font Complete.ttf?raw=true"
wget -O "Hack Bold Nerd Font Complete.ttf" "$FONT_URL/Bold/complete/Hack Bold Nerd Font Complete.ttf?raw=true"
wget -O "Hack Italic Nerd Font Complete.ttf" "$FONT_URL/Italic/complete/Hack Italic Nerd Font Complete.ttf?raw=true"

#############
# Alacritty #
#############

sudo snap install alacritty

#############
# Setup vim #
#############

# Install NVIM
sudo snap install nvim
echo 'alias vim="nvim"' >> ~/.bashrc

# Install vim plugins
nvim +PlugInstall +qall

# Install YCM for vim
sudo apt install build-essential cmake python3-dev -y
python3 ~/.local/share/nvim/plugged/youcompleteme/install.py --clangd-completer

############
# Setup i3 #
############

# Install i3-gaps
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

# Install nitrogen for wallpapers
sudo apt install nitrogen -y
