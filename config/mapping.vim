"
" WebVim Configuration : global mapping
"
" author: Bertrand Chevrier <chevrier.bertrand@gmail.com>
"

" leader
let g:mapleader = ","
let g:localmapleader = "\\"

" move the current line below
nnoremap <leader>- ddp

" move the current line above
nnoremap <leader>_ ddkP

" switch tab
nnoremap <S-right> :tabn<CR>
nnoremap <S-left> :tabp<CR>
nnoremap <S-s> :tabs<CR>
nnoremap <S-t> :tabe

" Quickfix
nnoremap <leader>co :copen<CR>:set modifiable<CR>
nnoremap <leader>cn :cn<CR>
nnoremap <leader>cp :cp<CR>
"nnoremap <leader>cc :cclose<CR>

" insert mode uppercase the current word
"  <esc> : go to normal mode
"  v 	 : visual mode
"  iw 	 : select the current word
"  U 	 : uppercase selection
"  i 	 : back to insert mode
inoremap <c-u> <esc>viwUi

" remove last search highlight
nnoremap <C-l> :nohlsearch<CR><C-l>

" Wrap a word in double quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Wrap a word in single quotes
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" select inside parents
onoremap in( :<c-u>normal! f(vi(<cr>

" select inside braces
onoremap in{ :<c-u>normal! f{vi{<cr>

" select inside brackets
onoremap in[ :<c-u>normal! f[vi[<cr>

" Open MYVIMRC in a vsplit
nnoremap <leader>ev :split $MYVIMRC<cr>

" Source MYVIMRC
nnoremap <leader>sv :source $MYVIMRC<cr>

" Open TlistToggle
nnoremap <silent> <s-l> :TlistToggle<CR>

" Toggle mouse
nnoremap <s-m> :call ToggleMouse()<CR>
function! ToggleMouse()
  if &mouse == 'a'
    set mouse=
    echo "Mouse usage disabled"
  else
    set mouse=a
    echo "Mouse usage enabled"
  endif
endfunction

" Normal operations
map <C-a> ggVG
map <S-w> :w!<cr>
"map <S-z> u
"map <S-v> v
"map <S-y> y
"map <S-p> p

map <S-c> :close
map <S-q> :q!<cr>
map <tab> >><Esc>
map <S-tab> <<<Esc>
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" Toggle line number
"nmap <C-N><C-N> :set invnumber<CR>
nmap <S-N><S-N> :set invnumber<CR>

" Toggle mode copy
nmap <S-C><S-C> :set nonu mouse= nolist<CR>
nmap <S-E><S-E> :set nu mouse=a list<CR>

" Toggle mode paste to keep ident while pasting from other application
nmap <S-P><S-P> :set invpaste paste?<CR>
set pastetoggle=<leader>p
set showmode

if g:hardcoreMode == 1

    " Leave insert mode (like <esc>) and disable <esc>
    inoremap jk <esc>
    inoremap <special> <esc> <nop>
    inoremap <esc>^[ <esc>^[

    " Disable arrow keys

    nnoremap <up> <nop>
    nnoremap <down> <nop>
    nnoremap <left> <nop>
    nnoremap <right> <nop>

    inoremap <up> <nop>
    inoremap <down> <nop>
    inoremap <left> <nop>
    inoremap <right> <nop>
endif


