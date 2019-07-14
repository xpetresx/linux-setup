#!/bin/bash

# get the path to this script
APP_PATH=`dirname "$0"`
APP_PATH=`( cd "$APP_PATH" && pwd )`

toilet Installing tmux

sudo apt-get -y install tmux

# symlink tmux settings
rm ~/.tmux.conf
ln -s $APP_PATH/dottmux.conf ~/.tmux.conf
