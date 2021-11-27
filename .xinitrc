# if dwm exits 0, restart -- this allows hot reloading of config.h
xrdb -merge ~/.Xresources && exec bspwm
