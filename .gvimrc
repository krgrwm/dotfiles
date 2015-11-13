set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guifont=Ricty\ 10
set background=light
set antialias
set wildmenu
set mousehide
set showtabline=2
set guioptions-=e
colorscheme wombat256mod

nnoremap <silent> ej :tabnext<cr>
let IM_vi_CooperativeMode=0

highlight FoldColumn  gui=bold    guifg=Cyan guibg=Black
highlight Folded      gui=italic  guifg=Cyan guibg=Black
highlight LineNr      gui=NONE    guifg=Gray guibg=Black

" au FileType julia set guifont=Monospace\ 9
au FileType julia set guifont=Inconsolata\ 11
au FileType python set guifont=Inconsolata\ 11
