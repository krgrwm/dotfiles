function peco-tmux-panes
    set IFS '' # treat panes as lines, not array
    set -l panes (tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
    set -l current_pane (tmux display-message -p '#I:#P')
    set -l current_window (tmux display-message -p '#I')

    # optionの+optは-optの反転
    echo "$panes" | grep -v "$current_pane" | fzf +m --reverse | read -l target
    test -n "$target"; or return

    set -l target_window (echo $target | perl -wnlaF':|-' -e 'print $F[0]')
    set -l target_pane (echo $target | perl -wnlaF':|-' -e 'print $F[1]' | cut -c 1)

    if test $current_window -eq $target_window
        tmux select-pane -t {$target_window}.{$target_pane}
        and commandline -f repaint
    else
        tmux select-window -t $target_window
        and tmux select-pane -t {$target_window}.{$target_pane}
        and commandline -f repaint
    end
end
