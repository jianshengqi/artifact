#!/bin/sh -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install -y libevent-dev ncurses-dev build-essential bison pkg-config

tmux='https://github.com/tmux/tmux/releases/download/3.1c/tmux-3.1c.tar.gz'

if [ ! -d "/tmp/tmux" ]; then
  mkdir -p /tmp/tmux
fi

cd /tmp/tmux
curl -L ${tmux} | tar -zx --strip-components 1
./configure
make && make install

apt-get autoremove -y --purge
apt-get clean
rm -rf \
 /var/lib/apt/lists/* \
 /tmp/* \
 /var/tmp/* \
 /usr/share/man \
 /usr/share/doc \
 /usr/share/doc-base

tee /etc/tmux.conf <<-'EOF'
set-option -g mouse on             # 开启鼠标支持
set -g default-shell /usr/bin/bash # 设置默认shell
set -g base-index 1                # 窗口编号从 1 开始计数
set -g pane-base-index 1           # 窗格编号从 1 开始计数
set -g renumber-windows on         # 关掉某个窗口后，编号重排
setw -g allow-rename off           # 禁止活动进程修改窗口名
setw -g automatic-rename off       # 禁止自动命名新窗口
setw -g mode-keys vi               # 进入复制模式的时候使用 vi 键位（默认是 EMACS）

# 绑定hjkl键为面板切换的上下左右键
bind -r k select-pane -U # 绑定k为↑
bind -r j select-pane -D # 绑定j为↓
bind -r h select-pane -L # 绑定h为←
bind -r l select-pane -R # 绑定l为→

# 绑定Ctrl+hjkl键为面板上下左右调整边缘的快捷指令
bind -r ^k resizep -U 5 # 绑定Ctrl+k为往↑调整面板边缘5个单元格
bind -r ^j resizep -D 5 # 绑定Ctrl+j为往↓调整面板边缘5个单元格
bind -r ^h resizep -L 5 # 绑定Ctrl+h为往←调整面板边缘5个单元格
bind -r ^l resizep -R 5 # 绑定Ctrl+l为往→调整面板边缘5个单元格

set  -g status-style bg='#0C8A92',fg=black # 底部命令或者状态栏的颜色
set  -g pane-border-style fg='green',bg=black	# 设置边界颜色（bg背景颜色， fg为线条颜色）
set  -g pane-active-border-style fg=magenta,bg=default # 设置正在使用的窗口的边界颜色，在不同窗口切换时边界颜色会变化
EOF