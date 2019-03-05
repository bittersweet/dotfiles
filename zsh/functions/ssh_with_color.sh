ssh_with_color() {
  trap 'tmux_bg_color_reset' SIGINT
  tmux_bg_color_set $@
  \ssh $@
  retval=$?
  tmux_bg_color_reset
  return $retval
}

tmux_bg_color_reset() {
  # tmux set window-style default
  tmux select-pane -P default
  trap - SIGINT
}

tmux_bg_color_set() {
  tmux select-pane -P "bg=colour24"
}

alias ssh='ssh_with_color'
