#!/bin/bash -eu
SAGE_SOURCE_DIR=/opt
SAGE_VERSION=10.0
SAGE_SOURCE_URL="https://ftp.yz.yamagata-u.ac.jp/pub/math/sage/src/sage-${SAGE_VERSION}.tar.gz"

CORES=$(cat /proc/cpuinfo | grep processor | wc -l)
MAKE="make -j${CORES}"

SAGE_ROOT="${SAGE_SOURCE_DIR}/sage"

trap 'echo Interrupted && rm -rf "${SAGE_ROOT}"' INT KILL QUIT TERM
sudo mkdir -p "${SAGE_ROOT}"
sudo chown -R sage:sage "${SAGE_ROOT}"
wget --quiet -O- "${SAGE_SOURCE_URL}" | tar zxvf - --strip-components 1 -C "${SAGE_ROOT}"

# Make SageMath
cd "${SAGE_ROOT}"
./configure
${MAKE}
trap HUP INT QUIT TERM

# Create symbolic links
sudo ln -sf "${SAGE_ROOT}/sage" /usr/bin/sage
sudo ln -sf "${SAGE_ROOT}/sage" /usr/bin/sagemath
