#!/bin/bash

#get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

APPCONFIG_PATH=$MY_PATH/appconfig
MISC_PATH=$MY_PATH/misc

cd $MY_PATH
git pull

#initialize submodules
git submodule update --init --recursive

#update and upgrade current packages
sudo apt-get -y update
sudo apt-get -y upgrade

#install essentials
sudo apt-get -y install build-essential make cmake cmake-curses-gui ccache pkg-config automake autoconf libc++-dev clang clang-format

#install tools
sudo apt-get -y install htop tree ncdu git subversion unzip exuberant-ctags xclip xsel

#install cifs-utils for mounting dataset repository
sudo apt-get -y install cifs-utils exfat-fuse exfat-utils

#install programs
#sudo apt-get -y install vlc mplayer ffmpeg okular krita imagemagick

#install tmux
bash $APPCONFIG_PATH/tmux/install.sh

#install vim
bash $APPCONFIG_PATH/vim/install.sh

#install ranger
bash $APPCONFIG_PATH/ranger/install.sh

#install tex
bash $APPCONFIG_PATH/tex/install.sh

#install ros
bash $APPCONFIG_PATH/ros/install.sh

#install python libs
#bash $APPCONFIG_PATH/python/install.sh

#add aliases
#sudo ln -s /usr/bin/xdg-open /usr/bin/open

#add user to dialout group
#sudo adduser `whoami` dialout
#sudo apt-get -y install gtkterm

#copy udev-rules
#bash $MISC_PATH/udev/install.sh 
