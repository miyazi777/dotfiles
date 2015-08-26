" NeoBundle設定
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif 

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" originalrepos on github
NeoBundle 'altercation/vim-colors-solarized'  " カラースキーム指定 
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'supermomonga/neocomplete-rsense.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'surround.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'soramugi/auto-ctags.vim'

call neobundle#end()

" NeoBundleCheckを走らせ起動時に未インストールプラグインをインストール
NeoBundleCheck

" ファイルタイプごとのインデントを有効
filetype plugin indent on
augroup vimrc
  autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

" Solarized (color scheme)
syntax enable
set background=dark
colorscheme solarized

" 行番号表示
set number

" スワップを有効
set swapfile

" バックアップを有効
set backup

" タブを表示する時の幅
set tabstop=4

" 自動インデントでずれる幅 
set shiftwidth=4

" タブをスペースに展開
set expandtab

" ステータスラインを表示
set laststatus=2

" クリップボードを共用できるようにする
set clipboard=unnamed

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" --------------------------------
" Rsense
" --------------------------------
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'
let g:rsenseHome = '/usr/local/Cellar/rsense/0.3/libexec'

" --------------------------------
" NERD Tree
" --------------------------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" --------------------------------
" auto-ctags
" --------------------------------
let g:auto_ctags = 1

