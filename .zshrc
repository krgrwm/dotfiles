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
setopt BRACE_CCL # echo test{a-d} $B$H$+$G$-$k(B
setopt no_beep

unsetopt sh_wordsplit

eval `dircolors -b $HOME/.dircolors`

export EDITOR=vim
export JULIA_EDITOR=gvim
export BROWSER=firefox
export PATH=$HOME/bin:$PATH
alias pyconda='/opt/anaconda/bin/python'
alias ipyconda='/opt/anaconda/bin/ipython'
alias anacondainit='export PATH=/opt/anaconda/bin:$PATH'

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

PECO='peco'
if [[ "$(uname)" == "FreeBSD" ]]; then
    export PATH=$HOME/.julia_dir/usr/bin:$PATH
    export LD_LIBRARY_PATH=/usr/local/lib/gcc48
    [[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
    PECO='/usr/local/bin/peco'
fi



READNULLCMD=less

export RLWRAP_HOME=$HOME/.rlwrap

source ~/.zsh/completion.zsh

# add fpaht
fpath=($HOME/.autojump/functions $ZSH/functions $ZSH/functions/zsh_users_comp $fpath)

# antigen
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



if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   zcompile ~/.zshrc
fi
