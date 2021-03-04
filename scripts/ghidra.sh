#!/bin/bash -e


INIT_WORKDIR="$(pwd)"
TMPDIR=${TMPDIR:-/tmp}
TOOLDIR=${TOOLDIR:-${HOME}/ctf-tools}

FILENAME="ghidra_9.2.2_PUBLIC_20201229.zip"

_prerequisite(){
  sudo apt update && sudo apt install -y openjdk-14-jdk
}

_install(){
  if [ ! -e ${TOOLDIR}/${FILENAME} ]; then
    wget "https://ghidra-sre.org/${FILENAME}" -P ${TOOLDIR}
  fi
  cd ${TOOLDIR} && unzip ${FILENAME}
  sudo ln -sf ${TOOLDIR}/${FILENAME%_[0-9]*.zip}/ghidraRun /usr/local/bin/ghidra
}

_postprocess(){
  cd ${INIT_WORKDIR}
  rm ${TOOLDIR}/${FILENAME}
}

if [ ! $(command -v ghidra) ]; then 
  _prerequisite
  _install
  _postprocess
fi
