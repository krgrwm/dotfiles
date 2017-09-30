function extract-autojump-dirs
    autojump-dirs | peco-fish-empty \
    | perl -wnl -e '/^.*\s+(.*$)/ and print $1' \
    | read -l select
    echo $select
end

function peco-autojump
    set -l select (extract-autojump-dirs)
    echo $select
    if test -z (commandline)
        test -z "$select"; or cd $select
        and commandline -f execute
        and ls
        commandline -f repaint
    else
        commandline -a $select
        commandline -f repaint
    end
end
