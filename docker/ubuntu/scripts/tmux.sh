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
# 基础设置
set -g default-terminal "screen-256color"  # 设置终端缺省的支持颜色为256色
set -g default-shell /usr/bin/bash # 设置默认shell
set -g base-index 1                # 窗口编号从 1 开始计数
set -g pane-base-index 1           # 窗格编号从 1 开始计数
setw -g allow-rename on           # 禁止活动进程修改窗口名
setw -g mode-keys vi               # 复制模式中的默认键盘布局；可以设置为vi或emacs
set-option -g mouse on             # 开启鼠标支持

# 绑定hjkl键为面板切换的上下左右键
bind -r k select-pane -U # 绑定k为↑,选择上面板
bind -r j select-pane -D # 绑定j为↓,选择下面板
bind -r h select-pane -L # 绑定h为←,选择左面板
bind -r l select-pane -R # 绑定l为→,选择右面板

# 绑定Ctrl+hjkl键为面板上下左右调整边缘的快捷指令
bind -r ^k resizep -U 5 # 绑定Ctrl+k为往↑调整面板边缘5个单元格
bind -r ^j resizep -D 5 # 绑定Ctrl+j为往↓调整面板边缘5个单元格
bind -r ^h resizep -L 5 # 绑定Ctrl+h为往←调整面板边缘5个单元格
bind -r ^l resizep -R 5 # 绑定Ctrl+l为往→调整面板边缘5个单元格

# 交换面板
bind ^u swapp -U # 与上面板交换
bind ^d swapp -D # 与下面板交换

# 窗格边框
set -g pane-border-style fg='#747474',bg=default        # 设置边界颜色（bg背景颜色， fg为线条颜色）
set -g pane-active-border-style fg='magenta',bg=default # 设置正在使用的窗口的边界颜色，在不同窗口切换时边界颜色会变化

# 状态栏
set -g status-style fg=black,bg='#086CA2'     # 底部命令或者状态栏的颜色
set -g status-interval 1                      # 状态栏的刷新时间间隔
set -g status-keys vi                         # 操作状态栏时的默认键盘布局；可以设置为vi或emacs
set -g visual-activity on                     # 开启窗口操作的可视
set -g set-clipboard on                       # 开启剪切板
set -g display-panes-time 800                 # 稍长的窗格中显示的时间指标
set -g display-time 1000                      # 稍长的状态消息的显示时间，单位为毫秒
set -g renumber-windows on                    # 关掉某个窗口后，编号重排
set -g status-right-length "100"              # 状态栏右边长度
set -g status-right "#[bg=default]#[fg=black] %a %B %-d, %Y #[fg=black].:. #[fg=black]%H:%M #[fg=black,bg=default] #h " # 24 hour time: `%H:%M`,12 hour time: `%-I:%M %p`       # 状态栏右侧内容
setw -g automatic-rename on                                                                                                                                                     # 重命名窗口，以反映当前的程序
setw -g monitor-activity on                                                                                                                                                     # 开启窗口活动监视
setw -g clock-mode-style 24                                                                                                                                                     # 24小时显示方式
setw -g window-status-current-format '#[fg=yellow,bold]** #{window_index} #[fg=yellow]#{pane_current_command} #[fg=yellow]#(echo "#{pane_current_path}" | rev | cut -d'/' -f-3 | rev) #[fg=yellow]** #[fg=black]|' # 活动窗格状态栏色彩
setw -g window-status-format '#[fg=black]#{window_index} #[fg=black]#{pane_current_command} #[fg=black]#(echo "#{pane_current_path}" | rev | cut -d'/' -f-3 | rev) #[fg=black]|'                                   # 活动窗格状态栏色彩
EOF