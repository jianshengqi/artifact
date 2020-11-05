#!/bin/sh -eux

cat >> /root/.bashrc <<EOF
. /etc/profile
EOF

rm -rf /tmp
yum clean all