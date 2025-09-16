alias c='clear'
alias vi='nvim'
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -a'
alias grep='grep --color=auto'
alias tree='tree -C'
alias install='sudo pacman -S'

#git
alias gl='git log --oneline --graph --all --decorate'
alias gs='git status --short'
alias gc='git add . && git commit -m'

#dotfiles
alias dots='git --git-dir=.dotfiles.git --work-tree=$HOME'
dots-backup() {
	dots add .
	dots status -s
	read -p "Commit and push these changes? (y/n): " confirm
	if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
		dots commit -m "backup"
		dots push origin master
	else
		return 1
	fi
}
dots-reset-history() {
	read -p "Reset dotfiles history? (y/n): " confirm
	if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
		return 1
	fi
	dots add .
	dots checkout --orphan tmp
	dots add .
	dots commit -m "init"
	dots branch -D master
	dots branch -m master
	dots push origin master -f
}
