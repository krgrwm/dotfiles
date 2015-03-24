# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# export PATH=/home/krgr/.cabal/bin:$PATH
export PYTHONPATH=/home/krgr/bin:$PYTHONPATH

export TERM=screen-256color

export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000
eval `dircolors -b`

autoload -U compinit compinit
compinit -u

autoload -U promptinit
promptinit

autoload -U edit-command-line
zle -N edit-command-line

autoload -Uz zmv

setopt autopushd pushdminus pushdsilent pushdtohome
setopt autocd
setopt correct
setopt cdablevars
setopt ignoreeof
setopt extendedglob
setopt interactivecomments
setopt nobanghist
setopt noclobber
setopt histnostore
setopt histignoredups
setopt numericglobsort
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt SH_WORD_SPLIT
setopt nohup
setopt listpacked listtypes
setopt menucomplete
setopt banghist
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt BRACE_CCL # echo test{a-d} とかできる

unsetopt sh_wordsplit


export EDITOR=vim
export JULIA_EDITOR=gvim
export BROWSER=chromium
export PATH=/home/krgr/bin:$PATH
export PATH=/home/krgr/.gem/ruby/2.1.0/bin:$PATH

READNULLCMD=less

#eval "$(lesspipe.sh)"

export RLWRAP_HOME=$HOME/.rlwrap


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mytheme"


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

# zsh-syntax-highlighting ... cannot rebind error でる
# auto fu の後にするとうまく行く(多少干渉する)
# oh my zsh 先にやらないとoh my zsh の設定が反映されない
# この順番だとhightlight 効かない
#plugins=(git geeknote zsh-syntax-highlighting)


source ~/.zsh/completion.zsh
#source ~/.zsh/incr-0.2.zsh

source $ZSH/oh-my-zsh.sh


plugins=(git geeknote zsh-git-promptzsh-syntax-highlighting)


[[ -s /etc/profile.d/autojump.zsh ]] && source /etc/profile.d/autojump.zsh


eval `dircolors ~/.dircolors`
unsetopt sharehistory
# Customize to your needs...
# 


export XDG_CACHE_HOME=/tmp

stty -ixon



if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   zcompile ~/.zshrc
fi
unset GREP_OPTIONS

# pluginsに追加だと動かない
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('%%' 'fg=cyan,bold,bg=cyan')
