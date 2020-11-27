#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

tee -a /etc/profile.d/ps1.sh <<-'EOF'
PS1="docker=>${PS1}"
EOF