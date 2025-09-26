#!/bin/sh
LOW=15
FULL=95
NOTIFY_STEP=5

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

battery=$(upower -e | grep battery)

state=$(upower -i "$battery" | awk '/state/ {gsub(/^ +| +$/,"",$2); print $2}')
perc=$(upower -i "$battery" | awk '/percentage/ {gsub(/^ +| +$/,"",$2); print int($2)}')

class=""
if [ "$state" = "fully-charged" ] || [ "$perc" -ge "$FULL" ]; then
	class="full"
elif [ "$perc" -le "$LOW" ]; then
	class="low"
fi

alt_state="$state"
[ "$state" = "fully-charged" ] && alt_state="charging"

prev="{\"alt\": \"$alt_state\", \"percentage\": $perc, \"class\": \"$class\"}"
echo "$prev"

last_notify=$perc

upower --monitor-detail | awk -F: -v prev="$prev" -v LOW="$LOW" -v FULL="$FULL" -v step="$NOTIFY_STEP" '
/state/ {gsub(/^ +| +$/,"",$2); state=$2}
/percentage/ {gsub(/^ +| +$/,"",$2); perc=int($2)}
state && perc {
    class=""
    alt=state
    if(state=="fully-charged" || perc>=FULL) {
        class="full"
        alt="charging"
    }
    else if(perc<=LOW) class="low"

    json="{\"alt\": \"" alt "\", \"percentage\": " perc ", \"class\": \"" class "\"}"
    if(json != prev){
        print json
        fflush()
        prev=json

        # уведомление при низком заряде через каждые step процентов
        if(class=="low" && (perc % step)==0){
            system("notify-send \"Battery low\" \"Battery at " perc "%\"")
        }
    }
    state=""; perc=""
}'
