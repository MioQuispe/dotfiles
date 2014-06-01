xset r rate 200 40 &
setxkbmap -layout custom -variant cz_sk_de &
xrdb -load ~/.Xresources &
xset s noblank &
xset s off &

# case $1 in
# i3)
#     compton --vsync opengl &
#     copyq &
#     pulseaudio --start &
#     xsetroot -cursor_name left_ptr &
#     ;;
# esac

exec $1
