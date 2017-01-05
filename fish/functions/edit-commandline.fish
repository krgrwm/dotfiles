function edit-commandline
    set tmpf (mktemp --suffix=.fish)
    commandline -b > $tmpf
    eval $EDITOR $tmpf
    commandline -r (cat $tmpf)
    rm $tmpf
end
