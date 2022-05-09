#!/bin/bash

# get the path to this script
APP_PATH=`dirname "$0"`
APP_PATH=`( cd "$APP_PATH" && pwd )`

sudo apt install tmux -y

# symlink tmux settings
rm ~/.tmux.conf
ln -s $APP_PATH/dottmux.conf ~/.tmux.conf

#add tmux startup if it is not already in .bashrc 
num=`cat ~/.bashrc | grep "RUN_TMUX" | wc -l`
if [ "$num" -lt "1" ]; then
    cat $APP_PATH/bashconfig >> ~/.bashrc
fi

