function peco-commands
    commands | peco-fish | read -l select
    test -n "$select"
    and commandline -r $select
    and commandline -f execute
end
