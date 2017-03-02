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
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'supermomonga/neocomplete-rsense.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'surround.vim'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'dhruvasagar/vim-table-mode'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'todesking/ruby_hl_lvar.vim'
NeoBundle 'fatih/vim-go.git'
NeoBundle 'rking/ag.vim'
NeoBundle 'vim-scripts/visSum.vim'

call neobundle#end()

" NeoBundleCheckを走らせ起動時に未インストールプラグインをインストール
NeoBundleCheck

" 256色モード
let &t_Co=256

" color scheme
set background=dark
colorscheme solarized
syntax on


" タブを表示する時の幅
set tabstop=4
" 自動インデントでずれる幅
set shiftwidth=4
" タブをスペースに展開
set expandtab

" ファイルタイプごとのインデントを有効
filetype plugin indent on
"augroup vimrc
"  autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
"  autocmd! FileType rb setlocal shiftwidth=2 tabstop=2 softtabstop=2
"augroup END

" 行番号表示
set number

" スワップを有効
set swapfile

" バックアップを有効
set backup

" カーソル行のハイライト
set cursorline

" カーソル行の行番号のハイライト
hi CursorLineNr term=bold   cterm=NONE ctermfg=228 ctermbg=NONE

" ステータスラインを表示
set laststatus=2

" クリップボードを共用できるようにする
set clipboard=unnamed

" 保存時に行末のスペースを削除する
autocmd BufWritePre * :%s/\s\+$//ge

" jjで挿入モードから抜ける
inoremap <silent> jj <ESC>

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
" nnoremap <silent><C-t> :NERDTreeToggle<CR>

" --------------------------------
" auto-ctags
" --------------------------------
let g:auto_ctags = 1

" --------------------------------
" execute ruby
" --------------------------------
autocmd BufNewFile,BufRead *.rb nnoremap <C-e> :!ruby %<CR>

" --------------------------------
" vim-table-mode plugin
" --------------------------------
let g:table_mode_corner = "|"

" --------------------------------
" previm(markdown preview plugin) plugin
" --------------------------------
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown

" --------------------------------
" unite.vim
" --------------------------------
"  画像ファイルを無視する
let s:unite_ignore_patterns='\.\(gif\|jpe\?g\|png\|webp\)$'
call unite#custom#source('file_rec', 'ignore_pattern', s:unite_ignore_patterns)

"  起動時にinsert modeに
let g:unite_enable_start_insert=1
" デフォルトアクションはタブで開く
call unite#custom#default_action('file', 'tabswitch')
" filear && buffer
nnoremap <silent> ,uu :<C-u>Unite file file_rec buffer<CR>
" history && buffer
"nnoremap <silent> ,uh :<C-u>Unite file_mru buffer<CR>
" yank
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" --------------------------------
" customize
" --------------------------------
nnoremap <silent> <C-l> gt  " ctrl + l   次のタブへ移動
nnoremap <silent> <C-h> gT  " ctrl + h   前のタブへ移動
nnoremap <silent> <Tab> gt  " tab + l   次のタブへ移動
nnoremap <silent> <S-Tab> gT  " tab + h   前のタブへ移動
"nnoremap <silent> ˚ gt  " alt + k   次のタブへ移動
"nnoremap <silent> ∆ gT  " alt + j   前のタブへ移動

inoremap <C-J> <nop>    " 日本語切り替えの為のctrl+Jの無効化

" --------------------------------
" vim-tags
" --------------------------------
let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R {OPTIONS} `bundle show --paths` 2>/dev/null"

" タグファイルのパス
set tags+=~/.tags
" F3でタグジャンプする時に新しくタブを開く
nnoremap <F3> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

" --------------------------------
" indentLine
" --------------------------------
let g:indentLine_color_term = 245

" --------------------------------
" gitgutter
" --------------------------------
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>


" --------------------------------
" vim-airline
" --------------------------------
let g:Powerline_symbols = 'compatible'

let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
" タブラインのカスタマイズを有効に
let g:airline#extensions#tabline#enabled = 1


" --------------------------------
" vim-fugitive
" --------------------------------
"  ブランチ情報を表示する
let g:airline#extensions#branch#enabled = 1

" --------------------------------
" open-browser
" --------------------------------
nmap ,oo <Plug>(openbrowser-smart-search)

" --------------------------------
" vim-go setting
" --------------------------------
au FileType go nmap ,gr <Plug>(go-run)

" --------------------------------
" ag.vim setting
" --------------------------------
let g:ag_working_path_mode="r"

" --------------------------------
" visSum.vim setting
" --------------------------------
