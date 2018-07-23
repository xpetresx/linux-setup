#!/bin/bash

# get the path to this script
APP_PATH=`dirname "$0"`
APP_PATH=`( cd "$APP_PATH" && pwd )`

#install python packages
sudo apt-get -y install python-pip
pip install numpy scipy matplotlib scikit.learn scikit.image pathlib
