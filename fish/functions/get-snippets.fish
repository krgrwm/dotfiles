function get-snippets
    set -l snippet_file $argv[1]
    set -l with_filename $argv[2]
    set prefix ""
    if test $with_filename -eq 1
        set prefix (basename $snippet_file):
    end
    grep "" $snippet_file | perl -wnlp -e "s/^/$prefix/"
    # filepath:snippet -> basename:snippet #\
#    | perl -MFile::Basename -wnl -e '/(^.*?):(.*$)/ and print basename($1), ": ", $2'
#    | peco-fish \
#    # print snippet without comment \
#    | perl -wnl -e '/(^.*?): (.*)#(.*$)/ and print $2'
end
