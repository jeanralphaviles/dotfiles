#!/bin/bash

# Send a lock signal to the screensaver. Keep trying commands until one works.
gnome-screensaver-command --lock && exit
xscreensaver-command --lock && exit
