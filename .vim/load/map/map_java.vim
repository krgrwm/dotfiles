
"Java
au FileType java inoremap <C-Enter> <C-j>
au FileType java imap <buffer> <CR> ;

au FileType java :setlocal omnifunc=javacomplete#Complete
au FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo
