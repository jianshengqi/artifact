#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

cat >> /root/.bashrc <<EOF
. /etc/profile
PS1="docker=>${PS1}"
EOF

apt-get autoremove -y --purge
apt-get clean
rm -rf \
 /var/lib/apt/lists/* \
 /tmp/* \
 /var/tmp/* \
 /usr/share/man \
 /usr/share/doc \
 /usr/share/doc-base