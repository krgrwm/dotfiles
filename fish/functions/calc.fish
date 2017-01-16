function calc
    set -l import 'from math import *'
    set -l expr $argv[1]
    python -c "$import; print($expr)"
end
