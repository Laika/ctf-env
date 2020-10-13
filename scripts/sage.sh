#!/bin/bash -ex

VER=9.1
FILENAME=sage-$VER-Ubuntu_18.04-x86_64
INSTALL_PATH=$HOME/Tools

echo [+] Installing dependencies
sudo apt install -y axel binutils pixz gcc g++ gfortran make m4 perl tar \
  git patch openssl libssl-dev libz-dev bc libbz2-dev liblzma-dev libgmp-dev \
  libffi-dev libgf2x-dev libcurl4-openssl-dev libzmq3-dev curl yasm \
  pkg-config libntl-dev libmpfr-dev libmpc-dev libflint-dev \
  libpcre3-dev libgd-dev libflint-dev libflint-arb-dev \
  libsymmetrica2-dev gmp-ecm libecm-dev libisl-dev libgivaro-dev \
  libpari-dev pari-gp2c libec-dev liblrcalc-dev \
  libm4ri-dev libm4rie-dev liblfunction-dev lcalc


pushd /tmp

echo [+] Downloading sage via torrent
if [ ! -e $INSTALL_PATH/$FILENAME.tar.bz2 ];then
    axel -a http://ftp.yz.yamagata-u.ac.jp/pub/math/sage/linux/64bit/$FILENAME.tar.bz2 -o $INSTALL_PATH
fi

cd $INSTALL_PATH
tar xvf $FILENAME.tar.bz2
sudo ln -sf $INSTALL_PATH/SageMath/sage /usr/local/bin/sage
echo [+] Done
