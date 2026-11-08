lssh() {
    if [ -z "$1" ]; then
        echo "Usage: lssh <host>"
        return 1
    fi

    local target_host="$1"

    # Execute SSH inside the container, letting it parse the mounted config file natively
    docker exec -it legacy-box ssh -F /root/.ssh/config "$target_host"
}
function dotfiles() {
   /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME "$@"
}
eval "export POSH_SESSION_ID="12395028-0341-4390-8339-f566a6a57cf7"; export POSH_CONFIG='';source $'/home/oleksa/.cache/oh-my-posh/init.14695981039346656037.sh'"
