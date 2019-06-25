" Amy Jie - 01/31/2016

" Colors
colorscheme monokai	" The best colorscheme. Looks like Sublime Text's
syntax enable		    " Syntax highlighting

" Spaces and Tabs
set expandtab		  " Tabs are spaces. <Tab> == Insert 4 space characters

set tabstop=2 		" Number of visual spaces per tab
set shiftwidth=2  " Number of spaces to shift using >
set softtabstop=2	" Number of spaces in tab when editing

" UI Config
set number 		      " Show line numbers in left hand margin
set showcmd         " Show the last command entered in the very bottom right of Vim
set showmatch       " Highlight matching [{( )}]
set cursorline      " Highlight the current line
filetype indent on  " Turns on filetype detection and allows loading of language specific indentation files

" Searching
set hlsearch        " Highlight search matches
set incsearch       " Search as characters are entered
" Turn off search highlighting with ,<space>
nnoremap <leader><space> :nohlsearch<CR>

" Folding
set foldenable          " Enable folding
set foldmethod=syntax   " fold based on indent level

set foldnestmax=10      " 10 nested fold max. 
set foldlevelstart=10   " Most folds opened by default
" <space> opens/closes folds
nnoremap <space> za

" Movement

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Center the current line vertically
nnoremap <space><space> zz

" highlights last inserted text
nnoremap gV `[v`]

" Highlights column 80
set colorcolumn=80

" Leader Shortcuts
let mapleader=","       " leader is comma
" el classico
inoremap jk <esc>

" Saves a vim session (reopen with vim -S)
nnoremap <leader>s :mksession<CR>

" Spellcheck
set spell spelllang=en_us
" Fix spellings
nnoremap <leader>f 1z=
" Disable spelling
nnoremap <leader>s :set spell!

" Custom Functions
" Highlight characters past column 80
:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

" Return to last line edited upon opening (automatic '")
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\" zz" | endif
endif

" Distraction free writing toggle
nnoremap <S-d> :Goyo<CR>

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NERDTree
" Open NERDTree on empty file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
" Close Vim if NERDTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
