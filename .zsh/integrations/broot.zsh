(( ${+commands[broot]} )) || return

test -e "${HOME}/.config/broot/launcher/bash/br" \
	&& source "${HOME}/.config/broot/launcher/bash/br"
