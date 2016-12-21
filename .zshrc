ZSH=$HOME/.zsh
# export PATH=/home/hoge/.cabal/bin:$PATH
#export PYTHONPATH="$HOME/bin":$PYTHONPATH

export TERM=screen-256color

export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000

autoload -U compinit compinit
compinit -u

autoload -U promptinit
promptinit

autoload -U edit-command-line
zle -N edit-command-line

autoload -Uz zmv
autoload -Uz vcs_info

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
setopt no_beep

unsetopt sh_wordsplit

eval `dircolors -b $HOME/.dircolors`

export EDITOR=vim
export JULIA_EDITOR='gvim --servername JULIA --remote-tab'
export BROWSER=firefox
export PATH=$HOME/bin:$PATH
typeset -U path PATH
#alias pyconda='/opt/anaconda/bin/python'
#alias ipyconda='/opt/anaconda/bin/ipython'
#alias anacondainit='export PATH=/opt/anaconda/bin:$PATH'

PECO='peco'
if [[ "$(uname)" == "FreeBSD" ]]; then
    export LD_LIBRARY_PATH=/usr/local/lib/gcc48
    [[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
    PECO='/usr/local/bin/peco'
fi
PECO='fzf'
export FZF_DEFAULT_OPTS="--ansi -m --reverse --inline-info"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


READNULLCMD=less

export RLWRAP_HOME=$HOME/.rlwrap

# add fpath
fpath=($HOME/.autojump/functions $ZSH/functions $ZSH/functions/zsh_users_comp $fpath)
typeset -U path fpath

# antigen
# .zshrc yomikomigo ni source sinaito umaku ikanai ... ????
# mataha saido .zshrc wo yomikomu
if [[ -f ~/.zsh/antigen/antigen.zsh ]]; then
    source ~/.zsh/antigen/antigen.zsh
    antigen bundle zsh-users/zsh-syntax-highlighting
    antigen bundle zsh-users/zsh-completions
    antigen apply
fi


# load config files
source $ZSH/aliases.zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

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


source ~/.zsh/completion.zsh
source ~/.zsh/key-bindings.zsh

if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   zcompile ~/.zshrc
fi

# OPAM configuration
. /home/tsato/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
