nnoremap [Fold] <Nop>
nmap . [Fold]

" Fold {}
noremap <silent> [Fold]( k$/{$<CR>v%zf:noh<CR><ESC>
" Toggle Folded
noremap <silent> [Fold]) za
" Inc/Dec left fold column
noremap <silent> [Fold]fd :set foldcolumn+=1<CR>
noremap <silent> [Fold]fi :set foldcolumn+=-1<CR>
