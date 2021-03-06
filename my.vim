" Sets
set nocompatible
set nofoldenable
set nu
set modelines=0
"add some line space for easy reading
set linespace=4
" Включаем мышку даже в текстовом режиме
" (очень удобно при копировании из терминала, т. к. без этой опции,
" например, символы табуляции раскладываются в кучу пробелов).
set mouse=a
" Опции автодополнения - включаем только меню с доступными вариантами
" автодополнения (также, например, для omni completion может быть
" окно предварительного просмотра).
set completeopt=menu
" Выключаем перенос строк
set nowrap
" Отключаем создание бэкапов
set nobackup
" Отключаем создание swap файлов
set noswapfile
" Список кодировок файлов для автоопределения
set fileencodings=utf-8,cp1251,koi8-r,cp866
" Перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
"set whichwrap=b,s,<,>,[,],l,h
set scrolloff=3
"Задаем символ для отображения табов
set listchars=tab:>-
set list
" Включает виртуальный звонок (моргает, а не бибикает при ошибках)
set novisualbell "don't beep
set hidden
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
" TODO need not save if not a file
"au FocusLost * :wa!
" Searching
set hlsearch " highlight search
set incsearch " incremental search, search as you type
set ignorecase " Ignore case when searching lowercase
set gdefault

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" Keep some stuff in the history
set history=100

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Automatically read a file that has changed on disk
set autoread

" Использовать системный буфер обмена 
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
"set clipboard=unnamed

let php_sql_query=1
let php_htmlInStrings=1
let mapleader=','

let g:netrw_list_hide='.*\.pyc$,^\.[^.]'
let g:netrw_banner=0
let g:netrw_special_syntax=1
" Netrw Help
"-      Makes Netrw go up one directory
"a      Toggles between normal display, hiding, showing
"d      Make a directory
"i      Cycle between thin, long, wide, and tree listings
"mb     Bookmark current directory
"md     Apply diff to marked files (up to 3)
"me     Place marked files on arg list and edit them
"mf     Mark a file
"mg     Grep inmarked files
"<c-h>  Edit file hiding list
"qb     List bookmarked directories and history
"qf     Display information on file

" Проверка орфографии
"set spell
"setlocal spell spelllang=en,ru

"Map
" Перейти в каталог с файлом
" :E
"map <C-^> :edit %:p:h<CR>
"Insert newline without entering insert mode
map <S-Enter> O<Esc>
map <CR> o<Esc>
" Сохранить файл
map <C-s> :w<cr>
" Быстро редактируем и перегружаем .vimrc
nmap <silent> <leader>ev <C-w><C-s><C-j>:e $HOME/.vim/my.vim<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" Стрелки зло
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
" Легкая навигация между окнами
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap ; :
nmap <silent> <leader>/ :nohlsearch<CR>
" Все равно записать, пофиг что нельзя
cmap w!! w !sudo tee % >/dev/null
" Yank/paste to the OS clipboard with ,y and ,p
"nmap <leader>y "+y
"nmap <leader>Y "+yy
"nmap <leader>p "+p
"nmap <leader>P "+P

" Открывает окно quickfix
" TODO Возможно сделать по аналогии с буферами, чтобы в этом же окне
"      появлялся список ошибок, при выборе перебрасывало в сам файл в
"      этом же окне
" TODO Сделать открытие/закрытие окна
" http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window
nmap <silent> <leader>cw :botright cwindow<CR>

" Легкая горизонтальная прокрутка
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh
" Переход по тегам
map <C-]> g<C-]>

" по звездочке не прыгать на следующее найденное, а просто подсветить
nnoremap * *N

" в визуальном режиме по команде * подсвечивать выделение
vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR>

" Копирует до конца строки
nnoremap Y y$

" CSS соединение свойст в одну строку и разделение на несколько
nmap <Leader>j :SplitjoinJoin<cr>
nmap <Leader>s :SplitjoinSplit<cr>

" Забываем Esc
"imap jj <esc>

"Autocommand
"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning
" MDX syntax
autocmd BufRead,BufNewFile *.mdx set syntax=mdx filetype=mdx
autocmd BufRead,BufNewFile *.txt setlocal textwidth=70 nowrap nonumber
autocmd FileType html,xhtml,smarty setlocal nonumber
autocmd FileType html,xhtml set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal wrap nonumber
autocmd FileType php set iskeyword+=$

" Перезагрузка .vimrc файла после сохранения, чтобы изменения применились
" сразу
if has("autocmd")  
    augroup myvimrchooks  
        au!  
        autocmd bufwritepost my.vim source $MYVIMRC
    augroup END  
endif  

"Bundles
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
let snippets_dir = '$HOME/.vim/snippets'
ino <tab> <c-r>=TriggerSnippet()<cr>
snor <tab> <esc>i<right><c-r>=TriggerSnippet()<cr>

Bundle 'bufexplorer.zip'
Bundle 'EnhCommentify.vim'
"Bundle 'AutoClose'
Bundle 'ctags.vim'
Bundle 'matchit.zip'
Bundle 'php.vim'

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

"Syntax
Bundle 'mdx.vim'
Bundle 'smarty-syntax'

" Favorite color schemes
Bundle 'pyte'
Bundle 'darkspectrum'
Bundle 'Lucius'
Bundle 'Solarized'
Bundle 'lilypink'

" Other color schemes
"Bundle 'atom'
"Bundle 'bclear'
"Bundle 'blueshift'
"Bundle 'cobaltish'
"Bundle 'earendel'
"Bundle 'ir_black'
"Bundle 'jellybeans'
"Bundle 'liquidcarbon'
"Bundle 'mac_classic'
"Bundle 'mayansmoke'
"Bundle 'molokai'
"Bundle 'newspaper'
"Bundle 'nuvola'
"Bundle 'peaksea'
"Bundle 'sorcerer'
"Bundle 'stackoverflow'
"Bundle 'tesla'
"Bundle 'vylight'
Bundle 'xoria256.vim'
"Bundle 'git://github.com/hukl/Smyck-Color-Scheme.git'

Bundle 'Vimball'

"Bundle 'git@github.com:byzov/mdxquery.git'
"let mdx_config = '/home/byzov_pa/.vim/mdx.config'

" TRY
" ---
Bundle 'splitjoin.vim'
"Bundle 'git://github.com/Lokaltog/vim-powerline.git'
"let g:Powerline_symbols = 'fancy'

"Bundle 'git://github.com/mjbrownie/vim-htmldjango_omnicomplete.git'
"au FileType htmldjango set omnifunc=htmldjangocomplete#CompleteDjango

"Bundle 'pyflakes.vim'
Bundle 'pylint.vim'
" TODO Написать свои настройки для использования pylint, т.к.
"      Этот уже с 2009г не пооддерживается и есть баги,
"      поторые нужно все время править при установке.
"      ИЛИ ПРОТЕСТРОВАТЬ django-lint
let g:pylint_show_rate = 1
"let g:pylint_onwrite = 1
let g:pylint_cwindow = 0
"set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
"set errorformat=%f:%l:\ %m
"autocmd FileType python compiler pylint

" JS lint
"set makeprg=/usr/local/bin/pyjslint\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -conf\ '~/.vim/jslint.conf'\ -process\ %
"set makeprg=jslint-cli\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -process\ %
"set errorformat=%f(%l):\ %m

if has('gui_running')
    " GUI colors
"    colorscheme darkspectrum
    let g:lucius_style = "light"
    colorscheme lucius
    set guifont=Droid\ Sans\ Mono\ 10

    " Remove toolbar, left scrollbar and right scrollbar
    set guioptions=acgi
else
    " Non-GUI (terminal) colors
    let g:lucius_style = "light"
    colorscheme lucius
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

"au BufRead,BufNewFile *.tpl set filetype=html.smarty.javascript

" Включаем подсветку синтаксиса
syntax on


" Statusline
"Add the variable with the name a:varName to the statusline. Highlight it as
"'error' unless its value is in a:goodValues (a comma separated string)
"function! AddStatuslineFlag(varName, goodValues)
"    set statusline+=[
"    set statusline+=%#error#
"    exec "set statusline+=%{RenderStlFlag(".a:varName.",'".a:goodValues."',1)}"
"    set statusline+=%*
"    exec "set statusline+=%{RenderStlFlag(".a:varName.",'".a:goodValues."',0)}"
"    set statusline+=]
"endfunction

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

set statusline+=[%l\ of\ %L] "cursor line/total lines
"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#%{&ff!='unix'?'['.&ff.']':''}%*
"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}%*
"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#warningmsg#%{StatuslineTabWarning()}%*
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

" Переключение раскладки
" http://habrahabr.ru/blogs/vim/98393/
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" Сбрасывать язык при входе в режим вставки
" http://vim.wikia.com/wiki/Insert-mode_only_Caps_Lock
autocmd InsertLeave * set iminsert=0

filetype plugin indent on

" Formatting SQL using SQLParse. Also can
" format MDX query.
" TODO Make a plugin SQLFormat
:com! -range -nargs=0 FSQL
            \ call SQLFormat(<line1>,<line2>)

function! SQLFormat(fl,ll)
" TODO Join short lines
python << EOF
import vim
import sqlparse
import string

# Get function args
start = int(vim.eval('a:fl'))-1
end = int(vim.eval('a:ll'))

# Get selected lines
lines = vim.current.buffer[start:end]
sql = ''.join(lines)

# Remove selected lines
del vim.current.buffer[start:end]

# Generate and add formatted SQL
new_sql = sqlparse.format(sql, reindent=True, keyword_case='upper')
for (i, line) in enumerate(string.split(new_sql, '\n')):
    vim.current.buffer[start+i:start+i] = [line.encode('latin-1')]
# TODO Add new line at the end

# Set cursor on first changed line
vim.current.window.cursor = (start+1, 0)
EOF
endfunction

:com! -range -nargs=0 Mytest
            \ call Mytest(<line1>,<line2>)

function! Mytest(fl,ll)
php << EOF
    print 'OKOK';
EOF
endfunction
