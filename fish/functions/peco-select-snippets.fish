function peco-select-snippets
    set -l has_prefix $argv[1]
#    get-snippets $snippet_file $has_prefix \
    cat - \
    | peco-fish \
    | cut -d: -f2 \
    | read -l select
    and commandline -r $select
    commandline -f repaint
end
