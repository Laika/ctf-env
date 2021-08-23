#!/bin/bash

INIT_WORKDIR="$(pwd)"
TMPDIR="${TMPDIR:-/tmp}"
FORCE_INSTALL="${FORCE_INSTALL:-0}"

_prerequisite(){
  if [ ! -e ${TOOL_DIR} ]; then
    mkdir -p ${TOOL_DIR}
  fi
  sudo apt update 
  sudo apt install -y axel
}

_burpsuite(){
  local VERSION="2021.6.2"
  FILENAME="burpsuite_community_linux_v${VERSION//\./\_}"
  if [ ! -e ${TMPDIR}/${FILENAME}.sh ]; then
    axel -n 8 -v \
      -a "https://portswigger.net/burp/releases/download?product=community&version=${VERSION}&type=Linux" \
      -o ${TMPDIR}
  fi

  cd ${TMPDIR}
  bash ${FILENAME}.sh
}
_postprocess(){
  rm ${FILENAME}.sh
  cd ${INIT_PATH}
}
if [ "${FORCE_INSTALL}" == "1" ] || [ ! $(command -v burpsuite) ]; then
  _prerequisite
  _burpsuite
  _postprocess
else
  echo "Burp Suite is already installed. Skipped."
fi

