function! Dvorak()

    map  <PageDown>
    "nmap b t
    nnoremap m w
    nnoremap M b

"    nnoremap t e
"    nnoremap T ge

    nnoremap s c

    nmap b f
    xmap b f
    omap b f
    nmap B F
    xmap B F
    omap B F

"    nmap de df
    map q q
    nmap c dw
endfunction
call Dvorak()
