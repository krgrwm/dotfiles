!/bin/bash
export BROWSER=firefox
#export DE=openbox

beepoff

# Dbus fix
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

# Gtk themes 
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

xmodmap $HOME/.Xmodmap
export XDG_CACHE_HOME=/tmp


export XIM=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=xim
export XMODIFIERS=@im=fcitx
export XIM_PROGRAM="fcitx"

fcitx -r -d

exec i3 || exec awesome
    
#exec openbox-session
#exec awesome
#exec ~/bin/stumpwm
#exec qtile
#exec mate-session
