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
alias dots='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
dots-backup() {
	local amend=0
	while getopts "a" opt; do
		case $opt in
		a) amend=1 ;;
		*)
			echo "Usage: dots-backup [-a]"
			return 1
			;;
		esac
	done
	dots add .
	dots status -s
	read -p "Commit and push these changes? (y/n): " confirm
	if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
		return 1
	fi
	if [[ $amend -eq 1 ]]; then
		dots commit --amend --no-edit
	else
		dots commit -m "backup"
	fi
	dots push origin master -f
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
