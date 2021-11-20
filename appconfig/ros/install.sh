#!/bin/bash

distro=`lsb_release -r | awk '{ print $2 }'`
[ "$distro" = "18.04" ] && ROS_DISTRO="melodic"
[ "$distro" = "20.04" ] && ROS_DISTRO="noetic"

#add source
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

#add trusted key
sudo apt install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

#update
sudo apt update

#install ros 
sudo apt-get -y install ros-"$ROS_DISTRO"-desktop-full

#add ros to .bashrc
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

#init rosdep
sudo rosdep init
rosdep update

#install further ros packages
sudo apt-get -y install ros-"$ROS_DISTRO"-tf2-geometry-msgs
sudo apt-get -y install ros-"$ROS_DISTRO"-tf2-sensor-msgs
sudo apt-get -y install ros-"$ROS_DISTRO"-joy

