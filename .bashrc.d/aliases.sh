
# Підсвітка номера команди та sudo
alias history="history | sed 's/^[ ]*[0-9]*/\x1b[33m&\x1b[0m/' | sed 's/sudo/\x1b[31msudo\x1b[0m/g'"
alias less="less -R" # less розуміє кольори
alias ls='ls -lha --group-directories-first --indicator-style=slash'
alias open='xdg-open'
alias speedtest='speedtest-cli'
alias vim="nvim"
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias dir='dir --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias grep='grep --color=auto'
    alias ls='ls -lha --color=auto --group-directories-first --indicator-style=slash'
    alias vdir='vdir --color=auto'
fi
