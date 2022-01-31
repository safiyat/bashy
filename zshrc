if [ -d /Users/safiyat/.zshrc.d/ ]; then
	for zshrc in $(find /Users/safiyat/.zshrc.d/ -type f); do
		source ${zshrc}
	done
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
