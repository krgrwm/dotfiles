autocmd FileType typescript nnoremap <c-]> :ALEGoToDefinition<cr>
autocmd FileType typescript nnoremap <C-t>r :ALEFindReferences<cr>
autocmd FileType typescript nnoremap <c-t>h :ALEHover<cr>

" Slimux
autocmd FileType typescript vmap <buffer> <silent> <cr> :SlimuxREPLSendSelection<CR>
autocmd FileType typescript nmap <buffer> <silent> <cr> :SlimuxREPLSendLine<CR>
"autocmd FileType typescript nmap <buffer> <silent> <S-CR> ?function<CR>V%<CR><ESC>:noh<CR>
autocmd FileType typescript nmap <buffer> <silent> <C-l> :mark '<CR>vip<CR>''
