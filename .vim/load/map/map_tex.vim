autocmd FileType tex noremap <buffer> <silent> <space>r :!compile_platex %<CR>
autocmd FileType tex noremap <buffer> <silent> <space>e :!compile_platex %<CR>:!pdf2eq %<CR>
