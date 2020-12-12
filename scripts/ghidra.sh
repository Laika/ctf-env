#!/bin/bash -x


TMPDIR=${TMPDIR:-/tmp}
TOOLDIR=${TOOLDIR:-${HOME}/CTF/Tools}

FILENAME="ghidra_9.2_PUBLIC_20201113.zip"


if [ ! $(command -v ghidra) ]; then 
  sudo apt update -y && sudo apt install -y openjdk-14-jdk

  if [ ! -e ${TOOLDIR}/${FILENAME} ]; then
    wget "https://ghidra-sre.org/${FILENAME}" -P ${TOOLDIR}
  fi
  cd ${TOOLDIR} && unzip ${FILENAME}
  sudo ln -sf ${TOOLDIR}/${FILENAME%_[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9].zip}/ghidraRun /usr/local/bin/ghidra
fi

