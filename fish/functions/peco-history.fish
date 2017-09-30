function peco-history
    set num 150
    history -z | head -n $num | head -n $num | peco-fish --read0 | read -l -z select
    commandline -r "$select"
    commandline -f execute
end
