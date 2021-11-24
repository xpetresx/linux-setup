#!/bin/bash

# get the path to this script
APP_PATH=`dirname "$0"`
APP_PATH=`( cd "$APP_PATH" && pwd )`

#install prerequisites
sudo apt-get -y install caca-utils libimage-exiftool-perl w3m w3m-img

#install ranger
( cd $APP_PATH/../../submodules/ranger && sudo make install )

#configure ranger
mkdir -p ~/.config/ranger
ln -fs $APP_PATH/rifle.conf ~/.config/ranger/rifle.conf
ln -fs $APP_PATH/commands.py ~/.config/ranger/commands.py
ln -fs $APP_PATH/rc.conf ~/.config/ranger/rc.conf
ln -fs $APP_PATH/scope.sh ~/.config/ranger/scope.sh
