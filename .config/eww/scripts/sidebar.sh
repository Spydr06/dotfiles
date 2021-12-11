#!/bin/bash

#
# Spydr06's eww sidebar widget script
# https://github.com/spydr06/dotfiles.git
#

widgets="outer-window-a outer-window-b outer-window-c date calendar profile quicksettings system disks"

case $1 in
"open")
    eww open-many $widgets
;;

"close")
    eww close-all
;;

*)
    echo "Usage: sidebar.sh [open|close]"
    exit 1
esac