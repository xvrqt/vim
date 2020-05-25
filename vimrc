" Amy Jie - 05/25/2020

" colors
syntax enable       " syntax highlighting
colorscheme monokai " the best colorscheme. looks like sublime text's

" leader shortcuts
let mapleader=" "   " leader is space

" file settings
set encoding=utf-8
set hidden                      "files are hidden, not closed
set backspace=indent,eol,start  "backspaces across lines
set autoread                    "automatically reads outside changes

" spaces and tabs
set expandtab       " tabs are spaces. <tab> == insert 4 space characters
set cindent         " automatically lines up indents across lines
filetype indent on  " turns on filetype detection and allows loading of language specific indentation files

set tabstop=4      " number of visual spaces per tab
set shiftwidth=4   " number of spaces to shift using >
set softtabstop=4  " number of spaces in tab when editing

" UI Config
set showcmd         " show the last command entered in the very bottom right of vim
set showmatch       " highlight matching [{( )}]
set cursorline      " highlight the current line
set ttyfast         " allows for faster scrolling. maybe disable if using a remote term
set laststatus=2    " displays file info at bottom
set scrolloff=5     " at least five lines after cursor. cursor can't get to buttom

" Highlights column 80
set colorcolumn=80
" Highlight characters past column 80
:au bufwinenter * let w:m2=matchadd('errormsg', '\%>80v.\+', -1)

" line numbers
set number          " show line numbers in left hand margin
set relativenumber  " shows the line number

" toggle for relative numbers
function! Numbertoggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
" line number toggle shortcut
nnoremap <leader>l :call Numbertoggle()<cr>

" vim command tab completion
set wildmenu
set wildmode=list:longest

" faster window switching
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" quickly open up .vimrc by pressing leader + rc
nnoremap <leader>rc <c-w>vcc-w>l :e $myvimrc<cr>
" opens a new vertical window
nnoremap <leader>w <c-w>v<c-w>l

set visualbell "instead of beeping diplays

" searching
set hlsearch        " highlight search matches
set incsearch       " search as characters are entered
set ignorecase      " if all lowercase, case insensitive
set smartcase       " if at least one uppercase letter, case sensitive
set gdefault        " defaults to global find/replace

" turn off search highlighting 
nnoremap <leader><n> :nohlsearch<cr>

" folding
set foldenable          " enable folding
set foldmethod=syntax   " fold based on indent level

set foldnestmax=10      " 10 nested fold max. 
set foldlevelstart=5    " most folds opened by default
" ctrl + space opens/closes folds
nnoremap <c-space> za

" movement

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Center the current line vertically
nnoremap <space><space> zz

" Highlights last inserted text
nnoremap gv `[v`]


" El classico
inoremap jk <esc>
inoremap jj <esc>
inoremap jk <esc>
inoremap kj <esc>
inoremap kk <esc>

" Semicolon can be used as a colon
nnoremap ; :

" Saves anytime focus is lost from the vim file
au focuslost * :w

" Tabs are allowed if makefile
autocmd filetype make setlocal noexpandtab shiftwidth=8 softtabstop=0 
" saves a vim session (reopen with vim -s)
nnoremap <leader>s :mksession<cr>

" Spellcheck
set spell spelllang=en_us
" Fix spellings
nnoremap <leader>f 1z=
" Toggle spelling
nnoremap <leader>s :set spell!<cr>

" Return to last line edited upon opening (automatic '")
if has("autocmd")
  au bufreadpost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\" zz" | endif
endif

" Distraction free writing toggle
nnoremap <s-d> :goyo<cr>

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{syntasticstatuslineflag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Nerdtree
" Open nerdtree on empty file
autocmd stdinreadpre * let s:std_in=1
autocmd vimenter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Toggle nerdtree with ctrl+n
map <c-n> :NERDTreeToggle<cr>
" Close NERDTree if it's the last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
