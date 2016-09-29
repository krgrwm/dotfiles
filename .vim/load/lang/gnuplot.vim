" Slimux
autocmd FileType gnuplot vmap <buffer> <silent> <CR> :SlimuxREPLSendSelection<CR>
autocmd FileType gnuplot nmap <buffer> <silent> <CR> :SlimuxREPLSendLine<CR>
autocmd FileType gnuplot nmap <buffer> <silent> <C-CR> :mark '<CR>vii:SlimuxREPLSendSelection<CR>''
