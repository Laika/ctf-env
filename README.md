# ctf-env

```
   ██████  ██████████ ████████                                
  ██░░░░██░░░░░██░░░ ░██░░░░░                                 
 ██    ░░     ░██    ░██              █████  ███████  ██    ██
░██           ░██    ░███████  █████ ██░░░██░░██░░░██░██   ░██
░██           ░██    ░██░░░░  ░░░░░ ░███████ ░██  ░██░░██ ░██ 
░░██    ██    ░██    ░██            ░██░░░░  ░██  ░██ ░░████  
 ░░██████     ░██    ░██            ░░██████ ███  ░██  ░░██   
  ░░░░░░      ░░     ░░              ░░░░░░ ░░░   ░░    ░░    
```

[![burpsuite](https://img.shields.io/badge/Burp%20Suite-2021.6.2-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/burpsuite.sh)
[![die](https://img.shields.io/badge/Detect%20It%20Easy-3.02-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/die.sh)
[![gdb](https://img.shields.io/badge/gdb%20suite-latest-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/gdb.sh)
[![ghidra](https://img.shields.io/badge/Ghidra-10.0-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/ghidra.sh)
[![gmpy2](https://img.shields.io/badge/gmpy2-latest-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/gmpy2.sh)
[![goenv](https://img.shields.io/badge/goenv-1.16.5-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/goenv.sh)
[![hashpump](https://img.shields.io/badge/HashPump-latest-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/hashpump.sh)
[![john](https://img.shields.io/badge/John%20the%20Ripper-latest-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/john-the-ripper.sh)
[![msieve](https://img.shields.io/badge/Msieve-1.53-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/msieve.sh)
[![nodenv](https://img.shields.io/badge/nodenv-latest-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/nodenv.sh)
[![node-latest](https://img.shields.io/badge/Node.js%20latest-16.4.2-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/nodenv.sh)
[![node-stable](https://img.shields.io/badge/Node.js%20stable-14.17.3-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/nodenv.sh)
[![pwntools](https://img.shields.io/badge/Pwntools-latest-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/pwntools.sh)
[![pyenv](https://img.shields.io/badge/pyenv-latest-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/pyenv.sh)
[![python3](https://img.shields.io/badge/Python3-3.9.5-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/pyenv.sh)
[![python2](https://img.shields.io/badge/Python2-2.7.18-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/pyenv.sh)
[![radare2](https://img.shields.io/badge/radare2-latest-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/radare2.sh)
[![sage](https://img.shields.io/badge/SageMath-9.3-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/sage.sh)
[![stegsolve](https://img.shields.io/badge/Stegsolve-latest-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/stegsolve.sh)
[![volatility](https://img.shields.io/badge/Volatility-2.6-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/volatility.sh)
[![wireshark](https://img.shields.io/badge/Wireshark-3.4.6-52307c.svg)](https://github.com/Laik4/ctf-env/blob/main/scripts/wireshark.sh)

[![template-rendering](https://github.com/Laik4/ctf-env/actions/workflows/template-rendering.yml/badge.svg)](https://github.com/Laik4/ctf-env/actions/workflows/template-rendering.yml)
[![CodeFactor](https://www.codefactor.io/repository/github/laika/ctf-env/badge)](https://www.codefactor.io/repository/github/laika/ctf-env)
  
A suite of installation shell scripts to create an environment for CTF.


**⚠️ These scripts may ruin your existing environment ⚠️**  
It is **strongly** recommended creating new environment and run these scripts on it.  
Please use `vagrant up && vagrant ssh`.

## Setup
```
git clone https://github.com/Laika/ctf-env && cd ctf-env
vagrant up
```

## Use `ctf-env`
```
vagrant ssh
```


## Variables

| Name | Description | Default |
| ---- | ----------- | ------- |
| TOOL_DIR | A tool directory |${HOME}/ctf-tools |
| FORCE_INSTALL | If 1 is set, the software will be installed no matter if it's already done. | 0 |

### Example 1. Installing SageMath by force
`env FORCE_INSTALL=1 ./sage.sh`
