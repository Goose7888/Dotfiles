#!/bin/bash

# Takes 1 argument: The monitor to switch to
#
# Sets only active monitor to that specified
# Also sets other monitor to HDMI-1

if [ "$1" = "DP-1" ];
then
    connection="DP-1"
    connectionOther="DP-2"
    displayNum=1
    displayOther=2
elif [ "$1" = "DP-2" ];
then
    connection="DP-2"
    connectionOther="DP-1"
    displayNum=2
    displayOther=1
else
    echo "No Monitor name given"
    exit
fi


# Disables both nvidia monitors
hyprctl keyword monitor DP-2, DP-3, disable

# Sets active monitor
hyprctl keyword monitor "$connection", 2560x1440@165, 1

# Disables other monitor
hyprctl keyword monitor "$connectionOther", disable

# Sets monitor outputs
# Active is DP-1; other is HDMI-1
ddcutil vcpset 60 0x0f --display "$displayNum"
ddcutil vcpset 60 0x11 --display "$displayOther"

# Reset wallpapaers
systemctl restart hyprpaper --user

