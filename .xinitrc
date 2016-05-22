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


export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
export XMODIFIERS=@im=uim
export XIM=uim
/usr/local/bin/mozc start
uim-xim &
uim-toolbar-gtk &



exec i3 || exec awesome

#/usr/local/bin/mozc start

#exec openbox-session
#exec awesome
#exec ~/bin/stumpwm
#exec qtile
#exec mate-session
