#!/bin/bash

#
# Spydr06's eww sidebar widget script
# https://github.com/spydr06/dotfiles.git
#

widgets="outer-window-a outer-window-b outer-window-c date calendar profile quicksettings system disks"

function open {
    eww open-many $widgets
}

function close {
    eww close-all
}

case $1 in
"open")
    open
;;

"close")
    close
;;

*)
    if eww windows | grep "*outer-window-a"
    then
        close
    else
        open
    fi
;;  
esac