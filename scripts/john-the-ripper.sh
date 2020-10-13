#!/bin/bash -e 


echo [+] Install requirements
sudo apt-get update -y
sudo apt-get install -y git build-essential libssl-dev zlib1g-dev yasm pkg-config libgmp-dev libpcap-dev libbz2-dev

echo [+] Clone from GitHub
if [ ! -e /tmp/john ]; then
    git clone https://github.com/magnumripper/JohnTheRipper -b bleeding-jumbo /tmp/john
fi

pushd /tmp/john/src

echo [+] Start building
./configure && make -s clean && make -j$(nproc)

echo [+] Make symbolic links
sudo mv $JOHNPATH/john/run/john /usr/bin/john
sudo mv $JOHNPATH/john/run/zip2john /usr/bin/zip2john


popd
echo [+] Done
