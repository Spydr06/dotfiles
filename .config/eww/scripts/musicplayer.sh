#!/bin/bash

#
# Spydr06's music player script for eww
# https://github.com/spydr06/dotfiles.git
#

playerstatus=`playerctl status`

case $1 in
"glyph")
    if [ "$playerstatus" == "Playing" ]; then
        echo ""
    elif [ "$playerstatus" == "Paused" ]; then 
        echo ""
    else
        #echo ""
        echo ""
    fi
;;

"tooltip")
    if [ "$playerstatus" == "Playing" ]; then
        echo "Pause"
    elif [ "$playerstatus" == "Paused" ]; then 
        echo "Play"
    else
        echo "No Player"
    fi
;;

*)
    echo "Usage: musicplayer.sh [glyph|tooltip]"
    exit 1
esac