#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y ccache cmake bison flex
#if [ ! -e /tmp/radare2 ]; then
#  git clone https://github.com/radareorg/radare2.git /tmp/radare2 
#fi
#cd /tmp/radare2
#sudo sys/install.sh --install
#sudo rm -rf /tmp/*

r2pm init
r2pm update
r2pm -i r2ghidra-dec
