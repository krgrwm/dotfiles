function peco-history
    set num 150
    history | head -n $num | head -n $num | peco-fish | read -l select
    commandline -r "$select"
    commandline -f execute
end
