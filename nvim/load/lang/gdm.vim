autocmd FileType julia vmap <buffer> <silent> <CR> :SlimuxREPLSendSelection<CR>
autocmd FileType julia nmap <buffer> <silent> <CR> :SlimuxREPLSendLine<CR>
autocmd FileType julia nmap <buffer> <silent> <C-CR> :mark '<CR>vii:SlimuxREPLSendSelection<CR>''
"autocmd FileType julia nmap <buffer> <silent> <S-CR> ?function<CR>V%<CR><ESC>:noh<CR>
autocmd FileType julia nmap <buffer> <silent> <S-CR> :mark '<CR>vip<CR>''
