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
# sudo apt install picom -y

#######
# VIM #
#######

./nvim/install_linux.sh
echo 'alias vim="nvim"' >> ~/.bashrc

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

sudo apt install -y nitrogen arandr compton

# nitrogen - wallpapers
# arandr - manage multiple screens

#############
# Alacritty #
#############

sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty

# Set polish keyboard layout
setxkbmap -layout pl

# Set env variables
echo 'export GST_PLUGIN_SCANNER=/usr/lib/x86_64-linux-gnu/gstreamer1.0/gstreamer-1.0/gst-plugin-scanner' >> ~/.bashrc
echo 'export GST_PLUGIN_PATH=/usr/lib/x86_64-linux-gnu/gstreamer-1.0' >> ~/.bashrc
echo 'export GST_PLUGIN_SYSTEM_PATH=/usr/lib/x86_64-linux-gnu/gstreamer-1.0' >> ~/.bashrc
