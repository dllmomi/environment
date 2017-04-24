set number
set noswapfile
filetype indent on
set tabstop=2
set shiftwidth=2
set expandtab
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set fileencodings=utf-8,cp932,sjis
set fileformats=unix,dos,mac
set ignorecase
set hlsearch

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand("~/.config/nvim/")
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

nnoremap <silent> ub :Unite buffer<CR>
nnoremap <silent> uf :UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ur :Unite file_mru<CR>
nnoremap <silent> <S-l> :5wincmd ><CR>
nnoremap <silent> <S-h> :5wincmd <<CR>
nnoremap <silent> <S-k> :5wincmd +<CR>
nnoremap <silent> <S-j> :5wincmd -<CR>
nnoremap <C-]> g<C-]>

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" eskk
if has('unix') && isdirectory($HOME . '/.eskk')
  let g:eskk#directory = "~/.eskk"
  let g:eskk#large_dictionary = { 'path': "~/.eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'utf-8', }
endif
