#!/bin/bash -e

TMPDIR="${TMPDIR:-/tmp}"

_install(){
  wget "http://www.caesum.com/handbook/Stegsolve.jar" -O ${TMPDIR}/stegsolve
  chmod +x ${TMPDIR}/stegsolve
  sudo mv ${TMPDIR}/stegsolve /usr/local/bin
}

if [ ! $(command -v stegsolve) ]; then
  _install
fi
