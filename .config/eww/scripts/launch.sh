#!/bin/bash

#
# Spydr06's eww start script
# https://github.com/spydr06/dotfiles.git
#

widgets="outer-window-a outer-window-b outer-window-c date calendar profile powermenu system disks"

for widget in $widgets; do
    eww open $widget
done