#!/bin/bash

INIT_PATH=$(pwd)
TMPDIR=${TMPDIR:-/tmp}
VERSION=2020.12.1
FILENAME=burpsuite_community_linux_v${VERSION//\./\_}

sudo apt update -y
sudo apt install -y axel

if [ ! -e ${TMPDIR}/${FILENAME}.sh ]; then
  axel -n 8 -v \
    -a "https://portswigger.net/burp/releases/download?product=community&version=${VERSION}&type=Linux" \
    -o ${TMPDIR}
fi

cd ${TMPDIR}
bash ${FILENAME}.sh
rm ${FILENAME}.sh

cd ${INIT_PATH}
