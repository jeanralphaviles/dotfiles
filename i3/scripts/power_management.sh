#!/bin/bash

# Arg[1] is display shutoff time in minutes

xscreensaver &
xautolock -time "$1" -locker "$HOME/.i3/scripts/lock.sh" &
python "$HOME/.i3/scripts/disable-standby-fs.py" "$(($1 * 60 - 1))" &
