setopt ignore_eof		        # Don't exit on EOF
setopt local_traps		        # Allow functions to have local traps
setopt local_options	        # Allow fucntions to have local options


function hashdir() {
    # Hash directory
    [ -z "$1" ] && echo "Pass hash to use for dir" && return 1
    hash -d "$1"="$(pwd)"
    echo hash -d "$1"=\""$(pwd)"\" >> $ZSH_HASH_DIR
}

function take () {
    # Make directory and cd it
    mkdir -p "$1" && cd "$1"
}

function top () {
    # Navigate to project root
    cd "$(git rev-parse --show-toplevel 2>/dev/null)"
}

function jj () {
    # Navigate to project under this dir
    cd "${1:-.}/$(find . -maxdepth 5 -type d -name .git | sed 's|/.git$||' | fzf --preview 'tree -L 2 ./{}')"
}

function tmp () {
    # Create temp directory
    [ "$1" = "view" ] && cd /tmp/workspaces && cd $(ls -t | fzf --preview 'ls -A {}') && return 0
    r="/tmp/workspaces/$(xxd -l3 -ps /dev/urandom)"
    mkdir -p -p "$r" && pushd "$r"
}

function tt() {
  # Quick set a somewhat meaningful tab title
  n="$(basename $(git rev-parse --show-toplevel))"
  t="${1} :: ${n}"
  wezterm cli set-tab-title "$t"
}


