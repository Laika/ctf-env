#!/bin/bash

TMPDIR=${TMPDIR:-/tmp}
INITDIR=$(pwd)


echo [+] Installing dependencies
sudo apt-get update -y
sudo apt-get install -y libssl-dev build-essential

echo [+] Cloning HashPump
git clone https://github.com/bwall/HashPump.git ${TMPDIR}/HashPump

echo [+] Start building
cd ${TMPDIR}/HashPump
make -j$(nproc) && sudo make install

rm -rf ${TMPDIR}HashPump
cd ${INITDIR}
echo [+] Done



