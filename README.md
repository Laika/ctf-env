# ctf-env
  
A virtual environment for CTF with a suite of useful tools.

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
  
2. Start a virtual machine

```bash
git clone https://github.com/Laika/ctf-env && cd ctf-env/
make plugin-install
vagrant up
```

3. Go into the virtual machine

```bash
vagrant ssh
```

4. Run setup scripts

```bash
make ansible
cd ~/ansible && make install
```

## Available tools

- [pyenv](https://github.com/pyenv/pyenv)
  - Python 3.11.2 (by default)
  - Python 2.7.18 (by default)
- [rbenv](https://github.com/rbenv/rbenv)
  - Ruby 3.2.1 (by default)
- [radare2](https://github.com/radareorg/radare2)
  - [r2ghidra](https://github.com/radareorg/r2ghidra)
- [goenv](https://github.com/pyenv/pyenv)
  - Go 1.20.2 (by default)
- [SageMath 9.8](https://www.sagemath.org)
- [pwndbg](https://github.com/pwndbg/pwndbg)
- [Rust](https://www.rust-lang.org)
  - [ropr](https://github.com/Ben-Lichtman/ropr)
- [PatchELF](https://github.com/NixOS/patchelf)
