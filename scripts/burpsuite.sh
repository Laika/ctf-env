#!/bin/bash

INIT_WORKDIR="$(pwd)"
TMPDIR="${TMPDIR:-/tmp}"
FORCE_UPDATE="${FORCE_UPDATE:-0}"

_prerequisite(){
  sudo apt update 
  sudo apt install -y axel
}

_burpsuite(){
  local VERSION="2021.4.3"
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
if [ ${FORCE_UPDATE} == "1" ] | [ ! $(command -v burpsuite) ]; then
  _prerequisite
  _burpsuite
  _postprocess
else
  echo "Burp Suite is already installed. Skipped."
fi

