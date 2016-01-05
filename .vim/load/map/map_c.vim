
"C/C++
"au FileType c noremap <silent> er :make %:r<cr>
"au FileType cpp noremap <silent> er :make %:r<cr>
au FileType c inoremap <C-Enter> <C-j>
au FileType c imap <buffer> <CR> ;
au FileType cpp inoremap <C-Enter> <C-j>
au FileType cpp imap <buffer> <CR> ;

au FileType c noremap <silent> ee :!\./%:r<cr>
au FileType cpp noremap <silent> ee :!\./%:r<cr>

au FileType c noremap <space>r :!cmake -B./build -H.<cr>:make -C ./build<cr>
au FileType cpp noremap <space>r :!cmake -B./build -H.<cr>:make -C ./build<cr>

au FileType c set tabstop=2
au FileType cpp set tabstop=2
au FileType c set shiftwidth=2
au FileType cpp set shiftwidth=2

au Filetype c noremap <silent> ej zj
au Filetype c noremap <silent> ek zk
au FileType c noremap <silent> el i/* */<ESC>hhi 

au Filetype cpp noremap <silent> ej zj
au Filetype cpp noremap <silent> ek zk
au FileType cpp noremap <silent> el i/* */<ESC>hhi 
