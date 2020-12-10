#!/bin/bash


TMPDIR=${TMPDIR:-/tmp}
TOOLDIR=${TOOLDIR:-${HOME}/CTF/Tools}

FILENAME="ghidra_9.2_PUBLIC_20201113.zip"


sudo apt update -y && apt install -y openjdk-14-jdk openjdk-14-jre

wget "https://ghidra-sre.org/${FILENAME}" -P ${TOOLDIR}
cd ${TOOLDIR} && unzip ${FILENAME}

sudo ln -sf ${TOOLDIR}/${FILENAME%_[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9].zip}/ghidraRun /usr/local/bin/ghidra


