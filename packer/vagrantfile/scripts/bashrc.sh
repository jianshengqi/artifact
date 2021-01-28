#!/usr/bin/env bash

tee -a /etc/bash.bashrc <<-'EOF'
export http_proxy="socks5://10.7.41.6:7891"
export https_proxy="socks5://10.7.41.6:7891"
EOF

tee -a /etc/bash.bashrc <<-'EOF'
alias sync='rsync -av --progress --delete /vagrant/ ~/dev_box'
EOF