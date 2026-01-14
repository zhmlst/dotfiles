[[ $- != *i* ]] && return

for file in "$XDG_CONFIG_HOME/bash"/*.bash; do
	[ -f "$file" ] || continue

	case "$(basename "$file")" in
	rc.bash | profile.bash) continue ;;
	esac

	. "$file"
done
