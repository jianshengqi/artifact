#!/bin/sh -eux

cat >> /root/.bashrc <<EOF
. /etc/profile
PS1='[docker-\u@\h \W]\$'
EOF

rm -rf /tmp
dnf clean all