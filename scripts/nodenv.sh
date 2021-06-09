#!/bin/bash

NODE_STABLE_VERSION="14.17.0"
NODE_LATEST_VERSION="16.3.0"
NODENV_ROOT=${HOME}/.nodenv
PATH=${NODENV_ROOT}/bin:${PATH}

_preprocess() {
  sudo apt-get update
  sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

  git clone "https://github.com/nodenv/nodenv.git" ${NODENV_ROOT}
  echo 'export NODENV_ROOT="${HOME}/.nodenv"' >> ${HOME}/.bashrc
  echo 'export PATH="${NODENV_ROOT}/bin:${PATH}"' >> ${HOME}/.bashrc
  echo 'eval "$(nodenv init -)"' >> ${HOME}/.bashrc
  . ${HOME}/.bashrc
  mkdir -p "$(nodenv root)/plugins"
  git clone https://github.com/nodenv/node-build.git "$(nodenv root)/plugins/node-build"
}
_node_stable(){
  nodenv install ${NODE_STABLE_VERSION}
}
_node_latest(){
  nodenv install ${NODE_LATEST_VERSION}
}
_postprocess(){
  nodenv global ${NODE_STABLE_VERSION} ${NODE_LATEST_VERSION}
  nodenv rehash
}


# nodenv
if [ ! -e ${NODENV_ROOT} ]; then
  _preprocess
else
  echo "[!] nodenv is already installed. Skipped."
fi

# Node.js Stable
if [ ! -e ${NODENV_ROOT}/shims/node${NODE_STABLE_VERSION%.*} ]; then
  _node_stable
else
  echo "[!] Node ${NODE_STABLE_VERSION} is already installed. Skipped."
fi

# Node.js Latest
if [ ! -e ${NODENV_ROOT}/shims/node${NODE_LATEST_VERSION%.*} ]; then
  _node_latest
else
  echo "[!] Node ${NODE_LATEST_VERSION} is already installed. Skipped."
fi

_postprocess
