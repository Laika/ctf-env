#!/bin/bash -e

TMPDIR="${TMPDIR:-/tmp}"

_install(){
  wget "http://www.caesum.com/handbook/Stegsolve.jar" -O ${TMPDIR}/stegsolve.jar
  chmod +x ${TMPDIR}/stegsolve.jar
  sudo mv ${TMPDIR}/stegsolve.jar /usr/local/bin
}

if [ ! $(command -v stegsolve) ]; then
  _install
fi
