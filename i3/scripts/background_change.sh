#!/bin/sh
# Set the desktop background to a random picture in ~/Pictures/backgrounds
BACKGROUND="$(
  find "$HOME/Pictures/backgrounds/" -maxdepth 1 -type f | shuf -n 1
)"
swaymsg "output * bg \"$BACKGROUND\" fill"
