#!/bin/sh
#xrandr --output eDP-1 --primary --mode 3840x2160 --pos 4319x2160 --rotate normal --output DP-1 --off --output HDMI-1 --mode 3840x2160 --pos 0x0 --rotate normal --output DP-2 --mode 3840x2160 --pos 3840x0 --rotate normal --output HDMI-2 --off

xrandr --output eDP-1 --primary --mode 3840x2160 --pos 0x2160 --rotate normal --output DP-1 --off --output HDMI-1 --mode 3840x2160 --pos 0x0 --rotate normal --output DP-2 --mode 3840x2160 --pos 3840x0 --rotate normal --output HDMI-2 --off --output DP-1-1 --off --output DP-1-2 --off --output DP-1-3 --off --output DP-2-1 --off --output DP-2-2 --off --output DP-2-3 --off


bright
lightside
sed -i 's/background $base02/background $base2/g' ~/.config/i3/config
i3-msg reload 1> /dev/null
sed -i 's/background = #073642/background = #fdf6e3/g' ~/.config/polybar/config.ini
sed -i 's/background-alt = #002b36/background-alt = #eee8d4/g' ~/.config/polybar/config.ini
polybar-msg cmd restart

#nitrogen --set-scaled ~/Pictures/themer-wallpaper-burst-light-2880x1800.png
nitrogen restore
