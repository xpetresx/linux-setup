#!/bin/bash

#add source
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

#add trusted key
sudo apt-key -y adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

#update
sudo apt-get -y update

#install ros
sudo apt-get -y install ros-melodic-desktop-full

#init rosdep
sudo rosdep init
rosdep update

#add ros to .bashrc
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
