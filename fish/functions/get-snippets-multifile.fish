function get-snippets-multifile
    set -l prefix $argv[1]
    set -l files $argv[2..(count $argv)]
    for f in $files
        get-snippets $f $prefix
    end
end
