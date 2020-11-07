#!/bin/sh -eux

cat >> /root/.bashrc <<EOF
PS1='[docker-\u@\h \W]\$'
. /etc/profile
EOF

rm -rf /tmp
dnf clean all