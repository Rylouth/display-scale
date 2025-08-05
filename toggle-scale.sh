#!/bin/bash

CONF_DIR="$HOME/.config/hypr/hyprland"
TARGET="$CONF_DIR/display.conf"
CURRENT_SCALE=$(grep 'monitor = eDP-1' "$TARGET" | grep -oP '\d+\.\d+$')

if [[ "$CURRENT_SCALE" == "1.0" ]]; then
    cp "$CONF_DIR/display-1.5x.conf" "$TARGET"
     notify-send -i /home/rylouth/Documents/download.svg "Display" "Normal mode"
else
    cp "$CONF_DIR/display-1x.conf" "$TARGET"
     notify-send -i /home/rylouth/Documents/download.svg "Display" "Gaming mode"
fi

hyprctl reload

# waiting until all changes are made
sleep 0.1

# re-applying wallpaper
swww img "$(cat ~/.local/state/quickshell/user/generated/wallpaper/path.txt)" --transition-type any

