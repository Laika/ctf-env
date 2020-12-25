#!/bin/bash

TOOL_DIR="${HOME}/CTF/Tools"
INIT_DIR=$(pwd)
PREFIX="/usr/local/bin"


# peda
git clone https://github.com/longld/peda.git ${TOOL_DIR}/peda

# gef
wget -q -O ${TOOL_DIR}/.gdbinit-gef.py https://github.com/hugsy/gef/raw/master/gef.py
python2 -m pip install -U pip keystone-engine ropper 

# pwndbg
git clone https://github.com/pwndbg/pwndbg ${TOOL_DIR}/pwndbg
cd ${TOOL_DIR}/pwndbg
./setup.sh

# pwngdb
git clone https://github.com/scwuaptx/Pwngdb.git ${TOOL_DIR}/pwngdb

cat << EOF | tee ${HOME}/.gdbinit
set follow-fork-mode parent

define init-peda
source ${TOOL_DIR}/peda/peda.py
end
document init-peda
Initializes the PEDA (Python Exploit Development Assistant for GDB) framework
end

define init-pwndbg
source ${TOOL_DIR}/pwndbg/gdbinit.py
source ${TOOL_DIR}/peda/peda.py
source ${TOOL_DIR}/pwngdb/pwngdb.py
source ${TOOL_DIR}/pwngdb/angelheap/gdbinit.py
python
import angelheap
angelheap.init_angelheap()
end
end
document init-pwndbg
Initializes PwnDBG
end

define init-gef
source ~/.gdbinit-gef.py
end
document init-gef
Initializes GEF (GDB Enhanced Features)
end
EOF


sudo cat << 'EOF' | sudo tee ${PREFIX}/peda
#!/bin/bash
exec gdb -q -ex init-peda "$@" 
EOF

sudo cat << 'EOF' | sudo tee ${PREFIX}/dbg
#!/bin/bash
exec gdb -q -ex init-pwndbg "$@" 
EOF

sudo cat << 'EOF' | sudo tee ${PREFIX}/gef
#!/bin/bash
exec gdb -q -ex init-gef "$@" 
EOF

sudo chmod +x ${PREFIX}/{peda,dbg,gef}

cd ${INIT_DIR}
