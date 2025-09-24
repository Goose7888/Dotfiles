#!/bin/bash

# Re-enables NVIDIA mode on both monitors; disables Intel Display

# Adds nvidia monitors to hyprland
hyprctl keyword monitor DP-2, 2560x1440@165, 2560x0, 1
hyprctl keyword monitor DP-3, 2560x1440@165, 0x0, 1

# Disables Intel 
hyprctl keyword monitor DP-1, disable

# Sets monitor output to correct ports
ddcutil setvcp 60 0x0f --display 2
ddcutil setvcp 60 0x0f --display 3

# Restart wallpapers
systemctl --user restart waypaper
