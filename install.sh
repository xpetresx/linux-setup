#!/bin/bash

#get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

APPCONFIG_PATH=$MY_PATH/appconfig

cd $MY_PATH
git pull
git submodule init 
git submodule update --init --recursive

exit 0

#update and upgrade current packages
sudo apt-get -y update
sudo apt-get -y upgrade

#install essentials
sudo apt-get -y install build-essential make cmake ccache pkg-config automake autoconf libc++-dev clang-6.0 clang-format-6.0 python2.7-dev python3-dev

#install libs
sudo apt-get -y install libncurses5-dev libsdl2-dev

#install tools
sudo apt-get -y install htop tree ncdu git subversion unzip dialog

#video processing 
sudo apt-get -y install vlc mplayer ffmpeg

#install vim
bash $APPCONFIG_PATH/vim/install.sh

#install tmux
bash $APPCONFIG_PATH/tmux/install.sh

#install opencv
bash $APPCONFIG_PATH/opencv/install.sh

#install ros
bash $APPCONFIG_PATH/ros/install.sh

#install python packages
sudo apt-get install python-pip
pip install numpy scipy matplotlib

#add aliases
sudo ln -s /usr/bin/xdg-open /usr/bin/open

#add tmux startup if it is not already in .bashrc 
num=`cat ~/.bashrc | grep "RUN_TMUX" | wc -l`
if [ "$num" -lt "1" ]; then
    cat $APPCONFIG_PATH/tmux/bashconfig >> ~/.bashrc
fi

