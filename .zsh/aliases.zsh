# FreeBSD commands to coreutils
if [[ "$(uname)" == "FreeBSD" ]]; then
    LS="gls"
    MV="gmv"
    RM="grm"
    CP="gcp"
    alias xargs="gxargs"
    alias find="gfind"
    alias gcc="gcc48"
    alias gfortran="gfortran48"
    alias julia="julia --color=yes"
fi


# Basic directory operations
alias ...="cd ../.."

# Show history
alias history='fc -l 1'


# Custom Alias
# Set up auto extension stuff
alias -s html=$BROWSER
alias -s gz="tar -xzvf"
alias -s bz2="tar -xjvf"
alias -s java=$EDITOR
alias -s txt=$EDITOR
alias -s PKGBUILD=$EDITOR


# Noramal aliases
alias rm="$MV -f --backup=numbered --target-directory ~/.Trash"

alias gvim="gvim -geom 82x35"
alias ..="cd .."
alias mpg123="mpg123 -o oss"
alias mpg321="mpg123 -o oss"
alias packer="packer-color"

alias pdf="zathura"
alias vi="vim"
alias office="libreoffice"
alias less="less -R"
alias more="less"
alias sudo="sudo "
alias zmv="noglob zmv -W"
alias mv="$MV -i"
alias mkdir=mkdir
alias cp="$CP -i"
alias v="vi -m -R"
alias mozc_dict="/usr/lib/mozc/mozc_tool --mode=dictionary_tool"
alias man="man_vim"

# for Dvorak
alias ls="$LS --color -F"

alias lsa="ls -lah"
alias la="ls -ah"
alias l="ls -la"
alias ll="ls -l"
alias sl=$LS # often screw this up

alias no="ls"

alias je=cd
alias n=l
alias na=la
alias h=j
alias t=tmux
alias kc=vi
alias android-mount="go-mtpfs"
alias android-unmount="fusermount -u"


# CD Rip
alias rip="abcde -o vorbis:"-q5""

alias -s txt=less
alias -s dat=less
alias -s pdf=zathura
alias -s ps=zathura
alias -s png=mirage
alias -s jpg=mirage
alias -s jpeg=mirage
alias -s JPG=mirage
alias -s odt=less
alias -s swf=swfdec-player
alias -s ogg=gst123
alias -s mp3=gst123


# Global Aliases
alias -g Ic="| xsel -i -b"
alias -g Ig="| ag"
alias -g Ip="| pecorun "
alias -g In="&> /dev/null"


alias -g Iv="| vim_RO"
