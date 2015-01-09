if !1 | finish | endif

set nocompatible
filetype off

if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" NeoBundleInstall targets(basically)
NeoBundle 'Shougo/vimproc', {
      \   'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \   },
      \ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'szw/vim-tags'

" NeoBundleInstall targets about git
NeoBundle 'tpope/vim-fugitive'

" NeoBundleInstall targets about JS
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'marijnh/tern_for_vim'

" NeoBundleInstall targets about other
NeoBundle 'majutsushi/tagbar'
NeoBundle 'rking/ag.vim'
NeoBundle 'sjl/gundo.vim'

syntax on

" basically vim configurations
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
set encoding=utf-8
set fileencodings=utf-8,cp932,sjis
set fileformats=unix,dos,mac
set ignorecase
" clipboard sharing: need brew install reattach-to-user-namespace
set clipboard+=autoselect

" plugins configulations
let g:unite_enable_start_insert=0
let g:neocomplcache_enable_at_startup=1
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
let g:jscomplete_use = ['dom', 'moz']
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
set tags+=/Users/mitsunari_ichikawa/dev/noren/tags

" shortcut
nnoremap <silent> ub :Unite buffer<CR>
nnoremap <silent> uf :UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ur :Unite file_mru<CR>
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> tb :TagbarToggle<CR>
nnoremap <silent> <S-l> :5wincmd ><CR>
nnoremap <silent> <S-h> :5wincmd <<CR>
nnoremap <silent> <S-k> :5wincmd +<CR>
nnoremap <silent> <S-j> :5wincmd -<CR>
nnoremap <C-H> :GundoShow<CR>
nnoremap <C-]> g<C-]>

au FileType javascript set tabstop=4 shiftwidth=4
au FileType html set tabstop=4 shiftwidth=4

" linking Kobito
" copied from http://qiita.com/Linda_pp/items/ec458977a6552050855b
function! s:open_kobito(...)
  if a:0 == 0
    call system('open -a Kobito '.expand('%:p'))
  else
    call system('open -a Kobito '.join(a:000, ' '))
  endif
endfunction

command! -nargs=* Kobito call s:open_kobito(<f-args>)
command! -nargs=* KobitoClose call system("osascript -e 'tell application \"Kobito\" to quit'")
command! -nargs=* KobitoFocus call system("osascript -e 'tell application \"Kobito\" to activate'")
