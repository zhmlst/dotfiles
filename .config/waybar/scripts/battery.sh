#!/bin/sh
LOW=15
FULL=95

while [ $# -gt 0 ]; do
	case "$1" in
	--low)
		LOW="$2"
		shift 2
		;;
	--full)
		FULL="$2"
		shift 2
		;;
	*)
		shift
		;;
	esac
done

state=$(upower -i $(upower -e | grep battery) | awk '/state/ {gsub(/^ +| +$/,"",$2); print $2}')
perc=$(upower -i $(upower -e | grep battery) | awk '/percentage/ {gsub(/^ +| +$/,"",$2); print int($2)}')

class=""
if [ "$state" = "fully-charged" ] || [ "$perc" -ge "$FULL" ]; then
	class="full"
elif [ "$perc" -le "$LOW" ]; then
	class="low"
fi

prev="{\"alt\": \"$state\", \"percentage\": $perc, \"class\": \"$class\"}"
echo "$prev"

upower --monitor-detail | awk -F: -v prev="$prev" -v LOW="$LOW" -v FULL="$FULL" '
/state/ {gsub(/^ +| +$/,"",$2); state=$2}
/percentage/ {gsub(/^ +| +$/,"",$2); perc=int($2)}
state && perc {
    class=""
    if(state=="fully-charged" || perc>=FULL) class="full"
    else if(perc<=LOW) class="low"

    json="{\"alt\": \"" state "\", \"percentage\": " perc ", \"class\": \"" class "\"}"
    if(json != prev){
        print json
        fflush()
        prev=json
    }
    state=""; perc=""
}'
