set nocompatible
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimfiler'

filetype plugin on
filetype indent on
syntax on
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set number
set list
set listchars=tab:>.,eol:$
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set directory=$HOME/.vim/swap
set backupdir=$HOME/.vim/bk
set backupskip=$HOME/.vim/bkskip
let g:unite_enable_start_insert=0
let g:neocomplcache_enable_at_startup=1
noremap <C-U><C-B> :Unite buffer<CR>
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
noremap <C-U><C-R> :Unite file_mru<CR>
noremap <C-V><C-F> :VimFiler<CR>
noremap <C-V><C-S> :VimShell<CR>
