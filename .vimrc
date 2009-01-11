colorscheme zenburn
syntax on
 
filetype plugin indent on
" Строка статуса
set wildmenu
set wildignore=*.o,*~,*.swp,*.bak
set laststatus=2	" значение 2 указывает, что строка статуса всегда должна показываться;
set statusline=%F%m%r%h%w\ [%4l,%3v][%3p%%]\ [enc=%{&encoding}]\ [%{strftime(\"%d.%m.%y\ -\ %H:%M\")}]

set guifont=Monospace\ 10
set nocompatible
set backspace=indent,eol,start
"set backup	    	" keep a backup file
set history=150		" keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd	        " display incomplete commands
set incsearch       " do incremental searching
set nu			    " Нумерация строк
set cursorline      "
set guioptions-=T	" 
set nowrap 		    " не разрывать строку
set smartindent		" Умные отступы 
set expandtab		" Преобразование табов в пробелы 
set mousehide 		" Скрывать указатель мыши при наборе текста
set mouse=a		    " Включить пеоддержку мишы
set mousemodel=popup 
set nohlsearch 		" Отключаем подстветку найденных вариантов, и так всё видно.
set ignorecase		" Инорировать прописные/строчные при поиске
set smarttab 
set tabstop=4		" Количество пробелов для табуляции
set softtabstop=4	" Позволяет удалять таб-символы как таб-символы (но реально удаляется n пробелов)
set shiftwidth=4	" Количество пробелов которое используется в командах отступа, например >>, или <<; 

set list            " Включить подсветку невидимых символов
set listchars=tab:>-,trail:·,eol:$

set nobackup        " Отключаем создание бэкапов
set noswapfile      " Отключаем создание swap файлов
set t_Co=256

"set dir=~/.vim/swp " Все swap файлы будут помещаться в эту папку
"inoremap { {<CR>}<Esc>O

nmap <F2>  :w!<CR>
nmap <F3>  :TlistToggle<CR>
nmap <F4>  :Explore<CR>
nmap <F5>  :BufExplorer<CR>
nmap <F6>  :MRU<CR>

nmap <F9>  :%!perltidy<CR>
nmap <F10> :emenu Spell.<TAB>
nmap <F11> :!perl %<CR>
nmap <F12> :q! <CR>

"проверка орфографии
set wcm=<Tab>
menu Spell.ru    :set spell spelllang=ru<CR>
menu Spell.ua    :set spell spelllang=uk<CR>
menu Spell.ru,en :set spell spelllang=ru,en<CR>
menu Spell.ua,en :set spell spelllang=uk,en<CR>
menu Spell.en    :set spell spelllang=en<CR>
menu Spell.off   :set nospell<CR>

" макс длинна строки
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.*/
