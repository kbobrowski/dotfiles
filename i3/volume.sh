#!/bin/bash

nsinks=$(pactl list sinks short | cut -c -1)

#input=$(pactl list sinks)
#
#notify() {
#    notification=""
#    for i in $nsinks
#    do
#        volume=$(echo "${input#*Sink #$i}" | grep -E 'V.*-left' | grep -oE '[0-9]+%' | head -n 1)
#        notification+="sink $i: $volume\n"
#    done
#    notify-send -t 1 "Volume" "$notification"
#}

 
for i in $nsinks
do
    case $1 in
        "up")
            pactl set-sink-mute $i false
            pactl set-sink-volume $i +5%
            ;;
        "down")
            pactl set-sink-mute $i false
            pactl set-sink-volume $i -5%
            ;;
        "toggle")
            pactl set-sink-mute $i toggle
            ;;
    esac
done
