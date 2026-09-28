#!/bin/sh
set -e

mkdir -p /root/.ssh
chmod 700 /root/.ssh

if [ -f /keys/id_ed25519 ]; then
    cp /keys/id_ed25519 /root/.ssh/id_ed25519
    chmod 600 /root/.ssh/id_ed25519
fi

if [ -f /keys/known_hosts ]; then
    cp /keys/known_hosts /root/.ssh/known_hosts
    chmod 644 /root/.ssh/known_hosts
fi

mkdir -p /root/.config/ansible
chmod 700 /root/.config/ansible

if [ -f /secrets/vault-password ]; then
    cp /secrets/vault-password /root/.config/ansible/vault-password
    chmod 600 /root/.config/ansible/vault-password
fi

exec "$@"
