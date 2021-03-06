#!/usr/bin/env bash

icon="$HOME/.config/i3/icon.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -c 000000 -i "$tmpbg"; xset dpms force off

# i3lock -u -i "$tmpbg"
