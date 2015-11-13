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

autocmd FileType python setlocal completeopt-=preview

" For jedi and neocomplete
autocmd FileType python setlocal omnifunc=jedi#completions
" omni func 設定しなくても下のだけで保管がでる
" CompleteIPythonを設定すると無効化される
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#popup_select_first=0


" IPython
let g:ipy_completefunc = 'local'
" omnifunc は1つしか指定できない
"autocmd FileType python setlocal omnifunc=CompleteIPython
let g:ipy_status_out_console_color = 'Red'
let g:ipy_status_out_gui_color = 'Orange'
set splitbelow

" map
au FileType python inoremap <silent> <S-CR> <ESC>o
au FileType python inoremap <silent> <CR> <CR>
au FileType python nnoremap <silent> em :Unite ref/pydoc<cr>
au FileType python nnoremap <silent> ew :NeoComplCacheToggle<CR>
au FileType python setl autoindent
au FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
au FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
au FileType python let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

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
"let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures = "2"


" IPython map
" Send Text
" autocmd FileType python vnoremap <silent> <CR> :SlimeSend<CR>:SlimeSend1 os.popen('slime_all'); os.popen('touch /tmp/slime.py')<CR>
" autocmd FileType python nmap <silent> <CR> L<CR>
"autocmd FileType python vmap <buffer> <silent> <CR> <Plug>(IPython-RunLines)
autocmd FileType python vmap <buffer> <silent> <CR> :python3 run_these_lines()<CR>

" vaf Visual a function
" line
"autocmd FileType python nmap <buffer> <silent> <CR> <Plug>(IPython-RunLine)
autocmd FileType python nmap <buffer> <silent> <CR> :python3 run_this_line()<CR>
" function
autocmd FileType python nmap <buffer> <silent> <S-CR> vaf:python3 run_these_lines()<CR>
" indent (for)
autocmd FileType python nmap <buffer> <silent> <C-CR> vii:python3 run_these_lines()<CR>
autocmd FileType python nmap <buffer> <silent> cra :python3 run_this_file()<CR>

" Get Doc
" autocmd FileType python nnoremap CC :SlimeSend1 f=open('/tmp/slime.py', 'w'); f.write(<C-r><C-w>.__doc__); f.close()<CR>:silent !touch /tmp/slime.py<CR>:silent !slime_clear<CR>
autocmd FileType python nmap <buffer> <silent> CC <Plug>(IPython-OpenPyDoc)
" Get Doc in Browser
" autocmd FileType python nnoremap <Tab> :SlimeSend1 f=open('/tmp/slime_type.py', 'w'); f.write(str(type(<C-r><C-w>))); f.close()<CR>:silent !touch /tmp/slime_type.py<CR>:silent !slime_clear<CR>:!cat /tmp/slime_type.py<CR>

" reload file
set autoread



" watchdog

"if ! empty(neobundle#get("vim-watchdogs"))
""  let g:watchdogs_check_BufWritePost_enable = 1
""  let g:watchdogs_check_CursorHold_enable = 1
"  if !exists("g:quickrun_config")
"    let g:quickrun_config = {}
"  endif
"  let g:quickrun_config["watchdogs_checker/_"] = {
"  \ "outputter/quickfix/open_cmd" : "",
"  \ "runner/vimproc/updatetime" : 50,
"  \ "hook/qfsigns_update/enable_exit": 1,
"  \ "hook/qfsigns_update/priority_exit": 3,
"  \}
"  let s:flake8 = system('flake8 --version 2>/dev/null')
"  if s:flake8 != ""
"    let g:quickrun_config["python/watchdogs_checker"] = {
"    \ "type" : "watchdogs_checker/flake8"
"    \}
"  endif
"  call watchdogs#setup(g:quickrun_config)
"endif


" vim-flake8
"autocmd FileType python map <buffer> <C-n> :call Flake8()<CR>
"let g:flake8_show_in_file=1 
"autocmd BufWritePost *.py call Flake8()

" Khuno
autocmd FileType python nmap <buffer> <silent> .b :Khuno show<CR>
