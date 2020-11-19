#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y \
            build-essential \
            gcc \
            g++ \
            gdb \
            make \
            automake \
            autoconf \
            llvm \
            clang

# usdt lib:systemtap-sdt-dev
apt-get install -y \
            systemtap-sdt-dev

apt-get autoremove -y --purge
apt-get clean
rm -rf \
 /var/lib/apt/lists/* \
 /tmp/* \
 /var/tmp/* \
 /usr/share/man \
 /usr/share/doc \
 /usr/share/doc-base