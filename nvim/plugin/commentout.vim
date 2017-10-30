" lhs comments
vmap n# :s/^/#/<CR>:nohlsearch<CR>
vmap n/ :s/^/\/\//<CR>:nohlsearch<CR>
vmap n> :s/^/> /<CR>:nohlsearch<CR>
vmap n" :s/^/\"/<CR>:nohlsearch<CR>
vmap n% :s/^/%/<CR>:nohlsearch<CR>
vmap n! :s/^/!/<CR>:nohlsearch<CR>
vmap n; :s/^/;/<CR>:nohlsearch<CR>
vmap n- :s/^/--/<CR>:nohlsearch<CR>
vmap nc :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" wrapping comments
vmap n* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>
vmap n( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohlsearch<CR>
vmap n< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
vmap nd :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR> 
vmap nn :s/^\(.*\)$/\#\| \1 \|\#/<CR>:nohlsearch<CR>

" block comments
vmap nb v`<I<CR><esc>k0i/*<ESC>`>j0i*/<CR><esc><ESC>
vmap nh v`<I<CR><esc>k0i<!--<ESC>`>j0i--><CR><esc><ESC>

