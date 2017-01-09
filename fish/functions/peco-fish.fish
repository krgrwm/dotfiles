function peco-fish
    eval $PECO --query (string join '' '\^' "(commandline)")
end
