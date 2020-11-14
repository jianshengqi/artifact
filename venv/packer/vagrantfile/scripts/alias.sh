#!/usr/bin/env bash

tee -a ${HOME}/.bashrc <<-'EOF'
alias sync='rsync -av --progress --delete /vagrant ~/vagrant'
EOF