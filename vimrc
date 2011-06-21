set nocompatible
set nofoldenable
set nu
set modelines=0

let mapleader=','

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"Bundle 'lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'rails.vim'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'

Bundle 'ack.vim'

Bundle 'snipMate'
ino <tab> <c-r>=TriggerSnippet()<cr>
snor <tab> <esc>i<right><c-r>=TriggerSnippet()<cr>

Bundle 'bufexplorer.zip'
Bundle 'EnhCommentify.vim'
Bundle 'AutoClose'
Bundle 'ctags.vim'
Bundle 'matchit.zip'

Bundle 'taglist.vim'
let Tlist_Ctags_Cmd = "ctags"
let Tlist_WinWidth = 37
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Sort_Type = "name"
let Tlist_Use_SingleClick = 1
let Tlist_Compact_Format = 0
let tlist_php_settings = 'php;c:class;d:constant;f:function'
map <F4> :TlistToggle<cr>

Bundle 'Vimball'
Bundle 'git@github.com:byzov/mdxquery.git'

"add some line space for easy reading
set linespace=4

set bg=dark
if has('gui_running')
    " GUI colors
"    colorscheme pyte
"    colorscheme lucius
    colorscheme darkspectrum
    set guifont=Droid\ Sans\ Mono\ 10

    " Remove toolbar, left scrollbar and right scrollbar
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
else
    " Non-GUI (terminal) colors
"    colorscheme lucius
    let g:solarized_termcolors=256
    colorscheme solarized
endif

" for putty
if &term =~ "xterm"
    "256 color --
    let &t_Co=256
    " restore screen after quitting
    set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
    if has("terminfo")
        let &t_Sf="\ESC[3%p1%dm"
        let &t_Sb="\ESC[4%p1%dm"
    else
        let &t_Sf="\ESC[3%dm"
        let &t_Sb="\ESC[4%dm"
    endif
endif

"autocmd FileType html,xhtml source ~/.vim/scripts/sparkup.vim
autocmd FileType html,xhtml,smarty setlocal nonumber
autocmd FileType html,xhtml set omnifunc=htmlcomplete#CompleteTags
autocmd FileType txt setlocal textwidth=70 wrap nonumber
autocmd FileType css setlocal wrap nonumber
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
let php_sql_query=1
let php_htmlInStrings=1

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

"inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"

"au BufRead,BufNewFile *.tpl set filetype=html.smarty.javascript

" normal copy/paste
"vmap <C-c> y<Esc>i
"vmap <C-x> d<Esc>i
"imap <C-v> <Esc>pi

" Включаем мышку даже в текстовом режиме
" (очень удобно при копировании из терминала, т. к. без этой опции,
" например, символы табуляции раскладываются в кучу пробелов).
set mouse=a

" Опции автодополнения - включаем только меню с доступными вариантами
" автодополнения (также, например, для omni completion может быть
" окно предварительного просмотра).
set completeopt=menu


" Замена табуляции на пробелы
set expandtab
" Размер табуляции
set tabstop=4
" Размер сдвига при нажатии на клавиши << и >>
set shiftwidth=4
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
" Копирует отступ от предыдущей строки
set autoindent
" Включаем 'умную' автоматическую расстановку отступов
set smartindent
" Включаем подсветку синтаксиса
syntax on

" Выключаем перенос строк
set nowrap

" Отключаем создание бэкапов
set nobackup
" Отключаем создание swap файлов
set noswapfile
"" Все swap файлы будут помещаться в эту папку
"set dir=~/.vim/swp

" Список кодировок файлов для автоопределения
set fileencodings=utf-8,cp1251,koi8-r,cp866

" Перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
"set whichwrap=b,s,<,>,[,],l,h

"Insert newline without entering insert mode
map <S-Enter> O<Esc>
map <CR> o<Esc>

"Jump to first non-blank character in the line
map <home> ^

" Searching *******************************************************************
set hlsearch " highlight search
set incsearch " incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase
set gdefault

map <C-s> :w<cr>

" Выделять строку под курсором
"set cursorline

" Statusline
"set statusline=%<%F%h%m%r%h%w%y\ %{strftime(\"%Y-%m-%d\ %H:%M\",getftime(expand(\"%:p\")))}%=\ line\ %l\ \o\f\ %L
set statusline=%f "tail of the filename
set statusline+=%y "filetype
"set statusline+=%#error#%r "read only flag
"git status
set statusline+=%#gitmsg#%{fugitive#statusline()}%*
set statusline+=%#Modif#%m%* "modified flag

hi Modif gui=bold term=reverse cterm=bold ctermbg=12 guifg=#8ae234 guibg=#4e9a06
hi warningmsg gui=bold term=reverse cterm=reverse ctermfg=124 gui=reverse guifg=#dc322f
hi gitmsg term=bold ctermfg=10 gui=bold guifg=#fce94f guibg=#3C3C3C

"set statusline+=%= "left/right separator
"set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
"set statusline+=%c, "cursor column
set statusline+=%=
"set statusline+=%c, "cursor column

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#%{&ff!='unix'?'['.&ff.']':''}%*
"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}%*
"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#warningmsg#%{StatuslineTabWarning()}%*
set statusline+=[L:%L] "cursor line/total lines
"set statusline+=\ %P "percent through file
set laststatus=2

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0
        if tabs && &et
            let b:statusline_tab_warning = '[tab-detected]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning
"-----------------------------------------------------------------

" автоматически переходить в папку где лежит редактируемый файл
autocmd BufEnter * cd %:p:h

" MDX syntax
autocmd BufRead,BufNewFile *.mdx set syntax=mdx filetype=mdx

"-----------------------------------------------------------------
" When editing an .html,.css, or .gtpl file, make Firefox refresh
" after the buffer is saved, preserving the current scroll offset.
"
" Requires:
"       [1]  MozRepl must be installed & running in Firefox
"
"       [2]  Netcat (nc) must be on your path.
"
"       [3]  Firefox & vim are both on the same machine (localhost).
"            Actually, you can fix that if you want by adjusting
"            this script + your MosRepl settings but it's probably
"            a bit of a security risk.
"
" Ok, here's how it works:
"
"   I use echo + netcat (nc) to send a dopey little MosRepl
"   script (see below) to Firefox. All the output is tossed
"   away (2>&1 > /dev/null) because MozRepl is chatty.
"
"   Global variables are used (vimXo, vimYo) to capture the X,Y
"   offset of the web page for vim. Maybe there's a way to not
"   use a global, but I don't know that that might be. After saving
"   the buffer and reloading the browser, scroll to the X,Y offset.
"
" See also:
"   http://wiki.github.com/bard/mozrepl/tutorial
"   http://forums.whirlpool.net.au/forum-replies-archive.cfm/495300.html
"
" Aside:  Line continuation in vimscript is a bit weird;
"         it comes at start of the line you want merged,
"         rather than at the end of the line being broken.
"-----------------------------------------------------------------
"autocmd BufWriteCmd *.html,*.css :call Refresh_firefox()
"function! Refresh_firefox()
"  if &modified
"    write
"    silent !echo  'vimYo = content.window.pageYOffset;
"                 \ vimXo = content.window.pageXOffset;
"                 \ BrowserReload();
"                 \ content.window.scrollTo(vimXo,vimYo);
"                 \ repl.quit();'  |
"                 \ nc localhost 4242 2>&1 > /dev/null
"  endif
"endfunction

set listchars=tab:>-
set list

" Переключение раскладки
" http://habrahabr.ru/blogs/vim/98393/
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" Включает виртуальный звонок (моргает, а не бибикает при ошибках)
set novisualbell "don't beep

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev <C-w><C-v><C-l>:e $HOME/.vim/vimrc<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set hidden

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap ; :

nmap <silent> <leader>/ :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null

" Yank/paste to the OS clipboard with ,y and ,p
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P

set scrolloff=3

" need not save if not a file
"au FocusLost * :wa!

cmap w!! %!sudo tee > /dev/null %

filetype plugin indent on
