# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh
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

zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

READNULLCMD=less

#eval "$(lesspipe.sh)"

export RLWRAP_HOME=$HOME/.rlwrap


source ~/.zsh/completion.zsh

# custom oh-my-zsh
# add fpaht
fpath=($ZSH/functions $ZSH/completions $fpath)

# antigen
if [[ -f ~/.zsh/antigen/antigen.zsh ]]; then
    source ~/.zsh/antigen/antigen.zsh
    antigen bundle zsh-users/zsh-syntax-highlighting
    antigen apply
fi

# load config files
for config_file ($ZSH/lib/*.zsh) source $config_file


eval `dircolors ~/.dircolors`
unsetopt sharehistory


export XDG_CACHE_HOME=/tmp

stty -ixon


unset GREP_OPTIONS

# zsh syntax highlight
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('%%' 'fg=cyan,bold,bg=cyan')

# load theme
source $ZSH/mytheme.zsh-theme

# directory stack
DIRSTACKSIZE=10
setopt AUTO_PUSHD



if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   zcompile ~/.zshrc
fi

