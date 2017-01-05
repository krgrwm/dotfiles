function peco-commands
    commands | peco-fish | read -l select
    commandline -r $select
    commandline -f execute
end
