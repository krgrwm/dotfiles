set completeopt=menuone,preview,longest
autocmd FileType julia setlocal completeopt-=preview


" let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'


" Slimux
autocmd FileType julia vmap <buffer> <silent> <CR> :SlimuxREPLSendSelection<CR>
autocmd FileType julia nmap <buffer> <silent> <CR> :SlimuxREPLSendLine<CR>
autocmd FileType julia nmap <buffer> <silent> <C-CR> :mark '<CR>vii:SlimuxREPLSendSelection<CR>''
"autocmd FileType julia nmap <buffer> <silent> <S-CR> ?function<CR>V%<CR><ESC>:noh<CR>
autocmd FileType julia nmap <buffer> <silent> <S-CR> :mark '<CR>vip<CR>''
autocmd FileType julia nmap <buffer> <silent> L :SlimuxSendKeysPrompt<CR><C-u>@edit\ <CR>Mv$<CR>

" IPython
" omnifunc $B$O(B1$B$D$7$+;XDj$G$-$J$$(B
"autocmd FileType julia setlocal omnifunc=CompleteIPython
set splitbelow

"autocmd FileType julia vmap <buffer> <silent> <CR> :python3 run_these_lines()<CR>
"autocmd FileType julia nmap <buffer> <silent> <CR> :python3 run_this_line()<CR>
"autocmd FileType julia nmap <buffer> <silent> <C-CR> vii:python3 run_these_lines()<CR>
"autocmd FileType julia nmap <buffer> <silent> <S-CR> ?function<CR>V%<CR><ESC>:noh<CR>
"autocmd FileType julia nmap <buffer> <silent> cra :python3 run_this_file()<CR>
"" autocmd FileType julia nmap <buffer> <silent> CC :python3 get_doc_buffer()<CR>

"autocmd FileType julia nnoremap <silent> CC :python3 send('?<C-r><C-w>)')<CR>
"autocmd FileType julia nnoremap CH :python send('edit(<C-r><C-w>)')<CR>

""""""""""
" Julia $B$N%I%-%e%a%s%H$O(B?word or help(word)$B$G(B
" $B%=!<%9%3!<%I$O(B @edit func(arg1, arg2, ...)$B$G(B
