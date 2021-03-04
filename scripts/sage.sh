#!/bin/bash 

VERSION="9.2"
INIT_WORKDIR="$(pwd)"
TOOL_DIR="${HOME}/ctf-tools"
TOOL_DIR="${INSTALL_DIR:?'${INSTALL_DIR} is not defined'}/Tools"
FILENAME="sage-${VER}-Ubuntu_20.04-x86_64"


_install(){
  if [ ! -e ${TOOL_DIR}/${FILENAME}.tar.bz2 ];then
      wget "http://ftp.yz.yamagata-u.ac.jp/pub/math/sage/linux/64bit/${FILENAME}.tar.bz2" -O ${TOOL_DIR}
  fi
  cd ${TOOL_DIR}
  tar xvf ${FILENAME}.tar.bz2
  sudo ln -sf ${TOOL_DIR}/SageMath/sage /usr/local/bin/sage
}

_postprocess(){
  rm ${TOOL_DIR}/${FILENAME}.tar.bz2
  cd ${INIT_WORKDIR}
}
if [ ! $(command -v sage) ]; then
  _install
  _postprocess
else
  echo "SageMath is already installed. Skipped."
fi
