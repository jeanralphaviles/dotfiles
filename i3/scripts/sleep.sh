#!/bin/bash

# Send a lock signal to the screensaver and turn the monitor off
"$HOME/.i3/scripts/lock.sh" && systemctl suspend
