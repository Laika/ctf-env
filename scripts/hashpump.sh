#!/bin/bash -e

INIT_WORKDIR=$(pwd)
TMPDIR=${TMPDIR:-/tmp}


_prerequisite(){
  sudo apt-get update 
  sudo apt-get install -y libssl-dev build-essential git
}

_hashpump(){
  git clone "https://github.com/bwall/HashPump.git" "${TMPDIR}/HashPump"
  cd ${TMPDIR}/HashPump
  make -j$(nproc) && sudo make install
}

_postprocess(){
  rm -rf ${TMPDIR}/HashPump
  cd ${INITDIR}
}


if [ ! $(command -v hashpump) ]; then
  _prerequisite
  _hashpump
  _postprocess
else
  echo "Hashpump is already installed. Skipped."
fi

