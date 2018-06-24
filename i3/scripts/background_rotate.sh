#!/bin/bash

# Every $1 seconds call the background change script

INTERVAL="$1"

if [ -z "$INTERVAL" ]
then
  >&2 echo "Interval not specified, defaulting to 30 minutes"
  INTERVAL=30
fi

while true
do
  $HOME/.i3/scripts/background_change.sh
  sleep "$INTERVAL"
done
