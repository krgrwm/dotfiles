function fish_user_key_bindings
    set -g fish_user_key_bindings fish_emacs_key_bindgs
    bind \cu forward-char

    bind \co\co peco-snippets
    bind \cj subs-snippet
    bind \co\cn peco-commands
    bind \co\cr peco-history
    bind \co\cM peco-autojump
    bind \co\cs peco-select
    # tmux のバインドに移した
#    bind \co\cb peco-tmux-panes
    bind \cv edit-commandline

    bind [ backward-word
    bind ] forward-word
    bind \cf kill-word
    bind \cr accept-autosuggestion execute
end
