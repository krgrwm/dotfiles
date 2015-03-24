python << EOF
import sys
import vim

PYDIR="~/.vim/myscript/"

def pass_line(file):
    sys.argv[0] = vim.current.line
    vim.command("pyfile " + PYDIR + file)
    print(r)
EOF
