" シンタックスハイライト
syntax on

" 行番号を表示する
set number

" 列の80番目をハイライトする
set colorcolumn=80

" 列のハイライトカラーを設定
hi ColorColumn ctermbg=RED

" 折り返し禁止
set nowrap

" タブを半角スペースに変更
set expandtab

" tabキーを押したときの半角スペースの数
set tabstop=4

" インデントの幅
set shiftwidth=4

" タブと半角スペースを可視化
set list
set listchars=tab:>-,trail:-

" 全角スペースと不要な半角スペースをハイライトさせる
augroup HighlightSpaces
    autocmd!
    " ハイライトカラーを設定
    autocmd VimEnter,WinEnter,ColorScheme * highlight Spaces ctermbg=Red
    " 全角スペースと不要な半角スペースを正規表現で定義
    autocmd VimEnter,WinEnter * match Spaces /\(　\|\s\+$\)/
augroup END

" 検索キーワードをハイライトさせる
set hlsearch

" 検索キーワードのハイライトカラーを設定
hi Search ctermbg=blue

" 検索時に大文字小文字を区別しない
set ignorecase

" 循環検索しない
set nowrapscan

" ステータスラインを常に表示させる
set laststatus=2

" ステータスラインのハイライトカラーの設定
highlight StatusLine cterm=bold ctermbg=DarkMagenta

""" [Start] ステータスラインに表示する内容の設定
set statusline=%F  "ファイル名表示
set statusline+=%m "変更チェック表示
set statusline+=%r "読み込み専用かどうか表示
set statusline+=%h "ヘルプページなら[HELP]と表示
set statusline+=%w "プレビューウインドウなら[Prevew]と表示
set statusline+=%{fugitive#statusline()}  "Gitのブランチ名を表示
set statusline+=%= "これ以降は右寄せ表示
set statusline+=[Encode=%{&fileencoding}] "encode type
set statusline+=[Format=%{&fileformat}]   "改行コード
set statusline+=[Line=%l/%L] "現在行数/全行数
set statusline+=[Col=%c]     "列番号
""" [End] ステータスラインに表示する内容の設定

" コマンドの補完対象のものをステータスラインに表示する
set wildmenu

" タブを常に表示する
set showtabline=2

" タブのハイライトカラーを設定
hi TabLineSel ctermbg=blue

""" [Start] タブに表示する内容を設定
set tabline=%!MyTabLine()
function! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " ラベルは MyTabLabel() で作成する
        let my_tab_label = '%{MyTabLabel(' . (i + 1) . ')}'
        " 強調表示グループの選択
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " タブ番号 : [ファイル名] のフォーマットになるように設定
        let s .= (i + 1) . ':[' . my_tab_label .'] '
    endfor

    " 最後のタブページの後は TabLineFill で埋め、タブページ番号をリセットする
    let s .= '%#TabLineFill#%T'

    return s
endfunction

function! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return fnamemodify(bufname(buflist[winnr - 1]), ":t")
endfunction
""" [End] タブに表示する内容を設定

" 入力中のコマンドを表示させる
set showcmd

" 対応するカッコをハイライト
set showmatch
" 対応するカッコのハイライトカラーを設定
hi MatchParen ctermbg=DarkMagenta

" man以外のhelpも参照できるようにする
set keywordprg=:help

" map設定
nnoremap Y y$
nnoremap <F3> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
nnoremap <C-k> :vs \| /<C-R>=expand('<cword>')<CR><CR> <C-w>lzt

" 設定ファイルをロードする
source ~masaharu/.vimrc_my_command
source ~masaharu/.vimrc_plugin
