let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1


"dein Scripts-----------------------------

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')

call dein#end()


"if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
"endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

"End dein Scripts-------------------------



""NeoBundle Scripts-----------------------------
"if has('vim_starting')
"  set nocompatible               " Be iMproved
"
"  " Required:
"  set runtimepath+=~/.vim/bundle/neobundle.vim/
"endif
"
"" Required:
"call neobundle#begin(expand('~/.vim/bundle'))
"
"" Let NeoBundle manage NeoBundle
"" Required:
"NeoBundleFetch 'Shougo/neobundle.vim'
"
"" Add or remove your Bundles here:
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'flazz/vim-colorschemes'
"
"NeoBundle 'Gundo'
"NeoBundle 'quickfixstatus.vim'
"NeoBundle 'hier'
"NeoBundle 'quickrun.vim'
"NeoBundle 'thinca/vim-ref'
"NeoBundle 'Shougo/unite.vim'
""NeoBundle 'h1mesuke/unite-outline'
"NeoBundle 'Shougo/unite-outline'
"NeoBundle 'Shougo/neosnippet'
""NeoBundle 'hakobe/unite-script'
""NeoBundle 'mattn/mkdpreview-vim'
""NeoBundle 'tyru/open-browser.vim'
""NeoBundle 'tpope/vim-markdown'
""NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neocomplete'
"NeoBundle 'Shougo/vimproc.vim', {
"\ 'build' : {
"\     'windows' : 'tools\\update-dll-mingw',
"\     'cygwin' : 'make -f make_cygwin.mak',
"\     'mac' : 'make -f make_mac.mak',
"\     'linux' : 'make',
"\     'unix' : 'gmake',
"\    },
"\ }
""NeoBundle 'Shougo/vimshell'
""NeoBundle 'gauref.vim'
""NeoBundle 'info.vim'
"NeoBundle 'quickhl.vim'
""NeoBundle 'aharisu/vim_goshrepl'
""NeoBundle 'mitechie/pyflakes-pathogen'
""NeoBundle 'sontek/rope-vim'
""NeoBundle 'VimClojure'
""NeoBundle 'javacomplete'
"NeoBundle 'hewes/unite-gtags'
""NeoBundle 'thinca/vim-editvar'
"NeoBundle 'ujihisa/unite-launch'
"NeoBundle 'bling/vim-airline'
""NeoBundle 'h1mesuke/vim-alignta'
"NeoBundle 'junegunn/vim-easy-align'
"
""NeoBundle "osyo-manga/unite-quickfix"
""NeoBundle "osyo-manga/shabadou.vim"
""NeoBundle 'bufferlist.vim'
""NeoBundle 'aharisu/Gauche-Complete'
""NeoBundle 'Pydiction'
""NeoBundle 'pythoncomplete'
"NeoBundle 'tsukkee/unite-tag'
"NeoBundle 'luochen1990/rainbow'
""NeoBundle 'slimv.vim'
""NeoBundle 'guns/vim-clojure-static'
"NeoBundle 'supasorn/vim-easymotion'
""NeoBundle 'tpope/vim-fireplace'
"NeoBundle 'tpope/vim-surround'
"" redl $B$NJd405!G=$,=E$$(B
""NeoBundle 'dgrnbrg/vim-redl'
""NeoBundle 'kovisoft/slimv'
""NeoBundle 'ivanov/vim-ipython'
""NeoBundle 'jpalardy/vim-slime'
"NeoBundle 'davidhalter/jedi-vim'
"NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'djoshea/vim-autoread'
"NeoBundle 'Shougo/neomru.vim'
"NeoBundle 'Shougo/vimfiler'
"NeoBundle 'kana/vim-textobj-user'
"NeoBundle 'kana/vim-operator-user'
"NeoBundle 'rbonvall/vim-textobj-latex'
"NeoBundle 'lervag/vim-latex'
"NeoBundle 'igrep/vim-latex-omnifunc'
"NeoBundle 'Raimondi/delimitMate'
"NeoBundle 'JuliaLang/julia-vim'
"NeoBundle 'Shougo/junkfile.vim'
"NeoBundle 'jceb/vim-orgmode'
"NeoBundle "hdima/python-syntax"
"NeoBundle "osyo-manga/vim-watchdogs", {
"  \ "depends": ["Shougo/vimproc", "thinca/vim-quickrun", "dannyob/quickfixstatus",
"               \"osyo-manga/shabadou.vim", "cohama/vim-hier"]}
""NeoBundle "nvie/vim-flake8"
"NeoBundle "hynek/vim-python-pep8-indent"
"NeoBundle 'kana/vim-textobj-indent'
"NeoBundle 'bps/vim-textobj-python'
"NeoBundle "alfredodeza/khuno.vim"
"NeoBundle "rhysd/clever-f.vim"
"NeoBundle "tacroe/unite-mark"
"NeoBundle 'jacquesbh/vim-showmarks'
"NeoBundle 'jmcantrell/vim-virtualenv'
"NeoBundle 'umitkablan/slimux'
""NeoBundle 'jalcine/cmake.vim'
""NeoBundle 'tyru/eskk.vim'
""NeoBundle 'haya14busa/incsearch.vim'
"NeoBundle 'lervag/vimtex'
"NeoBundle 'LeafCage/yankround.vim'
"NeoBundle 'Konfekt/FastFold'
"NeoBundle 'mattn/benchvimrc-vim.git'




"" Required:
"call neobundle#end()
"
" Required:
"filetype plugin indent on
"
"" If there are uninstalled bundles found on startup,
"" this will conveniently prompt you to install them.
"NeoBundleCheck
""End NeoBundle Scripts-------------------------

runtime! load**/*.vim






" beef off
set vb t_vb=




