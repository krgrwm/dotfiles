"Gauche
au FileType scheme :let is_gauche=1
au FileType scheme set complete+=k~/.vim/dict/gauche.dict
" S-expression fold
au FileType scheme nnoremap <buffer> zp zfab
au FileType scheme nnoremap <buffer> <silent> zP zE:g/ *(define/normal zf%zo<CR><C-o>zR
" move to outer "("
au FileType scheme nnoremap <buffer> <silent> fd hvab<ESC>`<
" move to outer ")"
au FileType scheme nnoremap <buffer> <silent> ff ])
" comment out to ")"
au FileType scheme nnoremap <buffer>
            \ fc vab%<ESC>i#\|<ESC>%a\|#<ESC>``l
au FileType scheme nnoremap <buffer> <silent> \ fC ?#\|<ESC>/(<ESC>vab<ESC>/\|#<ESC>xx`<?#\|<ESC>
au FileType scheme nnoremap <buffer> <silent> fs vab
au FileType scheme nnoremap s %
au FileType scheme inoremap [ +
au FileType scheme inoremap <CR> ?
au FileType scheme inoremap { !
au FileType scheme inoremap ! {
au FileType scheme nnoremap fe i(<ESC>Ea)<ESC>
au FileType scheme nnoremap fj i(<ESC>$a)<ESC>
au FileType scheme nnoremap fk ^i(<ESC>$a)<ESC>
au FileType scheme nnoremap ej o#\| \|#<ESC>hhi 
au FileType scheme nnoremap el i#\| \|#<ESC>hhi 
au FileType scheme nnoremap ek i#\|           \|#<ESC>bbli           
au FileType scheme nnoremap - {
au FileType scheme nnoremap = }
au FileType scheme nnoremap <Space> =
au FileType scheme nnoremap ez 
