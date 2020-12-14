#!/bin/bash -ex

INITDIR=$(pwd)
TMPDIR=${TMPDIR:-${HOME}/tmp}
mkdir -p ${TMPDIR}

prerequisite() {
  sudo apt-get update 
  sudo apt-get install -y build-essential m4 gnulib libgmp-dev libmpfr-dev libmpc-dev
}

prerequisite
${HOME}/.pyenv/shims/python -m pip install gmpy2
