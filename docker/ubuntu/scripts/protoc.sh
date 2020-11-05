#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

PB_REL="https://github.com/protocolbuffers/protobuf/releases"
url -LO '$PB_REL/download/v3.13.0/protoc-3.13.0-linux-x86_64.zip'
unzip protoc-3.13.0-linux-x86_64.zip -d $HOME/.local

cat >> /etc/profile.d/protoc.sh <<EOF
# shellcheck shell=sh

protoc_path=\${HOME}/.local/bin

if [ -n "\${PATH##*\${protoc_path}}" -a -n "\${PATH##*\${protoc_path}:*}" ]; then
    export PATH=\${PATH}:\${protoc_path}
fi
EOF