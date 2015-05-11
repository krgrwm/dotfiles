
"Unite
nnoremap <silent> <C-e> :Unite file buffer file_mru junkfile<cr>
nnoremap <silent> eb :Unite buffer<cr>
nnoremap <silent> ep :Unite history/yank<cr>
nnoremap <silent> ef :Unite file<cr>
nnoremap <silent> ew :Unite -buffer-name=register register<cr>
nnoremap <silent> eq :Unite file_mru<cr>
nnoremap <silent> et :Unite tab<cr>
nnoremap <silent> ec :Unite command<cr>
nnoremap <silent> eg :Unite grep<cr>
nnoremap <silent> el :Unite line<cr>
nnoremap <silent> eo :Unite -no-quit -vertical -winwidth=50 outline<cr>
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

nnoremap <silent> .. :<C-u>Unite -buffer-name=search line/fast -start-insert -no-quit<CR>
