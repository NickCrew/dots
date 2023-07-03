#!/usr/bin/env bash
set -e

TMUX_REMOTE="https://github.com/tmux/tmux"
TPM_REMOTE="https://github.com/tmux-plugins/tpm"
TMUX_PLUG="${TMUX_PLUG:-$HOME/.tmux/plugins}"

OS="$(uname -s)"
PREFIX="${TMUX_PREFIX:-$HOME/.local}"

# 
# Install dependencies
# 
install_deps() {
	if [[ $OS == "Darwin" ]]; then
		command -v brew >/dev/null || sh "$(dirname $BASH_SOURCE[0])/homebrew.sh"
		brew install \
			autoconf \
			automake \
			bison \
			bzip2 \
			libevent \
			ncurses \
			pkg-config \
			utf8proc \
			zlib 
	elif [[ $OS == "Ubuntu" ]]; then
		sudo apt-get update \
			&& sudo apt-get install -y \
			libevent-dev \
			ncurses-dev \
			build-essential \
			bison \
			pkg-config
	fi
}

#
# Compile
# 
build_tmux() {
	TMUX_SRC="${PREFIX}/src/tmux"
	mkdir -p "${TMUX_SRC}" "${PREFIX}/share/man/man1" \
		&& cd "${TMUX_SRC}"

	if [ -d .git ]; then git pull -f;
	else git clone ${TMUX_REMOTE}; fi

	sh autogen.sh 
	./configure --enable-utf8proc --prefix=${PREFIX}
	make && make install 
}

#
# Install plugin manager
# 
install_plugin_mgr() {
	[ ! -d "${TMUX_PLUG}/tpm" ] \
		&& git clone ${TPM_REMOTE} "${TMUX_PLUG}"
}

install_deps
build_tmux
install_plugin_mgr
