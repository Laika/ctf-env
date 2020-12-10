#!/bin/bash -ex

INITDIR=$(pwd)
TMPDIR=${TMPDIR:-${HOME}/tmp}
mkdir -p ${TMPDIR}

prerequisite() {
  sudo apt update 
  sudo apt install -y build-essential m4 gnulib libgmp-dev libmpfr-dev libmpc-dev
}

prerequisite
python -m pip install gmpy2
