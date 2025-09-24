#!/bin/bash

# Sets hyprland with two connected monitors
hyprctl keyword monitor DP-2, 2560x1440@165, 0x0, 1
hyprctl keyword monitor DP-1, 2560x1440@165, 2560x0, 1

# Sets input of left monitor to DP-1
ddcutil setvcp --display 1 60 0x0f
ddcutil setvcp --display 2 60 0x0f

# Reset wallpapers
systemctl restart hyprpaper --user
