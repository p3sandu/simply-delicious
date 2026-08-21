#!/bin/sh

wm="dwm"

~/.local/bin/battery-alert.sh &
#!/bin/sh
# BATTERY="BAT0"
# while true; do
#     capacity=$(cat /sys/class/power_supply/$BATTERY/capacity)
#     status=$(cat /sys/class/power_supply/$BATTERY/status)
#
#     if [ "$status" = "Discharging" ]; then
#         if [ "$capacity" -le 40 ]; then
#             notify-send -u normal "test" "battery is 40"
#             # speaker-test -l 1 -t sine -f 1000 >/dev/null 2>&1
#         elif [ "$capacity" -le 30 ]; then
#             notify-send -u critical "test" "battery is 30"
#         fi
#     elif [[ "$status" = "Charging" && "$capacity" -gt 78 ]]; then
#         notify-send -u normal "bro" "battery full so plug that shit off"
#     fi
#     sleep 60
# done

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
    # lxpolkit &

    dwmblocks &
    # sxhkd &
    while true; do
        dwm >/dev/null 2>&1 || break
        sleep 1
    done
fi
