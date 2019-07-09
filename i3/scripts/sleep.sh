#!/bin/bash
set -e
set +x

# Send a lock signal to the screensaver and turn the monitor off
"$HOME/.i3/scripts/lock.sh"
sleep 2
systemctl suspend
