function vip
    command ls --color | fzf-tmux --select-1 | read -l select
    test -n "$select"; and vim "$select"
end
