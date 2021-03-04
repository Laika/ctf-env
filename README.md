# ctf-env

![burpsuite](https://img.shields.io/badge/Burp%20Suite-{{ burpsuite.version }}-52307c.svg)
![gdb](https://img.shields.io/badge/GDB-latest-52307c.svg)
![ghidra](https://img.shields.io/badge/Ghidra-{{ ghidra.version }}-52307c.svg)
![gmpy2](https://img.shields.io/badge/gmpy2-2020.11.3-52307c.svg)
![hashpump](https://img.shields.io/badge/HashPump-latest-52307c.svg)
![john-the-ripper](https://img.shields.io/badge/John%20the%20Ripper-latest-52307c.svg)
![pyenv](https://img.shields.io/badge/pyenv-latest-52307c.svg)
![python3](https://img.shields.io/badge/Python3-{{ python3.version }}-52307c.svg)
![python2](https://img.shields.io/badge/Python2-{{ python2.version }}-52307c.svg)
![radare2](https://img.shields.io/badge/Radare2-latest-52307c.svg)
![sage](https://img.shields.io/badge/SageMath-{{ sagemath.version }}-52307c.svg)
![volatility](https://img.shields.io/badge/Volatility-2.6-52307c.svg)
![wireshark](https://img.shields.io/badge/Wireshark-{{ wireshark.version }}-52307c.svg)


  
A suite of installation shell scripts to create an environment for CTF.


**⚠️ These scripts may ruin your existing environment ⚠️**  
We **strongly** recommend create new environment and run these scripts on it.  
Please use `Vagrantfile`.

## Scripts
- burpsuite.sh 🛠️  
    Run: `burpsuite`  
- gdb.sh 🛠️   
  - [longld/peda](https://github.com/longld/peda)  
    Run: `peda`  
  - [hugsy/gef](https://github.com/hugsy/gef)  
    Run: `peda`  
  - [pwndbg/pwndbg](https://github.com/pwndbg/pwndbg)  
    Run: `dbg`  
  - [scwuaptx/Pwngdb](https://github.com/scwuaptx/Pwngdb)  
    Integrated into pwndbg  
  
- ghidra.sh 🛠️  
    Run: `ghidra`  
- gmpy2.sh 🐍  
    `import gmpy2`  
- hashpump.sh 🛠️   
    Run: `hashpump`  
- john-the-ripper.sh 🛠️  
- pyenv.sh 🐍  
    Python 3: `python` or `python3`  
    Python 2: `python2`  
- radare2.sh 🛠️  
    Run: `r2`  
- sage.sh 🛠️  
    Run: `sage`  
- volatility.sh 🛠️  
    Run: `volatility`  
- wireshark.sh 🛠️  
    Run: `wireshark`  
