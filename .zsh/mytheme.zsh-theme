pwd_tilda()
{
#    pwd | perl -wnp -e 's/^$ENV{HOME}/~/g'
    echo ${PWD/$HOME/"~"}
}

path_short()
{
    WIDE_LENGTH=58
    C=$(cat)
    if [[ $#C -gt $WIDE_LENGTH ]]; then
        echo $C | 
        perl -wnl -e 'BEGIN{$/="/"; $MAX=7}; $name=(length($_) > $MAX)? substr($_, 0, $MAX-1)."‥" : $_; printf $name . "/"'
    else
        echo $C
    fi
}

path_color()
{
    cat - | perl -wn -e '
        BEGIN
        {
            $/="/"; 
#            @c=("37", "31", "33", "36", "32", "35");
            @c=("0;33", "1;33");
            $fg1="\033["; $fg2="m"; $reset=$fg1."0".$fg2
        }; 
        printf $fg1 . $c[($.-1) % @c] . $fg2 . $_ . $reset
        '
}

prompt_pwd()
{
    echo $(pwd_tilda | path_short | path_color | head -n 1) ""
}

PROMPT="%{$fg[blue]%}[%T]%{$reset_color%}%{$fg[yellow]%} ["'$(prompt_pwd)'"$(git_prompt_info)] %{$reset_color%}
%(?.%{${fg[green]}%}.%{${fg[red]}%}) > %{$fg[red]%}%{$reset_color%}"

RPS1='%{$fg[blue]%}%n@%M%{$reset_color%} '
#RPS1='%{$fg[green]%}%{$fg[normal]%}%2~$(git_prompt_info) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" (%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ⚡%{$fg[yellow]%}"
