if [ -d ${HOME}/.zshrc.d/ ]; then
	for zshrc in $(find ${HOME}/.zshrc.d/ -type f); do
		source ${zshrc}
	done
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
