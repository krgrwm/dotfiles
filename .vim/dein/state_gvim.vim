let [plugins, ftplugin] = dein#load_cache_raw(['/home/tsato/.vimrc'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/tsato/.vim/dein'
let g:dein#_runtime_path = '/home/tsato/.vim/dein/.dein'
let &runtimepath = '/home/tsato/.vim/dein/repos/github.com/Shougo/dein.vim,/home/tsato/.vim,/home/tsato/.vim/dein/.dein,/home/tsato/.vim/dein/.dein,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/home/tsato/.vim/after,/home/tsato/.vim/dein/.dein/after,/home/tsato/.vim/dein/.dein/after'
