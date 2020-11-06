#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

cat >> /root/.bashrc <<EOF
. /etc/profile
EOF