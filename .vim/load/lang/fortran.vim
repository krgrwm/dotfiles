" print memory 4byte
au FileType fortran noremap <C-o> /\v\=<CR>b:C x/wx &<C-r><C-w><CR>
" 8byte
au FileType fortran noremap <C-t> /\v\=<CR>b:C x/2wx &<C-r><C-w><CR>
