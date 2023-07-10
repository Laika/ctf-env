#!/bin/bash -eu
GHIDRA_SOURCE_DIR=/opt
GHIDRA_VERSION=10.3.1
GHIDRA_SOURCE_URL="https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_${GHIDRA_VERSION}_build/ghidra_${GHIDRA_VERSION}_PUBLIC_20230614.zip"

CORES=$(cat /proc/cpuinfo | grep processor | wc -l)
MAKE="make -j${CORES}"

GHIDRA_ROOT="${GHIDRA_SOURCE_DIR}/ghidra"

trap 'echo Interrupted && rm -rf "${GHIDRA_ROOT}"' INT KILL QUIT TERM
sudo mkdir -p "${GHIDRA_ROOT}"
sudo chown -R ghidra:ghidra "${GHIDRA_SOURCE_DIR}"
TEMPFILE=$(mktemp -d)
wget --quiet -O "${TEMPFILE}/ghidra.zip" "${GHIDRA_SOURCE_URL}"
unzip -d "${GHIDRA_SOURCE_DIR}" "${TEMPFILE}/ghidra.zip" && mv ${GHIDRA_SOURCE_DIR}/ghidra_${GHIDRA_VERSION}_PUBLIC/* "${GHIDRA_ROOT}"

# Create symbolic links
sudo ln -sf "${GHIDRA_ROOT}/ghidraRun" /usr/bin/ghidra
