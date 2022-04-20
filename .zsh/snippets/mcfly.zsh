(( ${+commands[mcfly]} )) || return



eval "$(mcfly init zsh)"
export MCFLY_FUZZY=true
export MCFLY_KEY_SCHEME=vim
export MCFLY_RESULTS=25
export MCFLY_RESULTS_SORT=RANK  # RANK or LAST_RUN


mcfly_auto_light_mode() {
  if [[ $(defaults read -g AppleInterfaceStyle) != 'Dark' ]]; then
    export MCFLY_LIGHT=TRUE
  fi
}
zsh-defer mcfly_auto_light_mode
