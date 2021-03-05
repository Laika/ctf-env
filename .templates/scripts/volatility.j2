#!/bin/bash

TMPDIR=${TMPDIR:-/tmp}
INIT_WORKDIR=$(pwd)


_prerequisite(){
  sudo apt-get update 
  sudo apt-get install -y unzip
}
# volatility
_install(){
  if [ ! -e "${TMPDIR}/volatility_2.6_lin64_standalone.zip" ]; then
    wget -q -O "${TMPDIR}/volatility_2.6_lin64_standalone.zip" "http://downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_lin64_standalone.zip"
  fi

  cd ${TMPDIR}
  unzip -q -o volatility_2.6_lin64_standalone.zip
  sudo mv -f volatility_2.6_lin64_standalone/volatility_2.6_lin64_standalone /usr/local/bin/volatility
}

_postprocess(){
  cd ${INIT_WORKDIR}
}

if [ ! $(command -v volatility) ]; then
  _prerequisite
  _install
  _postprocess
fi
