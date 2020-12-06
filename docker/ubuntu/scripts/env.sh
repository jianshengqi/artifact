#!/bin/sh -eux


export DEBIAN_FRONTEND=noninteractive

tee -a /etc/profile.d/ps1.sh <<-'EOF'
PS1="docker=>${PS1}"
EOF

tee -a /root/.bashrc <<-'EOF'
# reload system profile
. /etc/profile
EOF

tee -a /etc/profile.d/alias.sh <<-'EOF'
# shellcheck shell=sh
alias python='python3'
EOF