nnoremap / /\v
nmap  <C-c> dw


nnoremap [E] <Nop>
nmap e [E]

nnoremap [Space] <Nop>
nmap <Space> [Space]

nnoremap [Unite] <Nop>
nmap [Space]u [Unite]

noremap <silent> <C-Right> <ENTER>

"Gundo
nnoremap <silent> [E]u :GundoToggle<cr>

"vim-ref
nnoremap <silent> [E]m :Unite ref/man<cr>

" Tab
noremap <silent> 0 :tabnext<cr>
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
noremap <silent> [Space]neos :NeoSnippetEdit<cr>

"Neocomplete
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><CR> neocomplete#smart_close_popup()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
noremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplte#cancel_popup()

""Quichhl
"nmap .m <Plug>(quickhl-toggle)
"xmap .m <Plug>(quickhl-toggle)

" MISC
" Move tab
noremap <silent> _ :tabprevious<cr>
noremap <silent> + :tabnext<cr>
" Move Windows
noremap <silent> ( <C-w>W
noremap <silent> )  <C-w>w
noremap <silent> <C-w>t :tabnew<cr>
noremap <silent> [E]r :QuickRun<cr>
" ?
"xmap <Space>M <Plug>(quickhl-toggle)


"Gtags
map [Space]tc :Unite -winheight=10 -immediately -default-action=tabopen gtags/context<CR>
map [Space]td :Unite -winheight=10 -immediately -default-action=right gtags/def<CR>

" Grep(ag)
nnoremap <silent> <C-x> :<C-u>Unite -default-action=tabopen -no-quit grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
nnoremap <silent> <C-j>  :<C-u>UniteResume -default-action=tabopen -no-quit search-buffer<CR>


" VimFiler
nnoremap [E]n :VimFiler -split -simple -winwidth=35 -no-quit<CR>

nnoremap <C-\> $


"----------------------------------------------
" vimのマーク機能をできるだけ活用してみる - Make 鮫 noise
" http://saihoooooooo.hatenablog.com/entry/2013/04/30/001908
" mを押すことで現在位置に対して自動的にアルファベットを割り振る
"----------------------------------------------
"
" マーク設定 : {{{
" 基本マップ
nnoremap [Mark] <Nop>
nmap C [Mark]
" 現在位置をマーク
if !exists('g:markrement_char')
    let g:markrement_char = [
    \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
    \ ]
endif
nnoremap <silent>[Mark]C :<C-u>call <SID>AutoMarkrement()<CR>:DoShowMarks<CR>
function! s:AutoMarkrement()
    if !exists('b:markrement_pos')
        let b:markrement_pos = 0
    else
        let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
    endif
    execute 'mark' g:markrement_char[b:markrement_pos]
    echo 'marked' g:markrement_char[b:markrement_pos]
endfunction

nnoremap [Mark]R `

nnoremap do diw

" clevel-f
nmap t <Plug>(clever-f-f)
nmap T <Plug>(clever-f-F)
