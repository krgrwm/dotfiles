function peco-local-sheets
    set -l file "./.localsheets"
    test -f $file
    and get-snippets $file 0 | peco-select-snippets
end
