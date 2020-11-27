  
#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

tee -a /etc/profile.d/alias.sh <<-'EOF'
# shellcheck shell=sh
alias python='python3'
EOF