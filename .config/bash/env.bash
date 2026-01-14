export HISTFILE="$XDG_STATE_HOME/bash_history"
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="ls:bg:fg:history"
[[ "$PROMPT_COMMAND" != *"history -a"* ]] && PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

shopt -s histappend
