#!/bin/bash
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

export XIM_ARGS="--xim"
export XMODIFIERS="@im=fcit"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'

#exec openbox-session
exec awesome
#exec ~/bin/stumpwm
#exec qtile
