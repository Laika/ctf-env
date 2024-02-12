#!/bin/bash -eu

readonly REPOSITORY_ROOT="$(git rev-parse --show-toplevel)"

[[ ! $(command -v sshpass) ]] \
    && sudo apt-get update \
    && sudo apt-get install -y sshpass

ANSIBLE_CONFIG="${REPOSITORY_ROOT}/ansible/ansible.cfg" \
    LC_ALL="C.UTF-8" \
    ansible-playbook \
    --inventory="${REPOSITORY_ROOT}/ansible/hosts.yaml" \
    "${REPOSITORY_ROOT}/ansible/playbook.yaml"
