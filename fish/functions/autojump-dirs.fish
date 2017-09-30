function autojump-list
    z -l | perl -wnla -e '/^$/ || print $F[1]'
#    cat ~/.local/share/autojump/autojump.txt \
#    | sort -nr \
#    | perl -wnl -e '/^.*\s+(.*$)/ and print $1'
end

function base-fullpath
    perl -wnl -MFile::Basename -e 'printf("%-13s %s\n", basename($_), $_)'
end

function autojump-dirs
    autojump-list | base-fullpath
end
