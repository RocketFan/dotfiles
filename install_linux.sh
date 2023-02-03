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
sudo apt install git wget npm -y

# Install lst Node
sudo npm install -g n
sudo n latest

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
# Setup vim #
#############

# Install NVIM
sudo snap install nvim --classic
echo 'alias vim="nvim"' >> ~/.bashrc

# Install vim plugins
nvim +PlugInstall +qall

# Install YCM for vim
sudo apt install build-essential cmake python3-dev -y
python3 ~/.local/share/nvim/plugged/youcompleteme/install.py --clangd-completer

# Install LazyGit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

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

sudo apt install -y nitrogen arandr

# nitrogen - wallpapers
# arandr - manage multiple screens

#############
# Alacritty #
#############

sudo snap install alacritty --classic
