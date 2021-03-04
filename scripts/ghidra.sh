#!/bin/bash -e


INIT_WORKDIR="$(pwd)"
TMPDIR=${TMPDIR:-/tmp}
TOOL_DIR=${TOOL_DIR:-${HOME}/ctf-tools}

FILENAME="ghidra_9.2.2_PUBLIC_20201229.zip"

_prerequisite(){
  sudo apt update
  sudo apt install -y openjdk-14-jdk unzip
}

_install(){
  if [ ! -e ${TOOL_DIR}/${FILENAME} ]; then
    wget "https://ghidra-sre.org/${FILENAME}" -P ${TOOL_DIR}
  fi
  cd ${TOOL_DIR} && unzip ${FILENAME}
  sudo ln -sf ${TOOL_DIR}/${FILENAME%_[0-9]*.zip}/ghidraRun /usr/local/bin/ghidra
}

_postprocess(){
  cd ${INIT_WORKDIR}
  rm ${TOOL_DIR}/${FILENAME}
}

if [ ! $(command -v ghidra) ]; then 
  _prerequisite
  _install
  _postprocess
else
  echo "Burp Suite is already installed. Skipped."
fi
