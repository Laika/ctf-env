#!/bin/bash -e

INIT_WORKDIR="$(pwd)"
TMPDIR="${TMPDIR:-/tmp}"
VERSION="3.01"
TOOL_DIR="${HOME}/ctf-tools"

_install(){
  if [ ! -e "${TMPDIR}/die_lin64_portable_${VERSION}.tar.gz" ]; then
    wget -q \
      "https://github.com/horsicq/DIE-engine/releases/download/${VERSION}/die_lin64_portable_${VERSION}.tar.gz" \
      -O "${TMPDIR}/die_lin64_portable_${VERSION}.tar.gz"
  fi

  tar xf "${TMPDIR}/die_lin64_portable_${VERSION}.tar.gz" \
    -C ${TOOL_DIR}
  sudo cat << 'EOF' | sudo tee /usr/local/bin/die
#!/bin/bash
DIE_DIR="${TOOL_DIR}/die_lin64_portable"
export LD_LIBRARY_PATH="${DIE_DIR}/base:${LD_LIBRARY_PATH}"
${DIR_DIR}/base/die $*
EOF

}
_postprocess(){
  rm -f "${TMPDIR}/die_lin64_portable_${VERSION}.tar.gz"
}

_install
_postprocess