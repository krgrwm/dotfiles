set completeopt=menuone,preview,longest
autocmd FileType julia setlocal completeopt-=preview


" let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'



autocmd FileType julia source ~/.vim/bundle/vim-ipython/ftplugin/python/ipy.vim

" IPython
let g:ipy_completefunc = 'local'
" omnifunc $B$O(B1$B$D$7$+;XDj$G$-$J$$(B
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
" Julia $B$N%I%-%e%a%s%H$O(B?word or help(word)$B$G(B
" $B%=!<%9%3!<%I$O(B @edit func(arg1, arg2, ...)$B$G(B
