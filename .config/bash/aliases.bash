alias c='clear'
alias vi='nvim'
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -a'
alias grep='grep --color=auto'
alias tree='tree -C'

catall() {
    find "$@" -type f -exec awk '
    FNR==1 {
        print "\x1b[94m=== " FILENAME " ===\x1b[0m"
    }
    { print $0 }' {} \;
}

back() { nohup "$@" >/dev/null 2>&1 & }
_back_complete() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    if [[ $COMP_CWORD -eq 1 ]]; then
        COMPREPLY=($(compgen -c -- "$cur"))
    else
        COMPREPLY=()
    fi
    return 0
}
complete -F _back_complete -o default back

if [ -f /usr/share/bash-completion/completions/pacman ]; then
    . /usr/share/bash-completion/completions/pacman
fi
alias pkg='sudo pacman'
complete -F _pacman pkg

#git
if [ -f /usr/share/bash-completion/completions/git ]; then
    . /usr/share/bash-completion/completions/git
fi
alias gl='git log --format=format:"%C(auto)%H%d %n%B" --graph'
__git_complete gl _git_log
alias gs='git status --short'
__git_complete gs _git_status
alias gc='git commit'
__git_complete gc _git_commit
alias ga='git add'
__git_complete ga _git_add
alias gd='git diff'
__git_complete gd _git_diff
alias gb='git branch'
__git_complete gb _git_branch

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
    dots add $HOME/.config $HOME/.bash_profile $HOME/.bashrc
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
    dots add $HOME
    dots checkout --orphan tmp
    dots add .
    dots commit -m "init"
    dots branch -D master
    dots branch -m master
    dots push origin master -f
}
