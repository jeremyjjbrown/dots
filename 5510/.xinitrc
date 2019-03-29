# set Caps to Esc
/usr/bin/xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
# setxkbmap -layout us -option caps:escape

# Disable DPMS and prevent screen from blanking
xset s off -dpms

# exec i3
exec startxfce4
