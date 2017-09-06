" vim:set ts=4 sts=2 sw=2 tw=0 ft=vim fdm=marker:

set nocompatible

" 基本的な設定: {{{

" タイトルを表示しない
set notitle

" ビープ音を鳴らさない
set vb t_vb=
" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"<Leader>の設定
let mapleader = ","

" 日本語ヘルプフリーズ問題対策。
set notagbsearch

" ヘルプファイルの検索順
set helplang=ja,en

" 保存していないバッファでも切り替えられる
set hidden

" 起動時のメッセージを表示しない
set shortmess+=I

"スクロール時の余白
set scrolloff=5

" splitしたときに下に出す。
set splitbelow

" vsplitしたときに右に出す。
set splitright

" 補完時、現在選択中の候補の付加情報を表示しない。
" set completeopt-=menu,preview

" 正規表現エンジンの設定
" set regexpengine=0

" pasteモードの切り替えマッピング
set pastetoggle=<C-p>

set fdm=marker

"ノーマルモード時だけ ; を : にする
nnoremap ; :
" }}}

" 文字コードの設定 {{{

" Vim内部で使われる文字エンコーディング
set encoding=utf-8

" ターミナルで使われるエンコーディング
set termencoding=utf-8

" カレントバッファのファイルの文字エンコーディング
set fileencoding=utf-8

" 読めなかったときに試される順番。
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,sjis

" 改行コードの自動認識
set fileformats=unix,dos,mac

" □とか○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double
" set ambiwidth=single

" }}}

" アンドゥ/リドゥの設定 {{{
" set undofile
" set undodir=$HOME/undo
" }}}

" クリップボードの設定 {{{
" クリップボードの共有
set clipboard+=unnamedplus,unnamed
" }}}

" ハイライトの設定 {{{

" 色のチェック方法
" :so $VIMRUNTIME/syntax/colortest.vim


" 全角スペースのハイライト
function! s:highlight_zenkaku_space()
  " エラーと同じ色
  highlight link ZenkakuSpace Error
  "highlight ZenkakuSpace cterm=underline ctermfg=red guibg=red

  "全角スペースを明示的に表示する。
  silent! match ZenkakuSpace /　/
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,BufEnter,WinEnter * nested call <SID>highlight_zenkaku_space()
  augroup END
endif

" }}}

" 検索・補完の設定 {{{

" コマンド、検索パターンをn個まで履歴に残す
set history=500

" 検索の時に大文字小文字を区別しない
set ignorecase

" 検索altercation / solarized の時に大文字が含まれている場合は区別して検索する
set smartcase

" 最後altercation / solarized まで検索したら先頭に戻る
set wrapscan

" インクリメンタルサーチの使用
"set noincsearch
set incsearch

" コマンドライン補完を拡張モードにする
set wildmenu

" 複数のマッチがあるときは、全てのマッチを羅列する。
set wildmode=full

" コマンドラインの補完キー
set wildchar=<Tab>

set showfulltag
" }}}

" 画面表示の設定 {{{

" タイトルをウインドウ枠に表示する
set title

" 行番号を表示
set number

" ルーラーを表示
"set ruler

" タブ文字を CTRL-I（デフォルト） で表示し、行末に $ で表示する
"set list
" タブ文字を次の文字列で視覚化(Listモード (訳注: オプション 'list' がオンのとき) に使われる文字を設定する。
" cが一文字で、xyが2文字。
" eol:c     行末の改行文字
" tab:c     タブ
" trail:xy  行末のスペース
" extends:c 折り返した行の表末
" precedes:c 折り返してきた表の行頭
" nbsp:c    ノンブレーカブルスペース（？）
"set listchars=tab:>-,extends:<,trail:-

" 括弧入力時の対応する括弧を表示
set showmatch

" 対応する括弧の表示時間を2にする
set matchtime=2

" シンタックスハイライトを有効にする
syntax on

" 検索結果文字列のハイライトを有効にする
set hlsearch

" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0

" ウィンドウの幅より長い行でも折り返さない
set nowrap

" カーソルラインを表示させる
" set cursorline
" カーソル列を表示させる
" set cursorcolumn

" マクロ/レジスタの内容/キーボードから打ち込まれないコマンド を実行する管は再描画しない
set lazyredraw

" 高速ターミナル接続を行う
set ttyfast

" }}}

" ステータスラインの設定 {{{

" 入力中のコマンドをステータスに表示する
set showcmd

" ステータスラインを常に表示
set laststatus=2

" ステータスラインの行数
set cmdheight=2

" ステータスラインに表示する情報の指定
" set statusline=%n\:%y%F\ %m%r%=%{fugitive#statusline()}[%{(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%l/%L(%p%%),%v]

" }}}

" 共通のインデントの設定(ファイルタイプ別はafter/ftplugin/xxx.vimにて設定) {{{

" オートインデントを無効にする
"set noautoindent

" タブが対応する空白の数
set tabstop=4

" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=4

" インデントの各段階に使われる空白の数
set shiftwidth=4

" タブはハードタブとして入力する
" set noexpandtab
" タブは空白として入力する（実際にTABを入力したい場合は<C-V><TAB>）
set expandtab

" }}}
