let tex_flavor = 'latex'

let g:latex_mappings_enabled=0

autocmd FileType tex setlocal omnifunc=latex#complete#labels

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

" tokusyu moji ga siroku naru
let g:tex_conceal = ''

