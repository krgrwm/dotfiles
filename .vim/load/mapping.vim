nnoremap / /\v
nmap  <C-c> dw

noremap <silent> <C-Right> <ENTER>

"Gundo
nnoremap <silent> eu :GundoToggle<cr>

"vim-ref
nnoremap <silent> em :Unite ref/man<cr>

" Tab
"nnoremap <silent> sj :tabnext<cr>
"nnoremap <silent> ss :tabnext<cr>
"nnoremap <silent> sk :tabprevious<cr>

" Neosnippet
imap <C-t>     <Plug>(neosnippet_expand_or_jump)
smap <C-t>     <Plug>(neosnippet_expand_or_jump)
xmap <C-t>     <Plug>(neosnippet_expand_target)
" for terminal in tmux, C-t ga kabutterucara
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
noremap <silent> 'neos :NeoSnippetEdit<cr>

"Neocomplete
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><CR> neocomplete#smart_close_popup()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
noremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplte#cancel_popup()

"Quichhl
nmap .m <Plug>(quickhl-toggle)
xmap .m <Plug>(quickhl-toggle)

" MISC
" Move tab
noremap <silent> _ :tabprevious<cr>
noremap <silent> + :tabnext<cr>
" Move Windows
noremap <silent> ) <C-w>W
noremap <silent> (  <C-w>w
noremap <silent> <C-w>t :tabnew<cr>
noremap <silent> er :QuickRun<cr>
" ?
xmap <Space>M <Plug>(quickhl-toggle)


"Gtags
map .a :Unite -winheight=10 -immediately -default-action=tabopen gtags/context<CR>
map .o :Unite -winheight=10 -immediately -default-action=right gtags/def<CR>

"Alignta
map .= :Alignta 



" Grep(ag)
nnoremap <silent> <C-x> :<C-u>Unite -default-action=tabopen -no-quit grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
nnoremap <silent> <C-j>  :<C-u>UniteResume -default-action=tabopen -no-quit search-buffer<CR>



" Easy-Motion
nmap 'u 's
nmap '' 'w
nmap 'h 'b


" Ctrlp
let g:ctrlp_cmd = 'CtrlPMix'
let g:ctrlp_root_markers = ['.ctrlp']
map ,, :CtrlPBuffer<CR>
map ,. :CtrlPTag<CR>

" VimFiler
nnoremap en :VimFiler -split -simple -winwidth=35 -no-quit<CR>

nnoremap <C-\> $
