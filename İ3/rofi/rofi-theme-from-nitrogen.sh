#!/bin/bash

WALLPAPER=$(grep '^file=' ~/.config/nitrogen/bg-saved.cfg | cut -d'=' -f2)

if [[ ! -f "$WALLPAPER" ]]; then
    exit 1
fi

wal -i "$WALLPAPER" > /dev/null

BACKGROUND=$(sed -n '1p' ~/.cache/wal/colors)
FOREGROUND=$(sed -n '8p' ~/.cache/wal/colors)
ACCENT=$(sed -n '2p' ~/.cache/wal/colors)

ROFI_CONFIG="$HOME/.config/rofi/colors-wall.rasi"

cat > "$ROFI_CONFIG" <<EOF
* {
    background-color: $BACKGROUND;
    foreground: $FOREGROUND;
    selected-background: $ACCENT;
    active-background: $ACCENT;
    urgent-background: $ACCENT;
    bordercolor: $ACCENT;
}
EOF