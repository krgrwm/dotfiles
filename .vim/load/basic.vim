set nu

set runtimepath+=~/.vim/after/syntax
set t_Co=256
"set shellcmdflag=-ic

set encoding=utf-8
set fenc=utf-8
set fileencodings=utf-8,cp932,euc-jp,default,latin


colorscheme wombat256mod
set background=light

language C



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

" :SyntaxInfo
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()
