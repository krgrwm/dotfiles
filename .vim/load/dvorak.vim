function! Dvorak()
    map  <PageDown>
    map t <Right>
    "nmap b t
    nmap m w
    nmap M j
    nmap de df
    nmap l v
    nmap L V
    map <C-l> <C-v>
    map q q
    imap <buffer> <CR> ;
    nmap c dw
endfunction
call Dvorak()
