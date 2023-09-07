#!/bin/bash

while true
do
	xsetroot -name "$(date '+ %l:%M %p | %A %d %B | %F ')"
	sleep 1m
done &

# set this up as an s6 service when you can
(sleep 0.5 && /bin/pipewire) &
(sleep 0.6 && /bin/pipewire-pulse) &
(sleep 0.7 && pactl load-module module-switch-on-connect) &
(sleep 0.8 && /bin/wireplumber) &

# Set specific keyboard to swap left-alt with super key
#(sleep 2 && setxkbmap -device $(xinput list | grep -o -P 'Barcode\ Reader\ \ \ \ \ .{0,28}' | tail -c 4) -option altwin:swap_lalt_lwin) &
#(sleep 1 && setxkbmap -option caps:swapescape) &

# Set Default Wallpaper(changes later in multiconfig)
#(xwallpaper --tile /home/tradam/Pictures/Wallpapers/fabric-tile-2.png) &

# If multi Monitors Are Connected, Assign Accordingly followed by Compositor
#(~/.screenlayout/multiconfig.sh && picom) &

# Volume Systray (this prestarts?)
# (pasystray) &

# Network Systray
(nm-applet) &

# Automounter Systray
(udiskie -t) &

# Battery Systray
(cbatticon --critical-level 15 --low-level 25) &

# Hotkeys
#(xbindkeys) &

# Set brightness
#xbacklight -set 25 &

