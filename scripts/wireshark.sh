#!/bin/bash -e

VER=3.2.6
FILENAME=wireshark-$VER.tar.xz

echo [+] Install requirements
sudo apt-get update -y
sudo apt-get install -y cmake flex bison libgcrypt20-dev libssh-dev libpcap-dev libsystemd-dev qtbase5-dev qttools5-dev qtmultimedia5-dev libqt5svg5-dev

echo [+] Download $FILENAME
if [ ! -e /tmp/$FILENAME ]; then
    wget -O /tmp/$FILENAME https://1.eu.dl.wireshark.org/src/$FILENAME 
fi
pushd /tmp
tar xf $FILENAME
mkdir -p /tmp/build
pushd /tmp/build

echo [+] Start building
cmake /tmp/wireshark-$VER
make -j$(nproc)
sudo make install
popd
popd
rm -rf /tmp/build
rm -f /tmp/$FILENAME*
echo [+] Done

