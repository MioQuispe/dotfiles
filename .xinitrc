xset r rate 200 40 &
setxkbmap -layout custom -variant cz_sk_de &
compton --vsync opengl &
copyq &
pulseaudio --start &
xrdb -load ~/.Xresources &
xsetroot -cursor_name left_ptr &
exec i3
