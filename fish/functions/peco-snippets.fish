function get-peco-snippet
    grep "" ~/.sheets/* \
    # filepath:snippet -> basename:snippet \
    | perl -MFile::Basename -wnl -e '/(^.*?):(.*$)/ and print basename($1), ": ", $2' \
    | peco-fish \
    # print snippet without comment \
    | perl -wnl -e '/(^.*?): (.*)#(.*$)/ and print $2'
end

function peco-snippets
    get-peco-snippet | read -l select
    and commandline -r $select
    commandline -f repaint
end
