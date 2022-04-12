(( ${+commands[mcfly]} )) || return

eval "$(mcfly init zsh)"

MCFLY_LIGHT=FALSE
if [[ $(isdark) == "false" ]]; then
    MCFLY_LIGHT=TRUE
fi

export MCFLY_FUZZY=true
export MCFLY_KEY_SCHEME=vim
export MCFLY_LIGHT
export MCFLY_RESULTS=25
export MCFLY_RESULTS_SORT=RANK  # RANK or LAST_RUN
