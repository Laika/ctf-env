#!/bin/bash

TMPDIR=${TMPDIR:-/tmp}
TOOL_DIR="${HOME}/CTF/Tools"
INIT_PATH="$(pwd)"

if [ ! -e ${TOOL_DIR}/radare2 ]; then
  sudo apt-get update -y
  sudo apt-get install -y ccache cmake bison flex
  git clone https://github.com/radareorg/radare2.git ${TOOL_DIR}/radare2 
fi

cd ${TOOL_DIR}/radare2
sudo sys/install.sh --install

if type "r2" > /dev/null 2>&1; then
  r2pm init
  r2pm -i r2ghidra-dec
else
  r2pm update
fi
