#! /bin/bash

players=`playerctl --list-all`

if [[ "$1" == "status" ]]; then
    if [[ "$players" == *"ncspot"* ]]; then
        echo `playerctl --player=ncspot metadata --format "{{ title }} - {{ artist }}"`
    elif [[ "$players" == *"spotify"* ]]; then
        echo `playerctl --player=spotify metadata --format "{{ title }} - {{ artist }}"`
    else
        echo "No Music Playing"
    fi
elif [[ "$1" == "previous" ]]; then
    if [[ "$players" == *"ncspot"* ]]; then
        echo `playerctl --player=ncspot previous`
    elif [[ "$players" == *"spotify"* ]]; then
        echo `playerctl --player=spotify previous`
    fi
elif [[ "$1" == "playpause" ]]; then
    if [[ "$players" == *"ncspot"* ]]; then
        echo `playerctl --player=ncspot play-pause`
    elif [[ "$players" == *"spotify"* ]]; then
        echo `playerctl --player=spotify play-pause`
    fi
elif [[ "$1" == "next" ]]; then
    if [[ "$players" == *"ncspot"* ]]; then
        echo `playerctl --player=ncspot next`
    elif [[ "$players" == *"spotify"* ]]; then
        echo `playerctl --player=spotify next`
    fi
else
    true
fi
