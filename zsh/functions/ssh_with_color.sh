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
  color='default'
  for arg in "$@"; do
    if [[ "${arg:0:1}" != "-" ]]; then
      color='#322828'
      color='red'
      # if [[ "$arg" == "do" ]]; then
      #   color='#322828'
      # elif [[ "$arg" =~ '^athena' ]]; then
      #   color='#323228'
      # elif [[ "$arg" =~ '^int[0-9]?-' ]]; then
      #   color='#323228'
      # fi
      break
    fi
  done
  # tmux set window-style "bg=$color"
  tmux select-pane -P "bg=$color"
}

alias ssh='ssh_with_color'
