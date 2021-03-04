#!/bin/bash -e 

TMPDIR="${TMPDIR:-/tmp}"
INIT_WORKDIR="$(pwd)"
TOOL_DIR="${HOME}/ctf-tools"

_prerequisite(){
  sudo apt-get update 
  sudo apt-get install -y git build-essential libssl-dev zlib1g-dev yasm pkg-config libgmp-dev libpcap-dev libbz2-dev
}


_install(){
  if [ ! -e ${TOOL_DIR}/john ]; then
      git clone https://github.com/magnumripper/JohnTheRipper -b bleeding-jumbo ${TOOL_DIR}/john
  fi

  cd ${TOOL_DIR}/john/src

  ./configure && make -s clean 
  make -j$(nproc)

  sudo ln -sf ${TOOL_DIR}/john/run/john /usr/bin/john
  sudo ln -sf ${TOOL_DIR}/john/run/zip2john /usr/bin/zip2john
}

_postprocess(){
  cd ${INIT_WORKDIR}
}
