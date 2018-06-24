#!/bin/bash
# Set the desktop background to a random picture in ~/Pictures/backgrounds
feh --bg-scale "$(find "$HOME/Pictures/backgrounds/" -maxdepth 1 -type f | shuf -n 1)"
