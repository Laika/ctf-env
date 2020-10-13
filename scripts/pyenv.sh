#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

# pyenv
PYENV_ROOT=${HOME}/.pyenv
PATH=${PYENV_ROOT}/bin:${PATH}

git clone https://github.com/pyenv/pyenv.git ${PYENV_ROOT}
eval "$(pyenv init -)"
echo 'export PYENV_ROOT="${HOME}/.pyenv"' >> ${HOME}/.bashrc
echo 'export PATH="${PYENV_ROOT}/bin:${PATH}"' >> ${HOME}/.bashrc
echo 'eval "$(pyenv init -)"' >> ${HOME}/.bashrc
env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.8.5
env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 2.7.18
pyenv global 3.8.5 2.7.18
pyenv rehash



