set nu

set runtimepath+=~/.vim/after/syntax
set t_Co=256
"set shellcmdflag=-ic

set encoding=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,default,latin


colorscheme wombat256mod
set background=light

language C


" Set a nicer foldtext function
set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      endif
    endif
  endif
  let n = v:foldend - v:foldstart + 1
  let info = " " . n . " lines"
  let sub = sub . "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  "let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  "return sub . info
  return sub
endfunction

filetype off



filetype plugin indent on


autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

set nocompatible
set clipboard=unnamed
set laststatus=2
set statusline=%F%m%r%h%w\=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
set expandtab
set tabstop=4
set shiftwidth=4
set list
set autowrite
set backupdir=$HOME/.vimbackup
set directory=$HOME/.vimbackup
set ignorecase
set smartcase
set nowrapscan
set autoindent
set showmatch
set hlsearch
set smartindent
set incsearch
set winwidth=50
set winheight=10
set foldcolumn=1

let maplocalleader = "'"


syntax on
filetype plugin indent on
set cursorline
"highlight CursorLine term=reverse cterm=reverse
set cursorcolumn
"highlight CursorColumn ctermfg=lightgrey cterm=reverse
hi SpellBad ctermbg=darkgray ctermfg=black


"SLIM
let g:slime_no_mappings=1
let g:slime_python_ipython=1
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "slime", "target_pane": "0"}
set autoread

source $VIMRUNTIME/macros/matchit.vim
