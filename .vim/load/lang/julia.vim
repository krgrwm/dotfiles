set completeopt=menuone,preview,longest
autocmd FileType julia setlocal completeopt-=preview


" let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'



autocmd FileType julia source ~/.vim/bundle/vim-ipython/ftplugin/python/ipy.vim

" IPython
let g:ipy_completefunc = 'local'
" omnifunc は1つしか指定できない
"autocmd FileType julia setlocal omnifunc=CompleteIPython
let g:ipy_status_out_console_color = 'Red'
let g:ipy_status_out_gui_color = 'Orange'
set splitbelow

autocmd FileType julia vmap <buffer> <silent> <CR> <Plug>(IPython-RunLines)
autocmd FileType julia nmap <buffer> <silent> <CR> <Plug>(IPython-RunLine)
autocmd FileType julia nmap <buffer> <silent> ee ?function<CR>L%<CR>
autocmd FileType julia nmap <buffer> <silent> cra <Plug>(IPython-RunFile)
autocmd FileType julia nmap <buffer> <silent> CC <Plug>(IPython-OpenPyDoc)

autocmd FileType julia nnoremap <silent> K :python send('help(<C-r><C-w>)')<CR>
autocmd FileType julia nnoremap CH :python send('edit(<C-r><C-w>)')<CR>

""""""""""
" Julia のドキュメントは?word or help(word)で
" ソースコードは @edit func(arg1, arg2, ...)で
