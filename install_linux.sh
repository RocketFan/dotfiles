#!/bin/bash

##########
# DotBot #
##########

# Link dotfiles
./setup.sh

################
# Dependencies #
################

# Update
sudo apt update

# Install some packages
sudo apt install git wget maim -y

# # Install compositior for opacity
sudo apt install picom -y

#######
# VIM #
#######
cd /tmp
./nvim/install_linux.sh

##############
# Nerd Fonts #
##############

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
FONT_URL=https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack

# Hack fonts
wget -O "HackNerdFont-Regular.ttf" "$FONT_URL/Regular/HackNerdFont-Regular.ttf?raw=true"
wget -O "HackNerdFont-Bold.ttf" "$FONT_URL/Bold/HackNerdFont-Bold.ttf?raw=true"
wget -O "HackNerdFont-Italic.ttf" "$FONT_URL/Italic/HackNerdFont-Italic.ttf?raw=true"

fc-cache -f -v

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

#####################
# Some usefull apps #
#####################

sudo apt install -y nitrogen \
        arandr \
        pavucontrol

# nitrogen - wallpapers
# arandr - manage multiple screens
# pavucontrol - sound control

#############
# Alacritty #
#############

sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty

# Set polish keyboard layout
setxkbmap -layout pl

##############
# Mini Conda #
##############

cd /tmp
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh
conda config --set auto_activate_base false