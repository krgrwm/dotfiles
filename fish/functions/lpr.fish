

function dest-list
    lpstat -p | perl -wnla -e 'print $F[1]'
end

function lpr-options
    function options
        set -l printer $argv[1]
        lpoptions -p $printer -l
    end

    function opt-string
        set -l optlist (echo $argv[1] | perl -wnl -e 's/:/\n/g and print')
        set -l optname (echo $optlist[1] | perl -wnlaF'/' -e 'print $F[0]')
        # trim spaces and convert space to newline
        echo $optlist[2] \
        | perl -wnl -e 's/ *(.*?) *$/$1/ and s/ /\n/g and print' \
        | fzf | read -l opt
        test -n "$opt"; and echo "-o $optname=$opt"
    end

    function select-opts
        set -l printer $argv[1]
        options $printer | fzf | read -l selected_opt
        if test -n "$selected_opt"
            opt-string $selected_opt | read -l opt
            if test -n "$opt"
                echo $opt
                return 0
            else
                return 1
            end
        else
            return 1
        end
    end

    set -l printer $argv[1]

    while select-opts $printer;;end

#    options $printer | opt-list Duplex | fzf | read -l duplex
end

function lpr
    dest-list | fzf | read -l printer
    test -n "$printer"
    and lpr-options $printer | perl -wne 's/\n/ /; print' | read -l lpr_options
    and commandline -r "lpr -P $printer $lpr_options"
end
