#!/bin/bash

INIT_WORKDIR="$(pwd)"
TMPDIR="${TMPDIR:-/tmp}"

OPTIONS=$(getopt -o u -- "$@")
eval set -- "${OPTIONS}"
while [ $# -gt 0 ]
do
  case $1 in
    -u) UPDATE="1";;
    --) shift; break;;
  esac
  shift
done

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
if [[ UPDATE == "1" || ! $(command -v burpsuite) ]]; then
  _prerequisite
  _burpsuite
  _postprocess
else
  echo "Burp Suite is already installed. Skipped."
fi

