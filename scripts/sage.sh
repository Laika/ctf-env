#!/bin/bash 

VER=9.2
INSTALL_DIR=${HOME}/CTF
INSTALL_PATH=${INSTALL_DIR:?'${INSTALL_DIR} is not defined'}/Tools
FILENAME=sage-${VER}-Ubuntu_20.04-x86_64


if [ ! -e ${INSTALL_PATH}/${FILENAME}.tar.bz2 ];then
    axel -a "http://ftp.yz.yamagata-u.ac.jp/pub/math/sage/linux/64bit/${FILENAME}.tar.bz2" -o ${INSTALL_PATH}
fi

cd ${INSTALL_PATH}
tar xvf ${FILENAME}.tar.bz2
sudo ln -sf ${INSTALL_PATH}/SageMath/sage /usr/local/bin/sage
rm ${INSTALL_PATH}/${FILENAME}.tar.bz2
