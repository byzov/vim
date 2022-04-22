" vim: foldmethod=marker
" Sets {{{
set nocompatible
set foldenable
set nu
set modelines=1
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
" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0
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
"set listchars=tab:>-
"set list
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
" Searching
set hlsearch " highlight search
set incsearch " incremental search, search as you type
set ignorecase " Ignore case when searching lowercase
set gdefault

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" Keep some stuff in the history
set history=1000

" Allow the cursor to go in to 'invalid' places
set virtualedit=all

" Automatically read a file that has changed on disk
set autoread

set cryptmethod=blowfish

set backspace=indent,eol,start

" Настраиваем нормальную работу find и gf
set path=**
set suffixesadd=.php,.py,.tpl,.js,.css
set wildmode=full
set wildmenu

" Убирает задержкупри выходе из визуального режима
set timeoutlen=1000 ttimeoutlen=0

" Использовать системный буфер обмена 
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
"set clipboard=unnamed

let php_sql_query=1
let php_htmlInStrings=1
let mapleader="\<Space>"

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
" }}}

" Maps {{{
" Перейти в каталог с файлом
" :E
"map <C-^> :edit %:p:h<CR>
"Insert newline without entering insert mode
map <Enter> o<Esc>
map <S-Enter> O<Esc>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
"autocmd BufReadPost flake8 nnoremap <buffer> <CR> <CR>

" Сохранить файл
map <C-s> :w<cr>
" Быстро редактируем и перегружаем .vimrc
nmap <silent> <leader>ev <C-w><C-s><C-j>:e $HOME/.vim/my.vim<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" Стрелки зло
map <up> <C-w>5+
map <down> <C-w>5-
map <left> 10zh
map <right> 10zl
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
nmap <silent> <C-o> 4zl
nmap <silent> <C-i> 4zh
" Переход по тегам
map <C-]> g<C-]>

" по звездочке не прыгать на следующее найденное, а просто подсветить
nnoremap * *N

" в визуальном режиме по команде * подсвечивать выделение
vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR>

" Копирует до конца строки
nnoremap Y y$

" Забываем Esc
"imap jj <esc>

nnoremap    <F2> :<C-U>setlocal lcs=tab:>-,trail:- list! list? <CR>

map Q @q
nnoremap <Leader>w :w<CR>

nmap <Leader><Leader> za

map q: :q

" Fugitive
"nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
"nnoremap <space>gt :Gcommit -v -q %:p<CR>
"nnoremap <space>gd :Gdiff<CR>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>
" }}}

" Autocommand {{{
"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning
" MDX syntax
autocmd BufRead,BufNewFile *.md set syntax=markdown filetype=markdown textwidth=72
autocmd BufRead,BufNewFile *.mdx set syntax=mdx filetype=mdx
autocmd BufRead,BufNewFile *.txt setlocal textwidth=72 nowrap nonumber
autocmd FileType html,xhtml,smarty setlocal nonumber
autocmd FileType html,xhtml set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal wrap nonumber
autocmd FileType php set iskeyword+=$
"autocmd FileType python set path+=~/.virtualenvs/sporthit/lib/python2.7/site-packages/**
autocmd BufRead,BufNewFile hg-editor-*.txt set filetype=hgcommit
autocmd Filetype hgcommit set textwidth=72 syntax=hgcommit
autocmd Filetype gitcommit set textwidth=72
autocmd Filetype text set textwidth=72
autocmd BufRead,BufNewFile {Gemfile,Guardfile,Rakefile,Thorfile,Vagrantfile,Appraisals} set ft=ruby

" Перезагрузка .vimrc файла после сохранения, чтобы изменения применились
" сразу
if has("autocmd")  
    augroup myvimrchooks  
        au!  
        autocmd bufwritepost my.vim source $MYVIMRC
    augroup END  
endif  
" }}}

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/ctags.vim'
Plug 'vim-scripts/php.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'posva/vim-vue'
Plug 'hdima/python-syntax'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ekalinin/dockerfile.vim'

call plug#end()
" }}}

set background=dark
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
colorscheme solarized8
let g:airline_powerline_fonts = 1


" Включаем подсветку синтаксиса
syntax on

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
