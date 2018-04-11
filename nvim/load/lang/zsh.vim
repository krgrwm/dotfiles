" Slimux
autocmd FileType zsh vmap <buffer> <silent> <CR> :SlimuxREPLSendSelection<CR>
autocmd FileType zsh nmap <buffer> <silent> <CR> :SlimuxREPLSendLine<CR>
autocmd FileType zsh nmap <buffer> <silent> <C-CR> :mark '<CR>vii:SlimuxREPLSendSelection<CR>''
"autocmd FileType julia nmap <buffer> <silent> <S-CR> ?function<CR>V%<CR><ESC>:noh<CR>
autocmd FileType zsh nmap <buffer> <silent> <S-CR> :mark '<CR>vip<CR>''
