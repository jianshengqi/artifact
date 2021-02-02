#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

./alias.sh
./common.sh
./cpp.sh
./go.sh
./tmux.sh
./vim.sh