#!/bin/bash

#
# Spydr06's power menu script for eww
# https://github.com/spydr06/dotfiles.git
#

widgets="outer-window-d powermenu"

if eww windows | grep "*powermenu"
then
    for widget in $widgets; do
        eww close $widget
    done
else
    eww open-many $widgets
fi