" Clojure
"au FileType clojure unmap (
"au FileType clojure unmap )
"
"au FileType clojure nmap <silent> - :set hlsearch<CR>
"au FileType clojure nmap <silent> ( :set nohlsearch<CR>?\v(\)\|\(\|]\|[\|}\|\{)<CR>
"au FileType clojure nmap <silent> ) :set nohlsearch<CR>/\v(\)\|\(\|]\|[\|}\|\{)<CR>
"au FileType clojure imap ( ()<ESC>i
"au FileType clojure imap { {}<ESC>i
"au FileType clojure imap [ []<ESC>i
au FileType clojure noremap <C-Tab>  <C-w>w
au FileType clojure nmap  <C-e> :Eval<CR>
au FileType clojure vmap  <C-e> :Eval<CR>
au FileType clojure nmap  <C-a> ys%)
au FileType clojure nmap  <C-c> dw
au FileType clojure nmap  ,m cmm
au FileType clojure map  <Tab> %
au FileType clojure nmap  <C-h> cqp
au FileType clojure nmap  <C-s> :%Eval<CR>
au FileType clojure nmap  <C-d> :Require!<CR>
au FileType clojure nmap  <C-n> :Last<CR>
au FileType clojure nmap  <C-t> :Djump 
au FileType clojure imap <buffer> <CR> <CR>
au FileType clojure imap <C-p> <Plug>clj_repl_uphist.
au FileType clojure imap <C-b> <Plug>clj_repl_downhist.
au FileType clojure nmap <C-m> K
au FileType clojure nmap ccc :Eval!<CR>
au FileType clojure nmap ,e :Eval (clojure.stacktrace/e)<CR>
au FileType clojure nmap ,u :Eval (clojure.repl/pst)<CR>
au FileType clojure nmap <C-j> ,<
au FileType clojure nmap <C-k> ,>
au FileType clojure nmap ,<Space> ,J
au FileType clojure nmap ,o ,O
au FileType clojure nmap  <C-o> ,w(
au FileType clojure vmap  <C-o> ,w(
au FileType clojure nmap ,[ ,w[
au FileType clojure vmap ,[ ,w[
au FileType clojure nmap ,{ ,w{
au FileType clojure vmap ,{ ,w{
au FileType clojure nmap ," ,w"
au FileType clojure vmap ," ,w"
au FileType clojure nmap <buffer> <C-CR> ,S
au FileType clojure nmap ,rr :Eval a<CR>
au FileType clojure nmap ,rh :Eval b<CR>
au FileType clojure nmap  [
au FileType clojure nmap ,t :Eval (run-tests)<CR>
au FileType clojure nmap ,t :Eval (run-tests)<CR>
au FileType clojure nmap ,, :CtrlPBuffer<CR>
au FileType clojure nmap .( )l(jzf
au FileType clojure nmap <silent> ,c :!ctags -f ~/.tags/clj.tags `pwd`<CR><CR>

" redl
au FileType clojure inoremap <C-t> (break)
au FileType clojure inoremap <C-u> (continue)
