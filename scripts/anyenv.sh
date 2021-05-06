#!/bin/bash

ANYENV_ROOT=${HOME}/.anyenv
PATH=${ANYENV_ROOT}/bin:${PATH}

_preprocess() {
  sudo apt-get update 
  sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

}
_anyenv(){
  git clone "https://github.com/anyenv/anyenv.git" ${ANYENV_ROOT}
  echo 'export PATH="${ANYENV_ROOT}/bin:${PATH}"' >> ${HOME}/.bashrc
  ${HOME}/.anyenv/bin/anyenv init
  . ${HOME}/.bashrc
  anyenv install nodenv
}
_postprocess(){
  anyenv global ${ANY_VERSION} 
  anyenv rehash
}


if [[ ! -e ${ANYENV_ROOT} ]]; then
  _preprocess
  _anyenv
else
  echo "[!] anyenv is already installed. Skipped."
fi

_postprocess

