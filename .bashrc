[[ $- != *i* ]] && return
for file in $XDG_CONFIG_HOME/bash/*; do
	[ -f "$file" ] && . "$file"
done
