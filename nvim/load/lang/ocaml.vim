"" Slimux
"autocmd FileType ocaml vmap <buffer> <silent> <CR> :SlimuxREPLSendSelection<CR>
"autocmd FileType ocaml nmap <buffer> <silent> <CR> :SlimuxREPLSendLine<CR>
"autocmd FileType ocaml nmap <buffer> <silent> <C-CR> :mark '<CR>vii:SlimuxREPLSendSelection<CR>''
"autocmd FileType ocaml nmap <buffer> <silent> <S-CR> :mark '<CR>vip<CR>''
"
"
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"
"set rtp^="/home/tsato/.opam/system/share/ocp-indent/vim"
"
"let g:syntastic_ocaml_checkers = ['merlin']
"
"if !exists('g:neocomplete#sources#omni#input_patterns')
"    let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#sources#omni#input_patterns.ocaml = '[^. *\t]\.\w*\|\h\w*|#'
