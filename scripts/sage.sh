#!/bin/bash

VERSION="9.3"
INIT_WORKDIR="$(pwd)"
TOOL_DIR="${TOOL_DIR:-${HOME}/ctf-tools}"
FILENAME="sage-${VERSION}-Ubuntu_20.04-x86_64"

FORCE_INSTALL="${FORCE_INSTALL:-0}"

_preprocess(){
  if [ ! -e ${TOOL_DIR} ]; then
    mkdir -p ${TOOL_DIR}
  fi
}

_install(){
    if [ ! -e ${TOOL_DIR}/${FILENAME}.tar.bz2 ];then
        wget "http://ftp.yz.yamagata-u.ac.jp/pub/math/sage/linux/64bit/${FILENAME}.tar.bz2" -O "${TOOL_DIR}/${FILENAME}.tar.bz2"
    fi
    cd ${TOOL_DIR}
    tar xvf ${FILENAME}.tar.bz2
    sudo ln -sf ${TOOL_DIR}/SageMath/sage /usr/bin/sage
}

_postprocess(){
    rm ${TOOL_DIR}/${FILENAME}.tar.bz2
    cd ${INIT_WORKDIR}
}
if [ "${FORCE_INSTALL}" == "1" ] || [ ! $(command -v sage) ]; then
    _preprocess
    _install
    _postprocess
else
    echo "SageMath is already installed. Skipped."
fi
