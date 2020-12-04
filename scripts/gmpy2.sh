#!/bin/bash -ex

INITDIR=$(pwd)
TMPDIR=${TMPDIR:-${HOME}/tmp}
mkdir -p ${TMPDIR}

prerequisite() {
  sudo apt update
  sudo apt install -y build-essential m4 gnulib
}

install_m4 () {
  FILENAME=m4-1.4.18
  wget "https://ftp.gnu.org/gnu/m4/${FILENAME}.tar.gz" -P ${TMPDIR}
  tar xf ${TMPDIR}/${FILENAME}.tar.gz -C ${TMPDIR}
  cd ${TMPDIR}/${FILENAME}
  ./configure --prefix=/usr
  make -j$(nproc)
  make check
  sudo make install
}

install_gmp () {
  FILENAME=gmp-6.0.0a
  wget "https://gmplib.org/download/gmp/${FILENAME}.tar.bz2" -P ${TMPDIR}
  tar xf  ${TMPDIR}/${FILENAME}.tar.bz2 -C ${TMPDIR}
  cd ${TMPDIR}/${FILENAME}
  ./configure --prefix=${TMPDIR} --enable-static --disable-shared --with-pic
  make -j$(nproc)
  make check
  sudo make install
}
install_mpfr () {
  FILENAME=mpfr-3.1.2
  wget "http://www.mpfr.org/mpfr-3.1.2/${FILENAME}.tar.bz2" -P ${TMPDIR}
  tar xf  ${TMPDIR}/${FILENAME}.tar.bz2 -C ${TMPDIR}
  cd ${TMPDIR}/${FILENAME}
  ./configure --prefix=${TMPDIR} --enable-static --disable-shared --with-gmp=${TMPDIR}
  make -j$(nproc)
  make check
  sudo make install
}

install_mpc () {
  wget "https://ftp.gnu.org/gnu/mpc/mpc-1.0.3.tar.gz" -P ${TMPDIR}
  tar xf  ${TMPDIR}/${FILENAME}.tar.gz -C ${TMPDIR}
  cd ${TMPDIR}/${FILENAME}
  ./configure --prefix=${TMPDIR} --enable-static --disable-shared --with-pic --with-gmp=${TMPDIR}
  make -j$(nproc)
  make check
  sudo make install
}


prerequisite
install_m4
