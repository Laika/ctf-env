#!/bin/bash


sudo apt-get update -y
sudo apt-get install -y unzip
# volatility
if [ ! -e /tmp/volatility_2.6_lin64_standalone.zip ]; then
  wget -q -O /tmp/volatility_2.6_lin64_standalone.zip http://downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_lin64_standalone.zip
fi

cd /tmp
unzip -q -o volatility_2.6_lin64_standalone.zip
sudo mv -f volatility_2.6_lin64_standalone/volatility_2.6_lin64_standalone /usr/local/bin/volatility
