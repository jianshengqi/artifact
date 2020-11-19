#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y autoconf automake libtool curl make g++ unzip git

git clone https://github.com/wg/wrk.git ${HOME}/.wrk
make -C ${HOME}/.wrk

apt-get autoremove -y --purge
apt-get clean
rm -rf \
 /var/lib/apt/lists/* \
 /tmp/* \
 /var/tmp/* \
 /usr/share/man \
 /usr/share/doc \
 /usr/share/doc-base

tee -a /etc/profile.d/wrk.sh <<-'EOF'
# shellcheck shell=sh

wrk_path=${HOME}/.wrk

if [ -n "${PATH##*${wrk_path}}" -a -n "${PATH##*${wrk_path}:*}" ]; then
    export PATH=${PATH}:${wrk_path}
fi
EOF