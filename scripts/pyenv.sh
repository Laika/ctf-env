#!/bin/bash

PYTHON2_VERSION="2.7.18"
PYTHON3_VERSION="3.9.2"
PYENV_ROOT=${HOME}/.pyenv
PATH=${PYENV_ROOT}/bin:${PATH}

_preprocess() {
  sudo apt-get update 
  sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

  git clone "https://github.com/pyenv/pyenv.git" ${PYENV_ROOT}
  echo 'export PYENV_ROOT="${HOME}/.pyenv"' >> ${HOME}/.bashrc
  echo 'export PATH="${PYENV_ROOT}/bin:${PATH}"' >> ${HOME}/.bashrc
  echo 'eval "$(pyenv init -)"' >> ${HOME}/.bashrc
  . ${HOME}/.bashrc
}
_python3(){
  env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install ${PYTHON3_VERSION} 
}
_python2(){
  env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install ${PYTHON2_VERSION}
}
_postprocess(){
  pyenv global ${PYTHON3_VERSION} ${PYTHON2_VERSION} 
  pyenv rehash
}


if [[ ! -e ${PYENV_ROOT} ]]; then
  _preprocess
else
  echo "[!] pyenv is already installed. Skipped."
fi
if [ ! -e ${PYENV_ROOT}/shims/python${PYTHON3_VERSION%.*} ]; then
  _python3
else
  echo "[!] Python ${PYTHON3_VERSION} is already installed. Skipped."
fi
if [ ! -e ${PYENV_ROOT}/shims/python${PYTHON2_VERSION%.*} ]; then
  _python2
else
  echo "[!] Python ${PYTHON2_VERSION} is already installed. Skipped."
fi

_postprocess

