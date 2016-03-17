" MAIN CUSTOMIZATION FILE
"

" 插件集中到 bundle 目录
call pathogen#infect()
" Enable loading filetype and indentation plugin
filetype plugin on
filetype indent on
" highlight cursorline
set cursorline

" Set mapleader
let mapleader = ","
let g:mapleader = ","

let g:neocomplcache_enable_at_startup = 1
let g:NeoComplCache_DisableAutoComplete = 1
imap <silent><C-K> <Plug>(neocomplcache_snippets_expand)
smap <silent><C-K> <Plug>(neocomplcache_snippets_expand)
" Recommended key-mappings.
" " <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" " <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" " Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

"
" Doxygen Config
"
let g:DoxygenToolkit_commentType = "php"
let g:DoxygenToolkit_briefTag_pre=""
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns "
let g:DoxygenToolkit_authorName="vissong"

"-----------------------------------------------------------------
"" plugin - NERD_commenter.vim 注释代码用的
" [count],cc 光标以下count行逐行添加注释(7,cc)
" " [count],cu 光标以下count行逐行取消注释(7,cu)
" " [count],cm 光标以下count行尝试添加块注释(7,cm)
" " ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释
" " 注：count参数可选，无则默认为选中行或当前行
" "-----------------------------------------------------------------

let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看

" Turn syntax highlighting on
syntax on

"
" GLOBAL SETTINGS
"

" show line number
set number

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Allow backspacing over everything
set backspace=indent,eol,start

" Insert mode completion option
set completeopt=menu,longest,preview

" Use UTF-8 as the default buffer encoding
set enc=utf-8
" set encoding=cp936
" set fileencodings=ucs-bom,utf-8,cp936
" set fileencoding=chinese
" set fileencodings=ucs-bom,utf-8,chinese
set ambiwidth=double
set fencs=utf-8,gbk,gb2312


" Remember up to 100 'colon' commmands and search pattern
set history=100
" Enable incremental search
set incsearch

" Always show status line, even for one window
set laststatus=2

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

" Don't highlight results of a search
 set hlsearch

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as character
set nrformats=octal,hex,alpha

" Use F10 to toggle 'paste' mode
set pastetoggle=<F10>
"set buftype=''
" Show line, column number, and relative position within a file in the status line
set ruler

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" Round indent to multiple of 'shiftwidth' for > and < command
set shiftround

" Use 4 spaces for (auto)indent
set shiftwidth=4

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Don't request terminal version string (for xterm)
set t_RV=

" Use 4 spaces for <Tab> and :retab
set tabstop=4

" Write swap file to disk after every 50 character
set updatecount=50

" Remember things between session
"
" '20  - remember marks for 20 previous file
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.viminfo

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif


" Fix my <Backspace> key (in Mac OS X Terminal)
" set t_kb=
" fixdel

" netRW: Open files in a split window
let g:netrw_browse_split = 1

"" del space
" map ds delete space
" nmap <silent> <F11> :%s/\s\+$//g<CR>
"map  ds v:%s/\s\+$//g<CR>
"vmap ds  :%s/\s\+$//g<CR>

" Generic highlight change
highlight Comment cterm=none ctermfg=Gray
highlight IncSearch cterm=none ctermfg=Black ctermbg=DarkYellow
highlight Search cterm=none ctermfg=White ctermbg=4
highlight String cterm=none ctermfg=DarkGreen
highlight treeDir cterm=none ctermfg=Cyan
highlight treeUp cterm=none ctermfg=DarkYellow
highlight treeCWD cterm=none ctermfg=DarkYellow
highlight netrwDir cterm=none ctermfg=Cyan

"
" NERDTree configuration
"

" Increase window size to 35 column
let NERDTreeWinSize=25

" use space instead of tab
set expandtab
set list
set listchars=tab:>-,trail:-

autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
map <C-D> :w<CR>:call CleanupBuffer(1)<CR>:noh<CR>
function! CleanupBuffer(keep)
    " Skip binary files
    if (&bin > 0)
        return
    endif
    " Remove spaces and tabs from end of every line, if possible
    silent! %s/\s\+$//ge
    " Save current line number
    let lnum = line(".")
    " number of last line
    let lastline = line("$")
    let n        = lastline
    " while loop
    while (1)
        " content of last line
        let line = getline(n)
        " remove spaces and tab
        if (!empty(line))
            break
        endif
        let n = n - 1
    endwhile
    " Delete all empty lines at the end of file
    let start = n+1+a:keep
    if (start < lastline)
        execute n+1+a:keep . "," . lastline . "d"
    endif
    " after clean spaces and tabs, jump back
    exec "normal " . lnum . "G"
endfunction

" 侦测文件类型
filetype on
"
" " 载入文件类型插件
filetype plugin on
"
" " 为特定文件类型载入相关缩进文件
filetype indent on

noremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" set tags+=/data/home/vissong/tags/tags


"
" MAPPINGS START
"

" save change
map ,s :w<CR>
" exit vim without saving any change
map ,q :q!<CR>
" exit vim saving change
map ,w :x<CR>
" switch to upper/lower window quickly
map <C-J> <C-W>j
map <C-K> <C-W>k
" use CTRL-F for omni completion
imap <C-F> 
" map ,f to display all lines with keyword under cursor and ask which one to
" jump to
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" use <F6> to toggle line number
nmap <silent> <F6> :set number!<CR>
" page down with <Space>
nmap <Space> <PageDown>
" open filename under cursor in a new window (use current file's working
" directory)
nmap gf :new %:p:h/<cfile><CR>
" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" map ca :date<cr>

" map <F11> to toggle NERDTree window
nmap <silent> <F11> :NERDTreeToggle<CR>
" map <F12> to toggle Tlist window
map <silent> <F12> :TlistToggle<CR>

" map fe :set fileencoding<CR>

:map 11 :tabnext 1<CR>
:map 22 :tabnext 2<CR>
:map 33 :tabnext 3<CR>
:map 44 :tabnext 4<CR>
:map 55 :tabnext 5<CR>
:map 66 :tabnext 6<CR>
:map 77 :tabnext 7<CR>
:map 88 :tabnext 8<CR>

imap <C-E> <ESC>ddi
vmap <C-E> <ESC>ddi

map <C-P> :!php -l %<CR>

"
" MAPPINGS END
"

" statusline config
set statusline=%1*%F%m%r%h%w " filename and status
set statusline+=%2* " color
set statusline+=%= " right algin
set statusline+=%2*\ %{&ff} " filesystem
set statusline+=%3*\ \<\ %{&fenc} " fileencode
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")} " file bom
set statusline+=\ %6*[%Y] " filetype
set statusline+=%6*[POS=%l,%v][%p%%] " position
set statusline+=%6*%{strftime(\"%H:%M\")} " date

" set t_Co=128
hi User1 ctermbg=2 ctermfg=8 cterm=bold
hi User2 ctermbg=9 ctermfg=3 guifg=#000000  guibg=#F4905C
hi User3 ctermbg=9 ctermfg=6
hi User4 ctermbg=7 ctermfg=8
hi User5 ctermbg=9 ctermfg=10
hi User6 ctermbg=2 ctermfg=8 cterm=bold
hi User7 ctermbg=11 ctermfg=12
hi User8 ctermbg=13 ctermfg=14
hi User9 ctermbg=15 ctermfg=16
hi User0 ctermbg=17 ctermfg=18


