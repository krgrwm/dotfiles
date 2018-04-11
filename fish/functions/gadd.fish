function gadd
    git status --short | peco-fish | perl -wnlF'\s' -e 'print $F[$#F]' | read -laz select
    echo $select
    and git add $select
end
