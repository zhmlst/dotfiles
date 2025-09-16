parse_git_branch() {
	git branch --show-current 2>/dev/null
}

PS1='\[\e[32m\]\u@\h \[\e[34m\]\w \[\e[33m\]$(parse_git_branch)\[\e[m\]\n'
PS1+='\[\e[31m\]\$ \[\e[m\]'
