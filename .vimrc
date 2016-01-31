" NeoBundl設定
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif 

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" color schemes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'
NeoBundle 'aereal/vim-color-japanesque'

" plugins 
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'supermomonga/neocomplete-rsense.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'surround.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'ujihisa/unite-colorscheme'

call neobundle#end()

" NeoBundleCheckを走らせ起動時に未インストールプラグインをインストール
NeoBundleCheck

" color scheme
set background=dark
colorscheme solarized
syntax on
"colorscheme molokai 
"syntax on
"set background=dark
"colorscheme japanesque
"syntax on

" ファイルタイプごとのインデントを有効
filetype plugin indent on
augroup vimrc
  autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

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

" カーソル行のハイライト
" set cursorline

" カーソル行の行番号のハイライト
"hi CursorLineNr term=bold   cterm=NONE ctermfg=228 ctermbg=NONE

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
nnoremap <silent><C-t> :NERDTreeToggle<CR>

" --------------------------------
" auto-ctags
" --------------------------------
let g:auto_ctags = 1

" --------------------------------
" execute ruby
" --------------------------------
autocmd BufNewFile,BufRead *.rb nnoremap <C-e> :!ruby %<CR>

" --------------------------------
" previm(markdown preview plugin) plugin
" --------------------------------
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

