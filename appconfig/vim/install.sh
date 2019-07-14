#!/bin/bash

# get the path to this script
APP_PATH=`dirname "$0"`
APP_PATH=`( cd "$APP_PATH" && pwd )`

    sudo apt -y remove vim-*
    sudo apt -y remove clang-3.9
    sudo apt -y remove libclang-common-3.9-dev

    sudo apt -y install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python3-dev clang-format

    sudo -H pip3 install rospkg

    # compile vim from sources
    cd $APP_PATH/../../submodules/vim
    ./configure --with-features=huge \
      --enable-multibyte \
      --enable-rubyinterp=yes \
      --enable-python3interp=yes \
      --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
      --enable-perlinterp=yes \
      --enable-luainterp=yes \
      --enable-gui=gtk2 --enable-cscope --prefix=/usr

      ## add for python2
      # --enable-pythoninterp=yes \
      # --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \

      ## add for python3
      # --enable-python3interp=yes \
      # --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \

    cd src
    make
    cd ../
    make VIMRUNTIMEDIR=/usr/share/vim/vim81
    sudo make install

    # set vim as a default git mergetool
    git config --global merge.tool vimdiff

    # symlink vim settings
    rm -rf ~/.vim
    ln -fs $APP_PATH/dotvim ~/.vim
    ln -fs $APP_PATH/dotvimrc ~/.vimrc

    # install patched fonts with powerline characters
    cd $APP_PATH/../../submodules/fonts
    sudo ./install.sh

    # make Terminus work
    mkdir -p ~/.config/fontconfig/conf.d
    cp fontconfig/50-enable-terminess-powerline.conf ~/.config/fontconfig/conf.d
    fc-cache -vf

    # add variable for ctags sources into .bashrc
    num=`cat ~/.bashrc | grep "CTAGS_SOURCE_DIR" | wc -l`
    if [ "$num" -lt "1" ]; then

      echo "Adding CTAGS_SOURCE_DIR variable to .bashrc"
      # set bashrc
      echo '
# where should ctags look for sources to parse?
# -R dir1 -R dir2 ...
export CTAGS_SOURCE_DIR="-R ~/comrob_ws -R ~/darpa_ws"' >> ~/.bashrc

    fi

    # add variable for ctags sources into .bashrc
    num=`cat ~/.bashrc | grep "CTAGS_ONCE_SOURCE_DIR" | wc -l`
    if [ "$num" -lt "1" ]; then

      echo "Adding CTAGS_ONCE_SOURCE_DIR variable to .bashrc"
      # set bashrc
      echo '
# where should ctags look for sources to parse?
# CTAGS FROM THOSE FOLDERS WILL BE CREATED ONLY ONCE
# -R dir1 -R dir2 ...
export CTAGS_ONCE_SOURCE_DIR="-R /opt/ros/melodic/include"' >> ~/.bashrc

    fi

    #############################################
    # adding ROS_WORKSPACE variable to .bashrc 
    #############################################

    # add variable for path to the git repository
    num=`cat ~/.bashrc | grep "ROS_WORKSPACE" | wc -l`
    if [ "$num" -lt "1" ]; then

      echo "Adding ROS_WORKSPACE variable to .bashrc"
      # set bashrc
      echo "
# path to the ros workspace
export ROS_WORKSPACE=\"~/comrob_ws ~/darpa_ws\"" >> ~/.bashrc

    fi

    # updated new plugins and clean old plugins
    /usr/bin/vim -E -c "let g:user_mode=1" -c "so $APP_PATH/dotvimrc" -c "PlugInstall" -c "PlugClean" -c "wqa"
    
    # set youcompleteme
    toilet Setting up youcompleteme

    sudo apt-get -y install libboost-all-dev
    
    cd ~/.vim/plugged/youcompleteme/
    git submodule update --init --recursive
    python3 ./install.py --clang-completer

    # link .ycm_extra_conf.py
    ln -fs $APP_PATH/dotycm_extra_conf.py ~/.ycm_extra_conf.py

    #fix jellybeans scheme
    #cp $APP_PATH/dotvim/pluginconfig/jellybeans.vim $APP_PATH/dotvim/plugged/jellybeans.vim/colors
