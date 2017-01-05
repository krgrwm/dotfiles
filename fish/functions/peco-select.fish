function peco-select
    command ls | peco-fish-empty | tr -d '\r' | read -l select
    and commandline -i $select
    commandline -f repaint
end
