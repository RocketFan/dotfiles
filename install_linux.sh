#!/bin/bash

set -e

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_NVIM=true

while [[ $# -gt 0 ]]; do
  case $1 in
    --without-nvim)
	  INSTALL_NVIM=false
	  shift
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      ;;
  esac
done

sys_version=$(lsb_release -cs)


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
sudo apt install git wget maim curl python3-pip -y

# Install compositior for opacity
sudo apt install picom -y

#######
# VIM #
#######

if [[ $INSTALL_NVIM == true ]]; then
	$BASEDIR/nvim/install_linux.sh
fi

##############
# Nerd Fonts #
##############

FONT_DIR=~/.local/share/fonts
mkdir -p $FONT_DIR
cd $FONT_DIR
nerd_fonts_count=$(ls *Nerd*.ttf | wc -l)

if [[ $nerd_fonts_count -ge 3 ]]; then
	echo "Nerd fonts already installed!"
else
	FONT_URL=https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack

	# Hack fonts
	wget -q -O "HackNerdFont-Regular.ttf" "$FONT_URL/Regular/HackNerdFont-Regular.ttf?raw=true"
	wget -q -O "HackNerdFont-Bold.ttf" "$FONT_URL/Bold/HackNerdFont-Bold.ttf?raw=true"
	wget -q -O "HackNerdFont-Italic.ttf" "$FONT_URL/Italic/HackNerdFont-Italic.ttf?raw=true"

	fc-cache -f
fi

############
# Setup i3 #
############

cd /tmp
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
sudo apt install ./keyring.deb
echo "deb [arch=$(dpkg --print-architecture)] http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
sudo apt install i3

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
        pavucontrol \
        bat \
		htop

# nitrogen - wallpapers
# arandr - manage multiple screens
# pavucontrol - sound control
# bat - cat with syntax highlighting
# htop - view running processes

# Install Docker
$BASEDIR/install/docker.sh

#############
# Alacritty #
#############

sudo add-apt-repository ppa:aslatter/ppa -y
sudo apt install alacritty

# Set polish keyboard layout
setxkbmap -layout pl

#######
# ZSH #
#######

sudo apt install zsh -y
if [[ ! -d ~/.oh-my-zsh ]]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
export ZSH_CUSTOM=~/.oh-my-zsh/custom
if [[ -d $ZSH_CUSTOM/plugins ]]; then
	sudo rm -r $ZSH_CUSTOM/plugins
fi

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone  https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode

##############
# Mini Conda #
##############

if [[ ! -d ~/miniconda3 ]]; then
	cd /tmp
	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
	chmod +x Miniconda3-latest-Linux-x86_64.sh
	./Miniconda3-latest-Linux-x86_64.sh

	source ~/miniconda3/bin/activate
	conda init zsh
	conda init bash
	source ~/.bashrc
	
	conda config --set auto_activate_base false
fi

cd $BASEDIR