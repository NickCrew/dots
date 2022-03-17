
command -v mcfly >/dev/null && \
	eval "$(mcfly init zsh)"
export MCFLY_KEY_SCHEME=vim
if [[ $(isdark) == "false" ]]; then
    export MCFLY_LIGHT=TRUE
fi
export MCFLY_FUZZY=true
export MCFLY_RESULTS=25
export MCFLY_RESULTS_SORT=RANK  # RANK or LAST_RUN


if command -v broot 1>/dev/null; then
	test -e "${HOME}/.config/broot/launcher/bash/br" && \
		source "${HOME}/.config/broot/launcher/bash/br"
fi

command -v funky >/dev/null && \
	eval "$(funky --init zsh)"

command -v tmuxp >/dev/null && \
	eval "$(_TMUXP_COMPLETE=source_zsh tmuxp)"


