#!/bin/bash

#install prerequisities
sudo apt-get -y install libavcodec-dev libavformat-dev libavutil-dev libswscale-dev 

#download sources
cd /tmp
#opencv contrib package
git clone https://github.com/opencv/opencv_contrib.git --depth 1

#opencv core
git clone https://github.com/opencv/opencv.git --depth 1

#build opencv with extra packages
cd /tmp/opencv
mkdir build
cd build
cmake -DOPENCV_EXTRA_MODULES_PATH=/tmp/opencv_contrib/modules ..
make -j 4
sudo make install
