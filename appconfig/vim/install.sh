#!/bin/bash

# get the path to this script
APP_PATH=`dirname "$0"`
APP_PATH=`( cd "$APP_PATH" && pwd )`

    sudo apt-get -y install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev

    # compile vim from sources
    cd $APP_PATH/../../submodules/vim
    ./configure --with-features=huge \
      --enable-multibyte \
      --enable-rubyinterp=yes \
      --enable-python3interp=yes \
      --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu \
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
    make VIMRUNTIMEDIR=/usr/share/vim/vim80
    sudo make install

    # set vim as a default git mergetool
    git config --global merge.tool vimdiff

    # symlink vim settings
    rm ~/.vimrc
    rm -rf ~/.vim
    cp $APP_PATH/dotvimrc ~/.vimrc
    ln -fs $APP_PATH/dotvim ~/.vim

    # install patched fonts with powerline characters
    #cd $APP_PATH/../../submodules/fonts
    #./install.sh

    # updated new plugins and clean old plugins
    /usr/bin/vim -E -c "let g:user_mode=1" -c "so ~/.vimrc" -c "PlugInstall" -c "PlugClean" -c "wqa"
