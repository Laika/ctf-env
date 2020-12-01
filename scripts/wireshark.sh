#!/bin/bash -e

VERSION=3.4.0
FILENAME=wireshark-${VERSION}.tar.xz
INITIAL_PATH=$(pwd)
TMPDIR=${TMPDIR:-/tmp}

sudo apt-get update -y
sudo apt-get install -y axel cmake flex bison libgcrypt20-dev libssh-dev libpcap-dev libsystemd-dev qtbase5-dev qttools5-dev qtmultimedia5-dev libqt5svg5-dev


echo [+] Install c-ares
CARES_VERSION=1.17.1
CARES="c-ares-${VER}"

if [ ! -e ${TMPDIR}/${CARES} ]; then
    axel -a "https://github.com/c-ares/c-ares/releases/download/cares-${CARES_VERSION//\./_}/${CARES}.tar.gz"
    tar xvf ${CARES}.tar.gz 

cd ${TMPDIR}/${CARES}
./configure
make -j$(nproc) && sudo make install && rm -rf ${TMPDIR}/${CARES}



echo [+] Download ${FILENAME}
if [ ! -e ${TMPDIR}/${FILENAME} ]; then
    axel -a "https://1.eu.dl.wireshark.org/src/${FILENAME}" -o ${TMPDIR}
fi
cd ${TMPDIR}
tar xf ${FILENAME}
mkdir -p ${TMPDIR}/build && cd ${TMPDIR}/build

echo [+] Start building
cmake ${TMPDIR}/wireshark-${VERSION}
make -j$(nproc)
sudo make install
rm -rf ${TMPDIR}/build
rm -f ${TMPDIR}/${FILENAME}*
echo [+] Done
cd ${INITIAL_PATH}

