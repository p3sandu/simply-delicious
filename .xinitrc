#!/bin/sh

wm="dwm"

# xset r rate 200 20 &
# feh --bg-scale ~/Pictures/wallpapers/Fantasy-Landscape3.png
~/.local/bin/battery-alert.sh &

if [ -f "$HOME/.Xresources" ]; then
    xrdb -merge "$HOME/.Xresources"
fi

if [[ $wm == "i3" ]]; then
    exec i3
elif [[ $wm == "dwm" ]]; then
    xset r rate 200 30 &
    dunst &
    /usr/lib/xdg-desktop-portal-gtk &
    sleep 1
    /usr/lib/xdg-desktop-portal &
    lxpolkit &

    dwmblocks &
    # sxhkd &
    while true; do
        dwm >/dev/null 2>&1 || break
        sleep 1
    done
fi
