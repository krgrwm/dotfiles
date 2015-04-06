# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'

#alias g='grep -in'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias sl=ls # often screw this up

alias afind='ack-grep -il'

# Custom Alias
# Set up auto extension stuff
alias -s html=$BROWSER
alias -s org=$BROWSER
alias -s php=$BROWSER
alias -s com=$BROWSER
alias -s net=$BROWSER
alias -s sxw=soffice
alias -s gz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s java=$EDITOR
alias -s txt=$EDITOR
alias -s PKGBUILD=$EDITOR

#ttytter
alias ttytter='rlwrap ttytter'


# Normal aliases
alias rm='mv -f --backup=numbered --target-directory ~/.Trash'
alias h='htop'
alias ls='ls --color -F'
alias a=ls
alias lls='ls --color -F'
alias lss='ls --color -F'
alias lsl='ls --color -F'
alias lss='ls --color -F'
alias sls='ls --color -F'
alias slls='ls --color -F'
alias slss='ls --color -F'
alias lsll='ls --color -F'
alias lsd='ls -ld *(-/DN)'
alias lsa='ls -ld .*'
alias f='find |grep'
alias c="clear"
alias dir='ls -1'
alias gvim='gvim -geom 82x35'
alias ..='cd ..'
alias nicotine='/home/paul/downloads/nicotine-1.0.8rc1/nicotine'
alias ppp-on='sudo /usr/sbin/ppp-on'
alias ppp-off='sudo /usr/sbin/ppp-off'
alias firestarter='sudo su -c firestarter'
alias mpg123='mpg123 -o oss'
alias mpg321='mpg123 -o oss'
alias vba='/home/paul/downloads/VisualBoyAdvance -f 4'
alias hist="grep '$1' /home/paul/.zsh_history"
alias irssi="irssi -c irc.freenode.net -n yyz"
alias mem="free -m"
alias msn="tmsnc -l hutchy@subdimension.com"
alias gosh='rlwrap -c -q \" -b "" -m gosh'
alias esi='rlwrap esi'
alias packer='packer-color'

alias pdf='evince'
alias vi='vim'
alias office='libreoffice'
alias l='ls -l'
alias la='ls -al'
alias uml='violet'
alias sl='ls'
alias less='less -R'
alias more='less'
alias sudo='sudo '
alias zmv='noglob zmv -W'
alias mv='mv -i'
alias mkdir=mkdir
alias cp='cp -i'
alias v='vi -m -R'
alias mozc_dict='/usr/lib/mozc/mozc_tool --mode=dictionary_tool'
alias packer='packer-color'

# for Dvorak
alias no='ls -F'
alias je=cd
alias n=l
alias na=la
alias h=j
alias t=tmux
alias kc=vi


# CD Rip
alias rip='abcde -o vorbis:"-q5"'

alias -s txt=less
alias -s dat=less
alias -s pdf=evince
alias -s ps=zathura
alias -s png=mirage
alias -s jpg=mirage
alias -s jpeg=mirage
alias -s JPG=mirage
alias -s odt=less
alias -s swf=swfdec-player
alias -s ogg=gst123
alias -s mp3=gst123

 # Pacman alias examples
 alias pacupg='sudo pacman -Syu'        # Synchronize with repositories and then upgrade packages that are out of date on the local system.
 alias pacin='sudo pacman -S'           # Install specific package(s) from the repositories
 alias pacins='sudo pacman -U'          # Install specific package not from the repositories but from a file 
 alias pacre='sudo pacman -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
 alias pacrem='sudo pacman -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
 alias pacrep='pacman -Si'              # Display information about a given package in the repositories
 alias pacreps='pacman -Ss'             # Search for package(s) in the repositories
 alias pacloc='pacman -Qi'              # Display information about a given package in the local database
 alias paclocs='pacman -Qs'             # Search for package(s) in the local database

 # Additional pacman alias examples
 alias pacupd='sudo pacman -Sy && sudo abs'     # Update and refresh the local package and ABS databases against repositories
 alias pacinsd='sudo pacman -S --asdeps'        # Install given package(s) as dependencies of another package
 alias pacmir='sudo pacman -Syy'                # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
 

# Global Aliases
alias -g Ic='| xsel -i -b'
alias -g Ig='| ag'
alias -g Ip='| pecorun '
alias -g In='&> /dev/null'
