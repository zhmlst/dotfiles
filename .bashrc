[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

alias ls='ls --color'
alias tree='tree -C'

if ! shopt -oq posix; then
	[[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
fi

alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
alias dotfiles-update='dotfiles add -u && dotfiles commit -m "update" --amend && dotfiles push -f'

complete -p git &>/dev/null || _completion_loader git 2>/dev/null

if declare -F __git_complete >/dev/null; then
	__git_complete dotfiles __git_main
fi

proxy() {
	http_proxy=127.0.0.1:10808 \
		https_proxy=$http_proxy \
		HTTP_PROXY=$http_proxy \
		HTTPS_PROXY=$http_proxy \
		"$@"
}
alias nvim='~/Downloads/nvim-linux-x86_64/bin/nvim'
