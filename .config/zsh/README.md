1. Встановити все необхідне для zsh
    ```zsh
    sudo dnf install -y zsh zoxide eza bat rg
    curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin
    ```
2. Змінити оболонку для користувача
    ```zsh
    chsh -s /usr/bin/zsh $USER
    ```
3. Додати змінні оточення `/etc/zshenv`
    ```zsh
    # /etc/zsh/zshenv: system-wide .zshenv file for zsh(1).
    #
    # This file is sourced on all invocations of the shell.
    # If the -f flag is present or if the NO_RCS option is
    # set within this file, all other initialization files
    # are skipped.
    #
    # This file should contain commands to set the command
    # search path, plus other important environment variables.
    # This file should not contain commands that produce
    # output or assume the shell is attached to a tty.
    #
    # Global Order: zshenv, zprofile, zshrc, zlogin

    if [[ -z "$XDG_CONFIG_HOME" ]]
    then
        export XDG_CONFIG_HOME="$HOME/.config"
    fi
    if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
    then
        mkdir -p "$XDG_CONFIG_HOME/zsh"
    fi
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
    ```
