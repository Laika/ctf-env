#!/bin/bash -e 

TMPDIR="${TMPDIR:-/tmp}"
INIT_PATH="$(pwd)"
TOOL_PATH="${HOME}/CTF/Tools"


sudo apt-get update -y
sudo apt-get install -y git build-essential libssl-dev zlib1g-dev yasm pkg-config libgmp-dev libpcap-dev libbz2-dev


if [ ! -e ${TOOL_PATH}/john ]; then
    git clone https://github.com/magnumripper/JohnTheRipper -b bleeding-jumbo ${TOOL_PATH}/john
fi

cd ${TOOL_PATH}/john/src

./configure && make -s clean 
make -j$(nproc)

sudo ln -sf ${TOOL_PATH}/john/run/john /usr/bin/john
sudo ln -sf ${TOOL_PATH}/john/run/zip2john /usr/bin/zip2john

cd ${INIT_PATH}
