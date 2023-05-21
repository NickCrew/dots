#!/usr/bin/env zsh

set -eu

RST_PKGS=(zoxide exa fd-find)

install_rust() {
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh 
	sh rustup.sh -y
}

# Install crates
install_crates() {
	source ~/.cargo/env
	for rp in "${RST_PKGS[@]}"; do
		cargo install $rp
	done
}


# Install FZF
install_fzf() {
	if ! command -v fzf >/dev/null; then
		git clone https://github.com/junegunn/fzf ~/.fzf

		if [[ -f ~/.fzf.zsh ]]; then
			sh ~/.fzf/install \
				--all \
				--completion \
				--key-bindings \
				--no-bash \
				--no-zsh \
				--no-fish
		fi
	fi
}


