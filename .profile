[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

[ -d "/usr/local/go/bin" ] && PATH="$PATH:/usr/local/go/bin"

[ -d "$HOME/.local/bin" ] && PATH="$PATH:$HOME/.local/bin"

command -v go >/dev/null && PATH="$PATH:$(go env GOPATH)/bin"

export EDITOR=nvim
