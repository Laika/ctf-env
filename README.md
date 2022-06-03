# ctf-env
  
A suite of installation shell scripts to create an environment for CTF.

## Prerequisites
- [Vagrant](https://www.vagrantup.com/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)


## Usage
1. Choose tools you need in `playbook.yaml`  

Example 1. Only SageMath
  ```yaml
  - hosts: ctf
    user: ctf
    roles:
     # - role: base
     # - role: pyenv
     # - role: goenv
     # - role: radare2
     # - role: gdb
      - role: sagemath
  ```
Example 2. Everything
  ```yaml
  - hosts: ctf
    user: ctf
    roles:
      - role: base
      - role: pyenv
      - role: goenv
      - role: radare2
      - role: gdb
      - role: sagemath
  ```
  
2. Run below commands
```
git clone https://github.com/Laika/ctf-env && cd ctf-env/
vagrant plugin install vagrant-disksize
vagrant up
```

3. Go into the virtual machine
```
vagrant ssh
```

## Available tools

- [pyenv](https://github.com/pyenv/pyenv)
  - Python 3.10.4 (by default)
  - Python 2.7.18 (by default)
- [goenv](https://github.com/pyenv/pyenv)
  - Go 1.18.2 (by default)
- [pwndbg](https://github.com/pwndbg/pwndbg)
- [patchelf](https://github.com/NixOS/patchelf)
- [SageMath 9.6](https://www.sagemath.org/)
## To be done
- [radare2](https://github.com/radareorg/radare2)
  - [r2ghidra](https://github.com/radareorg/r2ghidra)


