#!/bin/bash -e

INIT_WORKDIR="$(pwd)"
TMPDIR="${TMPDIR:-/tmp}"

_prerequisite(){
  sudo apt-get update 
  sudo apt-get install -y axel cmake flex bison libgcrypt20-dev libssh-dev libpcap-dev libsystemd-dev qtbase5-dev qttools5-dev qtmultimedia5-dev libqt5svg5-dev
}

_cares(){
  local VERSION="1.17.1"
  local FILENAME="c-ares-${VERSION}"

  if [ ! -e ${TMPDIR}/${FILENAME} ]; then
    cd ${TMPDIR}
    axel -a -q "https://github.com/c-ares/c-ares/releases/download/cares-${VERSION//\./_}/${FILENAME}.tar.gz" -o ${FILENAME}.tar.gz
    tar xvf ${FILENAME}.tar.gz 
  fi
  cd ${TMPDIR}/${FILENAME}
  ./configure
  make -j$(nproc) && sudo make install && rm -rf ${TMPDIR}/${FILENAME}
}

_wireshark(){
  local VERSION="{{ wireshark.version }}"
  local FILENAME="wireshark-${VERSION}.tar.xz"
  if [ ! -e ${TMPDIR}/${FILENAME} ]; then
    axel -a -q "https://2.na.dl.wireshark.org/src/${FILENAME}" -o ${TMPDIR}
  fi
  cd ${TMPDIR}
  tar xf ${FILENAME}
  mkdir -p ${TMPDIR}/build && cd ${TMPDIR}/build

  cmake ${TMPDIR}/wireshark-${VERSION}
  make -j$(nproc)
  sudo make install
  rm -rf ${TMPDIR}/build
  rm -f ${TMPDIR}/${FILENAME}*
}

_postprocessing(){
  cd ${INIT_WORKDIR}
}

if [ ! $(command -v wireshark) ]; then
  _prerequisite
  _cares
  _wireshark
  _postprocessing
fi


