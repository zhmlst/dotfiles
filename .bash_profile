export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export GOPATH="$HOME/.go"
export GOTRACEBACK=none
export GODEBUG=netdns=go
export GODEBUG=telemetry=0

export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/gitconfig"

export MANPAGER="nvim +Man!"
export EDITOR="nvim"
export VISUAL="nvim"

export PATH="$XDG_CONFIG_HOME/bash/scripts:$HOME/.local/bin:$GOPATH/bin:$PATH"

mkdir -p $XDG_STATE_HOME
tabs 4

[ -f ~/.bashrc ] && . ~/.bashrc
