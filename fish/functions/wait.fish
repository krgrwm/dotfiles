function wait
    while true
        set -l no_jobs
        set -l all_jobs (get_jobs)
        or break

        for j in $argv
            if contains -- $j $all_jobs
                set -e no_jobs
                break
            end
        end

        if set -q no_jobs
            break
        end
    end
end
