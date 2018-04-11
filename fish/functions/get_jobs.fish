function get_jobs
    jobs | perl -wnlaF'\s' -e '$.!=1 and print $F[0]'
end

