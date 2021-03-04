#!/bin/bash -e

_prerequisite() {
  sudo apt-get update 
  sudo apt-get install -y build-essential m4 gnulib libgmp-dev libmpfr-dev libmpc-dev
}

_install(){
  ${HOME}/.pyenv/shims/python -m pip install gmpy2
}

_prerequisite
_install
