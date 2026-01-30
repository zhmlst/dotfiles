export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

export XCOMPOSEFILE="$XDG_CONFIG_HOME/compose"
export BROWSER=firefox

export GOPATH="$HOME/.go"
export GOTRACEBACK=none
export GO_TELEMETRY=off

export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/gitconfig"

export MANPAGER="nvim +Man!"
export EDITOR="nvim"
export VISUAL="nvim"

export PATH="$HOME/.local/bin:$GOPATH/bin:$XDG_DATA_HOME/nvim/mason/bin:$PATH"

mkdir -p $XDG_STATE_HOME

[ -f ~/.bashrc ] && . ~/.bashrc
. "$HOME/.cargo/env"
