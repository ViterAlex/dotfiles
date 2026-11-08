
# .bashrc

# Source global definitions
# if [ -f /etc/bashrc ]; then
#     . /etc/bashrc
# fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
bindkey -v
# set -o vi
eval "$(oh-my-posh init zsh --strict --config /home/oleksa/.local/share/oh-my-posh/themes/oleksa.json)"
if [ -z "$TMUX" ]; then
    tmux attach -t main 2>/dev/null || exec tmux new-session -s main
fi
