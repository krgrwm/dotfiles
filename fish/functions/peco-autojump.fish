function peco-autojump-list
    z -l | perl -wnla -e '/^$/ || print $F[1]'
#    cat ~/.local/share/autojump/autojump.txt \
#    | sort -nr \
#    | perl -wnl -e '/^.*\s+(.*$)/ and print $1'
end

function base-fullpath
    perl -wnl -MFile::Basename -e 'printf("%-13s %s\n", basename($_), $_)'
end

function peco-autojump
    peco-autojump-list | base-fullpath | peco-fish \
    | perl -wnl -e '/^.*\s+(.*$)/ and print $1' \
    | read -l select
    cd $select
    and commandline -f execute
    and ls
    commandline -f repaint
end
