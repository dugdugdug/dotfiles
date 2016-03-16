let g:hybrid_use_Xresources = 1

" NeoBundleの設定
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/shoujiyuu/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('/Users/shoujiyuu/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'mattn/emmet-vim'

NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" ColorScheme
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'fugalh/desert.vim'
NeoBundle 'ronny/birds-of-paradise.vim'

" ステータスラインをカスタマイズ
NeoBundle 'itchyny/lightline.vim'

" 入力補完
NeoBundle 'Shougo/neocomplcache'

" Unite.vim
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" autocmd VimEnter * execute 'NERDTree'

" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'

" make等の処理
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', { 'autoload' : {
  \ 'insert' : 1,
  \ 'filetypes': 'ruby',
  \ }}

" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'
" UniteでRailsを使いやすく
NeoBundle 'basyura/unite-rails'
" ctagsの自動生成
NeoBundle 'alpaca-tc/alpaca_tags'

" markdownファイルをブラウザで（ほぼ）ライブプレビュー
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" シングルクオートとダブルクオートの入れ替え等
" Normalモード時に cs'"等
NeoBundle 'tpope/vim-surround'

" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

" バッファをタブエクスプローラー風に
NeoBundle 'DumbBuf'
NeoBundle 'minibufexpl.vim'

" VimのColorSchemeをインストールせずに試す
NeoBundle 'rhysd/try-colorscheme.vim'

" Wordpress開発を便利に
" NeoBundle 'shawncplus/phpcomplete.vim'
" NeoBundle 'dsawardekar/wordpress.vim'
NeoBundle 'sudar/vim-wordpress-snippets'
NeoBundle 'kloppster/Wordpress-Vim-Syntax'

" html5周りのシンタックス
NeoBundle 'vim-css3-syntax'
NeoBundle 'vim-javascript'
NeoBundle 'html5.vim'

" htmlのバリデート
NeoBundle "hokaccha/vim-html5validator"

" コーディング時間のログ計測
NeoBundle 'wakatime/vim-wakatime'

" 複数カーソル
NeoBundle 'terryma/vim-multiple-cursors'

" PHPのインデント設定
NeoBundle '2072/PHP-Indenting-for-VIm'

NeoBundleLazy 'leafgarland/typescript-vim', {
\ 'autoload' : {
\   'filetypes' : ['typescript'] }
\}

NeoBundleLazy 'jason0x43/vim-js-indent', {
\ 'autoload' : {
\   'filetypes' : ['javascript', 'typescript', 'html'],
\}}
let g:js_indent_typescript = 1

NeoBundle 'TwitVim'

" vimでファイルのリネーム
NeoBundle 'vim-scripts/renamer.vim'

" VimでPocketの操作
NeoBundle 'mattn/webapi-vim'
NeoBundle 'soramugi/pocket.vim'

NeoBundleLazy 'vim-jp/cpp-vim', {
            \ 'autoload' : {'filetypes' : 'cpp'}
            \ }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" Plugin Settings
" Neosnippet 設定
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Lightline Settings
"let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'component': {
"      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
"      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
"      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
"      \ },
"      \ 'component_visible_condition': {
"      \   'readonly': '(&filetype!="help"&& &readonly)',
"      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
"      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
"      \ },
"      \ 'separator': { 'left': '⮀', 'right': '⮂' },
"      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
"      \ }


" NeoComplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return neocomplcache#smart_close_popup() . "\<CR>"
" endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" ruby endwise
let g:endwise_no_mappings=1

" ColorScheme設定
colorscheme desert

" NERDTREE設定
let NERDTreeShowHidden = 1
noremap <c-e> :<c-u>:call ExecuteNERDTree()<cr>


" 画面設定
set background=dark
" colorscheme gruvbox
highlight Normal ctermbg=none

" シンタックスハイライト
syntax enable

" 文字コードとインデント（タブをスペースに）
set fenc=utf-8
set expandtab
set tabstop=2
set autoindent
set shiftwidth=2
" set cursorcolumn
set cursorline
" 行番号の色
highlight LineNr ctermfg=darkyellow
set number
" 対応する括弧やブレースを表示する
set showmatch
set wrap
" set list "タブや改行の可視化
set showcmd
" set spell

" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title

" 検索結果をハイライト表示する
set hlsearch

" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch

" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden

" タブと行の続きを可視化する（有効化するとShift+j時に結合スペースができない）
" set listchars=tab:>\ ,extends:<

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" アンドゥファイルの保存先を変更
set undodir=~/.vim/undo/

"カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

" ノーマルモード時のみ;を:として認識
nnoremap ; :

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
" imap { {}<LEFT>
" imap [ []<LEFT>
" imap ( ()<LEFT>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

" 自動的にディレクトリを作成
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'))
  function! s:auto_mkdir(dir)  " {{{
    if !isdirectory(a:dir)
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}

" 行末の不要なスペースを保存時に削除
autocmd BufWritePre * :%s/\s\+$//ge

" Vim表示内にボールドを許可
let g:enable_bold_font = 1

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

" 使用フォント
set guifont=Osaka:h14

" スクロールの遅延描画
set lazyredraw

" クリップボードを使用してのコピペを可能に
set clipboard=unnamed,autoselect

" スワップファイルを生成しない
set noswapfile
" バックアップファイルを生成しない
set nobackup

" .や::を入力したときにオムニ補完が有効になるようにする
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" 環境変数RSENSE_HOMEに'/usr/local/bin/rsense'を指定しても動く
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'

"------------------------------------
" MiniBufExplorer
"------------------------------------
"set minibfexp
let g:miniBufExplMapWindowNavVim=1 "hjklで移動
let g:miniBufExplSplitBelow=0  " Put new window above
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1
let g:miniBufExplMaxSize = 10



" スワップファイルを生成しない
set noswapfile
" バックアップファイルを生成しない
set nobackup

" .や::を入力したときにオムニ補完が有効になるようにする
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" 環境変数RSENSE_HOMEに'/usr/local/bin/rsense'を指定しても動く
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'

"------------------------------------
" MiniBufExplorer
"------------------------------------
"set minibfexp
let g:miniBufExplMapWindowNavVim=1 "hjklで移動
let g:miniBufExplSplitBelow=0  " Put new window above
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1
let g:miniBufExplMaxSize = 10

" neosnippet設定
autocmd User Rails.view*                 NeoSnippetSource ~/.vim/bundle/neosnippet-snippets/neosnippet/ruby.rails.view.snip
autocmd User Rails.controller*           NeoSnippetSource ~/.vim/bundle/neosnippet-snippets/neosnippet/ruby.rails.controller.snip
autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.vim/bundle/neosnippet-snippets/neosnippet/ruby.rails.migrate.snip
autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.vim/bundle/neosnippet-snippets/neosnippet/ruby.rails.route.snip

autocmd BufEnter *.php :set syn=wordpress

" HTML 5 tags
syn keyword htmlTagName contained article aside audio bb canvas command
syn keyword htmlTagName contained datalist details dialog embed figure
syn keyword htmlTagName contained header hgroup keygen mark meter nav output
syn keyword htmlTagName contained progress time ruby rt rp section time
syn keyword htmlTagName contained source figcaption
syn keyword htmlArg contained autofocus autocomplete placeholder min max
syn keyword htmlArg contained contenteditable contextmenu draggable hidden
syn keyword htmlArg contained itemprop list sandbox subject spellcheck
syn keyword htmlArg contained novalidate seamless pattern formtarget
syn keyword htmlArg contained formaction formenctype formmethod
syn keyword htmlArg contained sizes scoped async reversed sandbox srcdoc
syn keyword htmlArg contained hidden role
syn match   htmlArg "\<\(aria-[\-a-zA-Z0-9_]\+\)=" contained
syn match   htmlArg contained "\s*data-[-a-zA-Z0-9_]\+"

let s:i = 0
let s:s = 10

function! s:byonbyon()
  let &columns = s:w + float2nr(cos(3.141592*(0.0 + s:i * s:s)/180.0) * 10)
  let &lines = s:h + float2nr(sin(3.141592*(0.0 + s:i * s:s)/180.0) * 5)
  let s:i += 1
  call feedkeys(mode() ==# "i" ? "\<C-g>\<ESC>" : "g\<ESC>", "n")
endfunction

function! s:stop_byonbyon()
  augroup ByonByon
    autocmd!
  augroup END
endfunction

function! s:start_byonbyon()
  let s:w = &columns
  let s:h = &lines
  set lazyredraw updatetime=10
  augroup ByonByon
    autocmd!
    autocmd CursorHold,CursorHoldI * call s:byonbyon()
  augroup END
  command! StopByonByon call <SID>stop_byonbyon()
endfunction

"自動文字数カウント
augroup WordCount
    autocmd!
    autocmd BufWinEnter,InsertLeave,CursorHold * call WordCount('char')
augroup END
let s:WordCountStr = ''
let s:WordCountDict = {'word': 2, 'char': 3, 'byte': 4}
function! WordCount(...)
    if a:0 == 0
        return s:WordCountStr
    endif
    let cidx = 3
    silent! let cidx = s:WordCountDict[a:1]
    let s:WordCountStr = ''
    let s:saved_status = v:statusmsg
    exec "silent normal! g\<c-g>"
    if v:statusmsg !~ '^--'
        let str = ''
        silent! let str = split(v:statusmsg, ';')[cidx]
        let cur = str2nr(matchstr(str, '\d\+'))
        let end = str2nr(matchstr(str, '\d\+\s*$'))
        if a:1 == 'char'
            " ここで(改行コード数*改行コードサイズ)を'g<C-g>'の文字数から引く
            let cr = &ff == 'dos' ? 2 : 1
            let cur -= cr * (line('.') - 1)
            let end -= cr * line('$')
        endif
        let s:WordCountStr = printf('%d/%d', cur, end)
    endif
    let v:statusmsg = s:saved_status
    return s:WordCountStr
endfunction

command! StartByonByon call <SID>start_byonbyon()

" Vimの戦闘力を計測
function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
command! -bar -bang -nargs=? -complete=file GScouter
\        echo Scouter(empty(<q-args>) ? $MYGVIMRC : expand(<q-args>), <bang>0)

" Twitterクライアント化
let twitvim_browser_cmd = 'open' " for Mac
let twitvim_force_ssl = 1
let twitvim_count = 40

set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp

" 折りたたみの設定
set foldmethod=syntax
let perl_fold=1
set foldlevel=100 "Don't autofold anything

au BufNewFile,BufRead *.ejs set filetype=html
