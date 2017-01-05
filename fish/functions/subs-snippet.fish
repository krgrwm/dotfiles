function get-cursor-pos
    set -x marker $argv[1]
    set -x line $argv[2]

    echo $line | perl -wnl -e '/$ENV{marker}/g and print pos'
end

function delete-first-marker
    set -x marker $argv[1]
    set -x line $argv[2]

    echo $line | perl -wnl -e 's/$ENV{"marker"}// and print'
end

function subs-snippet
    set line (commandline -b)
    set -x marker "%%"
    set mlen (string length $marker)
    set pos (get-cursor-pos $marker $line)
    if test 0 -ne (count $pos)
        commandline -r (delete-first-marker $marker $line)
        commandline -C (math $pos - $mlen)
    end
end
