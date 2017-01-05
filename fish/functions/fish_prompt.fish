function home2tilde
    pwd | perl -wnp -e 's/$ENV{"HOME"}/~/'
end

function shorten_path
    set -l path $argv[1]
    set path_max 58

    if test (string length $path) -gt $path_max
        echo $path | perl -wnl -e '''
        BEGIN{$/="/"; $MAX=7} ;
        $name=(length($_) > $MAX)?
        substr($_, 0, $MAX-1).".." : $_;
        printf $name . "/"
        '''
    else
        echo $path
    end
end

function error_glyph
    set -l status_copy $argv[1]
    set -l glyph " > "
    if test 0 -ne $status_copy
        set_color red
    else
        set_color green
    end
    echo $glyph
end

function fish_prompt
    set -l status_copy $status

    # date
    set_color brblue
    printf "[%s]" (date +"%H:%M")

    # git
    set_color normal
    printf '%s ' (__fish_git_prompt)
    set_color normal

    # pwd
    set_color bryellow
    printf " [%s]\n" (shorten_path (home2tilde))

    # >
    error_glyph $status_copy

end
