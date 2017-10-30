let tex_flavor = 'latex'

let g:latex_mappings_enabled=0

autocmd FileType tex setlocal omnifunc=latex#complete#labels

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

" tokusyu moji ga siroku naru
let g:tex_conceal = ''

" vimtex
"" viewer
let g:vimtex_view_method='general'
let g:vimtex_view_general_viewer="/usr/bin/llpp"

"" latexmk
let g:vimtex_latexmk_options='-pdfdvi'

"" general
" omokunaru
let g:vimtex_fold_enabled=1

let g:vimtex_latexmk_continuous=0

let g:vimtex_complete_enabled=1


let g:vimtex_compiler_latexmk = {
            \ 'background' : 0,
            \ 'build_dir' : '',
            \ 'continuous' : 1,
            \ 'options' : [
            \   '-pdfdvi',
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}
