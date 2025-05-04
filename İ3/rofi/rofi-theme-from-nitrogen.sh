#!/bin/bash

WALLPAPER=$(grep '^file=' ~/.config/nitrogen/bg-saved.cfg | cut -d'=' -f2)

if [[ ! -f "$WALLPAPER" ]]; then
    exit 1
fi

wal -i "$WALLPAPER" > /dev/null

BACKGROUND=$(sed -n '1p' ~/.cache/wal/colors)
FOREGROUND=$(sed -n '8p' ~/.cache/wal/colors)
ACCENT=$(sed -n '2p' ~/.cache/wal/colors)

cat > "$ROFI_CONFIG" <<EOF
* {
    background-color: $BACKGROUND;
    foreground: $FOREGROUND;
    selected-background: $ACCENT;
    active-background: $ACCENT;
    urgent-background: $ACCENT;
    bordercolor: $ACCENT;
}

#window {
    background-color: $BACKGROUND;
    border:           3;
    border-radius:    6;
    border-color:     $ACCENT;
    padding:          15;
}

#listview {
    fixed-height: 0;
    border:       0px;
    border-color: $ACCENT;
    spacing:      2px ;
    scrollbar:    false;
    padding:      2px 0px 0px ;
}

#element {
    border:  0;
    padding: 3px ;
}

#element.normal.normal {
    background-color: $BACKGROUND;
    text-color:       $FOREGROUND;
}

#element.normal.active {
    background-color: $ACCENT;
    text-color:       $FOREGROUND;
}

#element.selected.normal {
    background-color: $ACCENT;
    text-color:       $FOREGROUND;
}

#scrollbar {
    width:        2px ;
    border:       0;
    handle-width: 8px ;
    padding:      0;
}

#inputbar {
    spacing:    0;
    text-color: $FOREGROUND;
    padding:    1px ;
}
EOF

echo "Rofi teması güncellendi: $ROFI_CONFIG"
