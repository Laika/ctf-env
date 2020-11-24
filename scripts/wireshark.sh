#!/bin/bash -e

VER=3.4.0
FILENAME=wireshark-${VER}.tar.xz
INITIAL_PATH=$(pwd)
TMPDIR=${TMPDIR:-/tmp}

sudo apt-get update -y
sudo apt-get install -y cmake flex bison libgcrypt20-dev libssh-dev libpcap-dev libsystemd-dev qtbase5-dev qttools5-dev qtmultimedia5-dev libqt5svg5-dev

echo [+] Download ${FILENAME}
if [ ! -e ${TMPDIR}/${FILENAME} ]; then
    axel -a "https://1.eu.dl.wireshark.org/src/${FILENAME}" -o ${TMPDIR}
fi
cd ${TMPDIR}
tar xf ${FILENAME}
mkdir -p ${TMPDIR}/build && cd ${TMPDIR}/build

echo [+] Start building
cmake ${TMPDIR}/wireshark-${VER}
make -j$(nproc)
sudo make install
rm -rf ${TMPDIR}/build
rm -f ${TMPDIR}/$FILENAME*
echo [+] Done
cd ${INITIAL_PATH}

