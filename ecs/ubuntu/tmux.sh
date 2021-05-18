#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y libevent-dev ncurses-dev build-essential bison pkg-config

tmux='https://github.com/tmux/tmux/releases/download/3.2/tmux-3.2.tar.gz'

if [ ! -d "/tmp/tmux" ]; then
  mkdir -p /tmp/tmux
fi

cd /tmp/tmux
curl -L ${tmux} | tar -zx --strip-components 1
./configure
make && make install

cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .