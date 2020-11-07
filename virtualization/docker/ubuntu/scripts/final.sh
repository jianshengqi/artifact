#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

cat >> /root/.bashrc <<EOF
PS1='[docker-\u@\h \W]\$'
. /etc/profile
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