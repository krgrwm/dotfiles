function list-dir
    find . -maxdepth 1 -type d  |  perl -wnl -e 'm:\./(\w+): and print $1'
end

function jee-once
    list-dir | eval $PECO -0 | read -l select
    if test -n "$select"
        cd "./$select"
        return 0
    end
    return 1
end

function jee
    while jee-once
    end
    ls
end
