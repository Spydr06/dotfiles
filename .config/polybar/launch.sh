#!/usr/bin/env bash
#
# Spydr06's polybar launch script
# https://github.com/spydr06/dotfiles.git
#

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# start the new polybar instance
polybar --config=$SCRIPT_DIR/config.ini main &
