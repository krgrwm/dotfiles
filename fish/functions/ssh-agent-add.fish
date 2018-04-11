function ssh-agent-add
    eval (ssh-agent | perl -wnl -e 's/=/ /g; s/^/set -gx /g; print')
    and ssh-add
end
