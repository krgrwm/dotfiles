set -x TERM screen-256color

set -x EDITOR vim
set -x JULIA_EDITOR 'gvim --servername JULIA --remote-tab'
set -x BROWSER firefox
set -x PATH $HOME/bin $PATH

set -x PECO 'fzf'
set -x FZF_DEFAULT_OPTS "--ansi -m --reverse --inline-info"


[ -f ~/.fzf.zsh ] ;and source ~/.fzf.zsh


set -x RLWRAP_HOME $HOME/.rlwrap


set -x XDG_CACHE_HOME /tmp

# OPAM configuration
source /home/tsato/.opam/opam-init/init.fish > /dev/null 2> /dev/null ; or true

# autojump
begin
    set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

# from arch wiki
# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '!'
set __fish_git_prompt_char_stagedstate '>'
set __fish_git_prompt_char_stashstate '<'
set __fish_git_prompt_char_upstream_ahead '^'
set __fish_git_prompt_char_upstream_behind '$'


# alias
alias rm="mv -f --backup=numbered --target-directory ~/.Trash"
alias ..="cd .."
alias pdf="zathura"
alias vi="vim"
alias sudo="sudo "
alias mv="mv -i"
alias cp="cp -i"
alias mozc_dict="/usr/lib/mozc/mozc_tool --mode=dictionary_tool"
alias man="man_vim"

# for Dvorak
alias ls="ls --color -F"

alias lsa="ls -lah"
alias la="ls -ah"
alias l="ls -la"
alias ll="ls -l"

alias no="ls"

#alias je=cd
alias n=l
alias na=la
alias t=tmux
