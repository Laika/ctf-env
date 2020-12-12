#!/bin/bash

TMPDIR=${TMPDIR:-/tmp}
TOOL_DIR="${HOME}/CTF/Tools"
INIT_PATH="$(pwd)"

if [ ! $(command -v r2) ]; then
  if [ ! -e ${TOOL_DIR}/radare2 ]; then
    sudo apt-get update -y
    sudo apt-get install -y ccache cmake bison flex
    git clone https://github.com/radareorg/radare2.git ${TOOL_DIR}/radare2 
  fi
fi

cd ${TOOL_DIR}/radare2
sudo sys/install.sh --install

if [ ! $(command -v r2) ]; then
  r2pm init
  r2pm -i r2ghidra
else
  r2pm update
fi
