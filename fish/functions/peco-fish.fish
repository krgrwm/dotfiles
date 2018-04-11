function peco-fish
    eval $PECO $argv --query (string join '' '\^' "(commandline)")
end
