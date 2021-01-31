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

tee /etc/tmux.conf <<-'EOF'
# 基础设置
set-option -g default-shell /usr/bin/bash
set-option -g default-terminal "screen-256color"           # 设置终端缺省的支持颜色为256色
set-option -g base-index 1                                 # 窗口编号从 1 开始计数
set-option -g pane-base-index 1                            # 窗格编号从 1 开始计数
set-option -g mouse on                                     # 开启鼠标支持
set-option -g visual-activity on                           # 开启窗口操作的可视
set-option -g set-clipboard on                             # 开启剪切板
set-option -g display-panes-time 800                       # 稍长的窗格中显示的时间指标，单位为毫秒
set-option -g display-time 1000                            # 提示信息的持续时间；设置足够的时间以避免看不清提示，单位为毫秒
set-option -g repeat-time 1000                             # 控制台激活后的持续时间；设置合适的时间以避免每次操作都要先激活控制台，单位为毫秒
set-option -g renumber-windows on                          # 关掉某个窗口后，编号重排
set-window-option -g automatic-rename on                   # 重命名窗口，以反映当前的程序
set-window-option -g monitor-activity on                   # 开启窗口活动监视
set-window-option -g clock-mode-style 24                   # 24小时显示方式
set-window-option -g allow-rename on                       # 禁止活动进程修改窗口名
set-window-option -g mode-keys vi                          # 复制模式中的默认键盘布局；可以设置为vi或emacs
set-window-option -g mouse on                              # 窗口切换后让人可以用鼠标上下滑动显示历史输出

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
set-option -g pane-border-style fg='#747474',bg=default        # 设置边界颜色（bg背景颜色， fg为线条颜色）
set-option -g pane-active-border-style fg='magenta',bg=default # 设置正在使用的窗口的边界颜色，在不同窗口切换时边界颜色会变化

# 状态栏
set-option -g status on                                                # 启用状态栏
set-option -g status-position bottom                                   # 状态栏置于底部
set-option -g status-justify "left"                                    # 窗口列表居中显示
set-option -g status-left '[#{session_name}] '                         # 状态栏左方的内容
set-option -g status-right '[#[fg=white]#(date +" %m-%d %H:%M ")]'     # 状态栏右方的内容；这里的设置将得到类似23:59的显示
set-option -g status-left-length 10                                    # 状态栏左方的内容长度；
set-option -g status-right-length 15                                   # 状态栏右方的内容长度；建议把更多的空间留给状态栏左方（用于列出当前窗口）
set-option -g status-style fg=white,bg=default                         # 底部命令或者状态栏的颜色
set-option -g status-interval 1                                        # 状态栏的刷新时间间隔
set-option -g status-keys vi                                           # 操作状态栏时的默认键盘布局；可以设置为vi或emacs
set-window-option -g window-status-current-format '#[fg=yellow,bold]** #{window_index} #[fg=yellow]#{pane_current_command} #[fg=yellow]#(echo "#{pane_current_path}" | rev | cut -d'/' -f-3 | rev) #[fg=yellow]** #[fg=white]' # 活动窗格状态栏色彩
set-window-option -g window-status-format '#[fg=white]#{window_index} #[fg=white]#{pane_current_command} #[fg=white]#(echo "#{pane_current_path}" | rev | cut -d'/' -f-3 | rev) #[fg=white]'                                   # 活动窗格状态栏色彩
EOF
