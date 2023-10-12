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

call ddu#custom#patch_global({
  \    'ui': 'filer',
  \    'sources': [{'name': 'file', 'params': {}}],
  \    'sourceOptions': {
  \      '_': {
  \        'columns': ['filename'],
  \      },
  \    },
  \    'kindOptions': {
  \      'file': {
  \        'defaultAction': 'open',
  \      },
  \    }
  \  })

call skkeleton#config({ 'globalJisyo': '~/.skk/SKK-JISYO.L' })

set number
set list
set noswapfile
filetype indent on
set tabstop=2
set shiftwidth=2
set expandtab
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set fileencodings=utf-8,cp932,sjis
set fileformats=unix,dos,mac
set ignorecase

nnoremap <silent> ds :call ddu#start({})<CR>
nnoremap <silent> <S-l> :5wincmd ><CR>
nnoremap <silent> <S-h> :5wincmd <<CR>
nnoremap <silent> <S-k> :5wincmd +<CR>
nnoremap <silent> <S-j> :5wincmd -<CR>
nnoremap <C-]> g<C-]>
imap <C-j> <Plug>(skkeleton-enable)
cmap <C-j> <Plug>(skkeleton-enable)

let g:dein#install_github_api_token = '${GITHUB_API_TOKEN}'
