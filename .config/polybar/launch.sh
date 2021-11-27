#!/bin/bash

#
# Spydr06's polybar launch script
# https://github.com/spydr06/dotfiles.git
#

pushd $HOME/.config/polybar

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# start the new polybar instance
polybar --config=./config main &

popd