#!/bin/bash

echo [+] Cloning HashPump
git clone https://github.com/bwall/HashPump.git /tmp/HashPump

echo [+] Installing dependencies
sudo apt-get update -y
sudo apt-get install -y libssl-dev build-essential


echo [+] Start building
pushd /tmp/HashPump
make -j$(nproc) && sudo make install

cd /tmp
rm -rf HashPump
popd
echo [+] Done



