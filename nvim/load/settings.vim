" dvorak
map  <PageDown>
nnoremap m w
nnoremap M W
nnoremap s c
map q q

"netrw
"let NERDTreeIgnore = ['\.class$', '\~$', '\.out$', '\.pyc$', '\.o$']
let g:netrw_liststyle = 3


"" Denite
call denite#custom#option('default', 'prompt', '>')
if executable('ag')
  call denite#custom#var('file_rec', 'command',
        \ ['ag'])
  call denite#custom#var('grep', 'command', ['ag'])
endif

nnoremap [Denite] <Nop>
nmap <Space>u [Denite]

nnoremap <silent> <C-o> :Denite file buffer file_mru junkfile<cr>
nnoremap <silent> [Denite]b :Denite buffer<cr>
nnoremap <silent> [Denite]p :Denite history/yank<cr>
nnoremap <silent> [Denite]f :Denite file<cr>
nnoremap <silent> [Denite]w :Denite -buffer-name=register register<cr>
nnoremap <silent> [Denite]q :Denite file_mru<cr>
nnoremap <silent> [Denite]c :Denite command<cr>
nnoremap <silent> [Denite]g :Denite -default-action=tabopen -no-quit grep<cr>
nnoremap <silent> [Denite]l :Denite line<cr>
nnoremap <silent> [Denite]o :Denite -no-quit -split=vertical -winwidth=50 outline<cr>
nnoremap <silent> [Denite]s :Denite neosnippet<cr>
nnoremap <silent> [Denite]y :Denite yankround<cr>

" 結果を再表示する
nnoremap <silent> [Denite]r :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')

" deniteの起動位置をtopに変更
call denite#custom#option('default', 'direction', 'top')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

"Snippet
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = '~/.config/nvim/snippets'

" Change current directory.
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction
nnoremap <silent> <Space>cd :<C-u>CD<CR>


"Airline
let g:airline#extensions#tabline#enabled = 1

"Quickfix
au QuickfixCmdPost make,grep,grepadd,vimgrep copen


"QuickRun
let g:quickrun_config = {}
let g:quickrun_config.gp = {'command' : 'plot'}
let g:quickrun_config = {
\   "make" : {
\       "command"   : "mingw32-make",
\       "exec" : "%c %o",
\       "outputter" : "error:buffer:quickfix",
\       "runner" : "vimproc",
\   },
\}

" easy-motion
let g:EasyMotion_keys='aoeusnth'
let g:EasyMotion_leader_key="'"
let g:EasyMotion_grouping=1
let g:EasyMotion_special_select_line = 0
let g:EasyMotion_special_select_phrase = 0

" indent_guides
let g:indent_guides_exclude_filetypes = ['man']

" junkfile
let g:junkfile#directory='/home/tsato/Documents/junkfile'
command! -nargs=0 JunkfileDay call junkfile#open_immediately(
\ strftime('%Y-%m-%d.junk'))


command! InsertTime 0r! date "+\%H:\%M:\%S "

" clever-f
let g:clever_f_smart_case=1
let g:clever_f_show_prompt=1
let g:clever_f_not_overwrites_standard_mappings=0

" rainbow parentheses
let g:rainbow_active = 1 

" yankround
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

" FastFold
let g:tex_fold_enabled=1


" vim-orgmode
let g:org_indent = 1

" Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_ignore_files=['\.tex$']


" neomake
autocmd! BufWritePost * Neomake "run Neomake on the current file on every write
let g:neomake_open_list = 2
let g:neomake_cpp_gcc_maker = {
            \ 'exe': 'clang',
            \ 'args': ['-std=c++11', '-Wall']
            \}
let g:neomake_cpp_enabled_makers = ['gcc']
let g:neomake_error_sign = {'text': 'E', 'texthl': 'Error'}
let g:neomake_warning_sign = {'text': 'W', 'texthl': 'Todo'}
let g:neomake_message_sign = {'text': 'M', 'texthl': 'Normal'}


" deoplete
let g:deoplete#enable_at_startup = 1

" deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

" vim-notes
let g:notes_directories = ['~/Documents/junkfile']
