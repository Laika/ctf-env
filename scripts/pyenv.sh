#!/bin/bash

PYTHON2_VERSION=2.7.18
PYTHON3_VERSION=3.9.0

sudo apt-get update -y
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
	libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
	xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

PYENV_ROOT=${HOME}/.pyenv
PATH=${PYENV_ROOT}/bin:${PATH}

git clone "https://github.com/pyenv/pyenv.git" ${PYENV_ROOT}
echo 'export PYENV_ROOT="${HOME}/.pyenv"' >> ${HOME}/.bashrc
echo 'export PATH="${PYENV_ROOT}/bin:${PATH}"' >> ${HOME}/.bashrc
echo 'eval "$(pyenv init -)"' >> ${HOME}/.bashrc
source ${HOME}/.bashrc
env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install ${PYTHON3_VERSION} 
env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install ${PYTHON2_VERSION}
pyenv global ${PYTHON3_VERSION} ${PYTHON2_VERSION} 
pyenv rehash



