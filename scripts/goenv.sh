#!/bin/bash

GO_VERSION="1.16.4"
GOENV_ROOT=${HOME}/.goenv
PATH=${GOENV_ROOT}/bin:${PATH}

_preprocess() {
  sudo apt-get update 
  sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

  git clone "https://github.com/syndbg/goenv.git" ${GOENV_ROOT}
  echo 'export GOENV_ROOT="${HOME}/.goenv"' >> ${HOME}/.bashrc
  echo 'export PATH="${GOENV_ROOT}/bin:${PATH}"' >> ${HOME}/.bashrc
  echo 'eval "$(goenv init -)"' >> ${HOME}/.bashrc
  . ${HOME}/.bashrc
}
_go(){
  goenv install ${GO_VERSION}
}
_postprocess(){
  goenv global ${GO_VERSION} 
  goenv rehash
}


if [[ ! -e ${GOENV_ROOT} ]]; then
  _preprocess
else
  echo "[!] goenv is already installed. Skipped."
fi
if [ ! -e ${GOENV_ROOT}/shims/go${GO_VERSION%.*} ]; then
  _go
else
  echo "[!] Python ${GO_VERSION} is already installed. Skipped."
fi

_postprocess

