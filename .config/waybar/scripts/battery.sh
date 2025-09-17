#!/bin/sh
state=$(upower -i $(upower -e | grep battery) | awk '/state/ {gsub(/^ +| +$/,"",$2); print $2}')
perc=$(upower -i $(upower -e | grep battery) | awk '/percentage/ {gsub(/^ +| +$/,"",$2); print int($2)}')
prev="{\"alt\": \"$state\", \"percentage\": $perc}"
echo "$prev"

upower --monitor-detail | awk -F: '
/state/ {gsub(/^ +| +$/,"",$2); state=$2}
/percentage/ {gsub(/^ +| +$/,"",$2); perc=int($2)}
state && perc {
    json="{\"alt\": \"" state "\", \"percentage\": " perc "}"
    if(json != prev){
        print json
        fflush()
        prev=json
    }
    state=""; perc=""
}' prev="$prev"
