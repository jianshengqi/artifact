#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

tee -a /root/.bashrc <<-'EOF'

# reload system profile
. /etc/profile
EOF