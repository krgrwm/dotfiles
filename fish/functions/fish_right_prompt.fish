function user-hostname
    printf "%s@%s  " $USER (hostname)
end

function fish_right_prompt
    set_color brblue
    if test "$CMD_DURATION" -gt 250
        set -l duration (echo $CMD_DURATION | humanize_duration)
        echo "($duration)" (user-hostname)
    else
        user-hostname
    end
end
