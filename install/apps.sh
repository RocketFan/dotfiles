#!/bin/bash

set -e
cd /tmp

sudo snap install code --classic
sudo snap install discord

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb