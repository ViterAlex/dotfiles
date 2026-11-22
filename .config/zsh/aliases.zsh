# Better ls
alias ls='eza --icons --git'

# Detailed listing
alias ll='eza -lh --icons --git'

# Detailed listing including hidden files
alias la='eza -lah --icons --git'

# Tree view
alias tree='eza --tree --icons'

# Reuse ls completions for eza (avoids defining a separate completion function)
compdef eza=ls

# Better cat
alias cat='bat'

# =========================================================
# Core utilities
# =========================================================

alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'
alias su='su -'

# =========================================================
# Navigation
# =========================================================

alias -- -='cd -'  # -- prevents - being parsed as a flag; cd - jumps to previous directory

# lf() { # zsh follow lf navigation
#     tmp=$(mktemp)
#     command lf -last-dir-path="$tmp" "$@"
#     if [ -f "$tmp" ]; then
#         dir=$(cat "$tmp")
#         rm -f "$tmp"
#         [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#     fi
# }

# =========================================================
# Editor
# =========================================================

alias vim='nvim'

# =========================================================
# Git
# =========================================================

alias glog='PAGER="less -F -X" git log'                              # -F quit if one screen, -X no clear on exit
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'
alias dotfiles='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias dfs='dotfiles status'
alias dfa='dotfiles add'
alias dfc='dotfiles commit'
alias dfl='dotfiles log --oneline -n 10'

# =========================================================
# SSH-proxy for old hosts
# =========================================================
lssh() {
  if [ -z "$1" ]; then
    echo "Usage: lssh <host>"
    return 1
  fi

  local target_host="$1"

  # Execute SSH inside the container, letting it parse the mounted config file natively
  docker exec -it legacy-box ssh -F /root/.ssh/config "$target_host"
}
bounce_peer() {
  local host="gw3.sof144.mil"
  local peer="${1:-peer-Podil}"
  # Check whether the peer exists before toggling its state.
  ssh "$host" "/interface/wireguard/peers
    :local id [find name=\"$peer\"]\n
    :if ([:len \$id] > 0) do={\n
      set \$id disabled=yes\n
      :delay 1s\n
      set \$id disabled=no\n
      :put \"Toggled $peer\"\n
    } else={\n
      :put \"Peer $peer not found\"\n
      :onerror e in={} { /quit }\n
    }"
}
# =========================================================
# Video
# =========================================================

alias stream='mpv av://v4l2:/dev/video4 --fullscreen --demuxer-lavf-o=input_format=mjpeg,framerate=30 --profile=low-latency --untimed'
