set completeopt=menuone,preview,longest
autocmd FileType julia setlocal completeopt-=preview


" let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'


" Slimux
autocmd FileType julia vmap <buffer> <silent> <CR> :SlimuxREPLSendSelection<CR>
autocmd FileType julia nmap <buffer> <silent> <CR> :SlimuxREPLSendLine<CR>
autocmd FileType julia nmap <buffer> <silent> <C-CR> vii:SlimuxREPLSendSelection<CR>
autocmd FileType julia nmap <buffer> <silent> <S-CR> ?function<CR>V%<CR><ESC>:noh<CR>

autocmd FileType julia source ~/.vim/bundle/vim-ipython/ftplugin/python/ipy.vim

" IPython
let g:ipy_completefunc = 'local'
" omnifunc は1つしか指定できない
"autocmd FileType julia setlocal omnifunc=CompleteIPython
let g:ipy_status_out_console_color = 'Red'
let g:ipy_status_out_gui_color = 'Orange'
set splitbelow

"autocmd FileType julia vmap <buffer> <silent> <CR> :python3 run_these_lines()<CR>
"autocmd FileType julia nmap <buffer> <silent> <CR> :python3 run_this_line()<CR>
"autocmd FileType julia nmap <buffer> <silent> <C-CR> vii:python3 run_these_lines()<CR>
"autocmd FileType julia nmap <buffer> <silent> <S-CR> ?function<CR>V%<CR><ESC>:noh<CR>
"autocmd FileType julia nmap <buffer> <silent> cra :python3 run_this_file()<CR>
"" autocmd FileType julia nmap <buffer> <silent> CC :python3 get_doc_buffer()<CR>

autocmd FileType julia nnoremap <silent> CC :python3 send('?<C-r><C-w>)')<CR>
autocmd FileType julia nnoremap CH :python send('edit(<C-r><C-w>)')<CR>

""""""""""
" Julia のドキュメントは?word or help(word)で
" ソースコードは @edit func(arg1, arg2, ...)で
