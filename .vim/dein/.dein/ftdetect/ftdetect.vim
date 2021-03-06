autocmd BufRead,BufNewFile *.fish setfiletype fish

" Detect fish scripts by the shebang line.
autocmd BufRead *
            \ if getline(1) =~# '\v^#!%(\f*/|/usr/bin/env\s*<)fish>' |
            \     setlocal filetype=fish |
            \ endif

" Move cursor to first empty line when using funced.
autocmd BufRead fish_funced_*_*.fish call search('^$')

" Fish histories are YAML documents.
autocmd BufRead,BufNewFile ~/.config/fish/fish_{read_,}history setfiletype yaml

" Universal variable storages should not be hand edited.
autocmd BufRead,BufNewFile ~/.config/fish/fishd.* setlocal readonly

" Mimic `funced` when manually creating functions.
autocmd BufNewFile ~/.config/fish/functions/*.fish
            \ call append(0, ['function '.expand('%:t:r'),
                             \'',
                             \'end']) |
            \ 2
if v:version < 704
  " NOTE: this line fixes an issue with the default system-wide lisp ftplugin
  "       which didn't define b:undo_ftplugin on older Vim versions
  "       (*.jl files are recognized as lisp)
  autocmd BufRead,BufNewFile *.jl    let b:undo_ftplugin = "setlocal comments< define< formatoptions< iskeyword< lisp<"
endif

autocmd BufRead,BufNewFile *.jl      set filetype=julia

autocmd BufEnter *                   call LaTeXtoUnicode#Refresh()
autocmd FileType *                   call LaTeXtoUnicode#Refresh()

autocmd VimEnter *                    call LaTeXtoUnicode#Init()

" This autocommand is used to postpone the first initialization of LaTeXtoUnicode as much as possible,
" by calling LaTeXtoUnicode#SetTab amd LaTeXtoUnicode#SetAutoSub only at InsertEnter or later
augroup L2UInit
  autocmd InsertEnter *                   let g:did_insert_enter = 1 | call LaTeXtoUnicode#Init(0)
augroup END
autocmd BufNewFile,BufRead *.org setfiletype org
"autocmd BufNewFile,BufReadPost org:todo* setfiletype orgtodo
" Detect syntax file.
autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=neosnippet
" Detect syntax file.
autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=neosnippet
