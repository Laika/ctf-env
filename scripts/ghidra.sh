#!/bin/bash


TMPDIR=${TMPDIR:-/tmp}
TOOLDIR=${TOOLDIR:-${HOME}/CTF/Tools}


wget "https://ghidra-sre.org/ghidra_9.2_PUBLIC_20201113.zip" -P ${TOOLDIR}
cd ${TOOLDIR}
unzip ghidra_9.2_PUBLIC_20201113.zip

sudo ln -sf ${TOOLDIR}/ghidra_*/ghidraRun /usr/bin/ghidra
