#!/bin/bash

## Sets monitors to Integrated Intel GPU to let the discrete GPU do passthrough stuff

# Sets Intel monitor in hyprland
hyprctl keyword monitor DP-1, 2560x1440@165, 1

# Removes nvidia monitors from hyprland
hyprctl keyword monitor DP-2, disable
hyprctl keyword monitor DP-3, disable

# Sets input of left monitor to DP-2
ddcutil setvcp --display 1 60 0x11

# Reset wallpapaers
systemctl restart hyprpaper --user

