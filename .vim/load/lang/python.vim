"Python
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,preview,longest
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal completeopt-=preview

" jedi web kara copipe
let g:jedi#auto_vim_configuration = 0

" force... だとスニペットの候補が出ないが,sourecs...だと
" jedi, ipython の補完がでない
" https://github.com/Shougo/neosnippet.vim/issues/198
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
"if !exists('g:neocomplete#sources#omni#input_patterns')
"        let g:neocomplete#sources#omni#input_patterns= {}
"endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
"let g:neocomplete#sources#omni#input_patterns.python = '\h\w*\|[^. \t]\.\w*'
autocmd FileType python setlocal completeopt-=preview

" For jedi and neocomplete
autocmd FileType python setlocal omnifunc=jedi#completions
" omni func 設定しなくても下のだけで保管がでる
" CompleteIPythonを設定すると無効化される
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"


" IPython
let g:ipy_completefunc = 'local'
" omnifunc は1つしか指定できない
"autocmd FileType python setlocal omnifunc=CompleteIPython
let g:ipy_status_out_console_color = 'Red'
let g:ipy_status_out_gui_color = 'Orange'
set splitbelow

" map
au FileType python nnoremap <silent> em :Unite ref/pydoc<cr>
au FileType python nnoremap <silent> ew :NeoComplCacheToggle<CR>
au FileType python setl autoindent
au FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
au FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
au FileType python let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

au FileType cs inoremap <C-Enter> <C-j>
au FileType cs imap <buffer> <CR> ;

" vim indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size= 1

"jedi map
nnoremap c <NOP>
let g:jedi#goto_assignments_command = "cg"
let g:jedi#goto_definitions_command = "cd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "cn"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "cr"
let g:jedi#show_call_signatures = "1"

" IPython map
" Send Text
" autocmd FileType python vnoremap <silent> <CR> :SlimeSend<CR>:SlimeSend1 os.popen('slime_all'); os.popen('touch /tmp/slime.py')<CR>
" autocmd FileType python nmap <silent> <CR> L<CR>
autocmd FileType python vmap <buffer> <silent> <CR> <Plug>(IPython-RunLines)
autocmd FileType python nmap <buffer> <silent> <CR> <Plug>(IPython-RunLine)
autocmd FileType python nmap <buffer> <silent> cra <Plug>(IPython-RunFile)

" Get Doc
" autocmd FileType python nnoremap CC :SlimeSend1 f=open('/tmp/slime.py', 'w'); f.write(<C-r><C-w>.__doc__); f.close()<CR>:silent !touch /tmp/slime.py<CR>:silent !slime_clear<CR>
autocmd FileType python nmap <buffer> <silent> CC <Plug>(IPython-OpenPyDoc)
" Get Doc in Browser
" autocmd FileType python nnoremap <Tab> :SlimeSend1 f=open('/tmp/slime_type.py', 'w'); f.write(str(type(<C-r><C-w>))); f.close()<CR>:silent !touch /tmp/slime_type.py<CR>:silent !slime_clear<CR>:!cat /tmp/slime_type.py<CR>

" reload file
set autoread
