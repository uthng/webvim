"
" WebVim Configuration : global settings
"
" author: Bertrand Chevrier <chevrier.bertrand@gmail.com>
" source: https://github.com/krampstudio/dotvim
" year  : 2015
"

" wrap end of line
set wrap

" show line numbers
set number

" syntax highlighting
syntax on
set background=dark
set t_Co=256
colorscheme mango


"indent
set smartindent
set autoindent
set copyindent
set shiftwidth=4
set shiftround
set backspace=indent,eol,start
set smarttab
set expandtab

"search
set showmatch
set smartcase

set hlsearch
set incsearch


" copy/paste
"set paste
set clipboard=unnamedplus

" folding manual
set foldmethod=manual

" mouse
set mouse=a

" spell check, to be activated manually
set spelllang=en_us
set nospell

" Set switchbuf for open quickfix item in new tab or existing tab
" with vimgrep & copen
set switchbuf+=usetab,newtab

set nobackup        " do not keep a backup file
set noswapfile      " do not create swap file
set autowrite      " auto saves changes when quitting and swiching buffer
set autowriteall

" Auto reload when file changed externally
set autoread       " watch for file changes by other programs
set updatetime=100 " 100 millisec
au BufEnter,BufWinEnter,CursorHold,CursorHoldI * :checktime
au FileChangedShell * echo "Warning: File changed on disk"

set list
set listchars=tab:\|·,eol:¬,trail:·,nbsp:·,extends:»,precedes:«
"Invisible character colors
highlight NonText ctermfg=DarkGrey " ctermbg=
highlight SpecialKey ctermfg=DarkGray

"highlight ExtraWhitespace cterm=standout ctermbg=none
"match  ExtraWhitespace / \+/

"set colorcolumn=80
"highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

"syn match WhiteSpace / / containedin=ALL conceal cchar=·
"setl conceallevel=2 concealcursor=nv
"highlight Conceal ctermfg=DarkGray ctermbg=NONE
"
" Set modeline
set modeline

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'tf': { 'left': '//' } }
