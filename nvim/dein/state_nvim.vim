if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/tsato/dotfiles/nvim/init.vim', '/home/tsato/.config/nvim/rc/dein.toml', '/home/tsato/.config/nvim/rc/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/tsato/.config/nvim/dein'
let g:dein#_runtime_path = '/home/tsato/.config/nvim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/tsato/.config/nvim/dein/.cache/init.vim'
let &runtimepath = '/home/tsato/.config/nvim/dein/repos/github.com/Shougo/dein.vim,/home/tsato/.config/nvim,/etc/xdg/nvim,/home/tsato/.local/share/nvim/site,/usr/local/share/nvim/site,/home/tsato/.config/nvim/dein/.cache/init.vim/.dein,/usr/share/nvim/site,/usr/share/nvim/runtime,/home/tsato/.config/nvim/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/tsato/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/tsato/.config/nvim/after'
filetype off