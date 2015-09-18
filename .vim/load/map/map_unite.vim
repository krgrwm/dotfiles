
"Unite


nnoremap [Unite] <Nop>
nmap <Space>u [Unite]

nnoremap <silent> <C-e> :Unite file buffer file_mru junkfile<cr>
nnoremap <silent> [Unite]b :Unite buffer<cr>
nnoremap <silent> [Unite]p :Unite history/yank<cr>
nnoremap <silent> [Unite]f :Unite file<cr>
nnoremap <silent> [Unite]w :Unite -buffer-name=register register<cr>
nnoremap <silent> [Unite]q :Unite file_mru<cr>
nnoremap <silent> [Unite]t :Unite tab<cr>
nnoremap <silent> [Unite]c :Unite command<cr>
nnoremap <silent> [Unite]g :Unite grep<cr>
nnoremap <silent> [Unite]l :Unite line<cr>
nnoremap <silent> [Unite]o :Unite -no-quit -vertical -winwidth=50 outline<cr>
nnoremap <silent> [Unite]s :Unite neosnippet<cr>
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

"nnoremap <silent> .. :<C-u>Unite -buffer-name=search line/fast -start-insert -no-quit<CR>
