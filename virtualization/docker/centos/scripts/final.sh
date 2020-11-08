#!/bin/sh -eux

cat >> /root/.bashrc <<EOF
. /etc/profile
PS1="docker=>\${PS1}"
EOF

rm -rf /tmp
dnf clean all