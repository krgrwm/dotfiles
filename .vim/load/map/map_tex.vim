autocmd FileType tex noremap <buffer> <silent> <space>e :!compile_platex %<CR>:!pdf2eq %<CR>
"autocmd FileType tex noremap <buffer> <silent> <space>r :!compile_platex %<CR>:!echo 'reload' > /tmp/llpp.remote <CR>
autocmd FileType tex noremap <buffer> <silent> <space>r :VimtexCompileSS<CR>:!echo 'reload' > /tmp/llpp.remote <CR>

" for clever-f
autocmd FileType tex nunmap <buffer> tse
autocmd FileType tex nunmap <buffer> tsd
