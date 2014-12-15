""""""""""""""""""""""""""""""""""""""""""""""
"	This is Jack Wu's .vimrc file.
"	Feel free to copy, edit and use it any way you want.
"
"	I will maintain this evety now and then, 
"	if you have any question, write to wuwei4455@gmail.com
"
"""""""""""""""""""""""""""""""""""""""""""""

"""{must have features
"""including basic line no, history
set number	"show line number
set hidden	"hide buffer
set nowrap	"don't wrap lines
set history=1000
set undolevels=1000
set wildignore=*.swap,*.bak,*.pyc,*.class,*~
set title
set showmatch
set mouse=a	"enable using mouse
"""}


"""{indent and space
""" space is important in python, using whitespace instead of tab gives more 
""" flexablity.
set tabstop=4	"tab equals 4 spaces
set backspace=indent,eol,start	"allow backspace
set whichwrap+=<,>,h,l
set autoindent	"auto indent
set copyindent
set smartindent
set shiftwidth=4	"number of spaces to use for autoindenting
set shiftround
set expandtab	"convert tab to space
set smarttab
set lbr
set tw=500	"line break on 500 characters
"""}

"""search
set ignorecase
set smartcase
set hlsearch
set incsearch

"""file-relate
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set nobackup
set noswapfile
filetype plugin indent on
set autoread	"autoread a file when changed from outside
set encoding=utf-8	"set utf8 as default encoding 
set ffs=unix,dos,mac
set wildmenu

"""color and display
syntax enable
syntax on
"colorscheme desert
colorscheme molokai "sublime colorscheme
set background=dark

"""folding
set foldenable
set foldmethod=syntax	"fold methods
"set foldcolumn=4	"show fold levels on the left


"""moving
"line breaker
map j gj
map k gk

"quick search
map <space> /
map <c-space> ?

"switch between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


"""UI
set so=5    "set line to the cursor
set ruler   "show current line
set cmdheight=2
set cursorline

"""others
set magic	"turn magic on for regex
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%
autocmd! bufwritepost _vimrc source %   "make change effective instantly

"use pathoge#infect to install plugin
execute pathogen#infect()


""""plugins

""" NerdTree
autocmd vimenter * NERDTree "auto open nerdtree
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Taglist
map <f3> :TlistToggle<CR>
set tags=tags;  "find tags upto
set autochdir   "change pwd
let Tlist_Show_One_file=1   "only show tags of current file
let Tlist_Exit_Only_Window=1 "exit vim when taglist is the last file
let Tlist_Use_Right_Window=1    "show taglist on the right panel
let g:winManagerWindowLayout='FileExplorer'

"Tagbar
map <C-m> :TagbarToggle<CR>

"powerline
set guifont=PowerlineSymbols "\ for\ Powerline
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\
set t_Co=256
let g:Powerline_cache_enabled = 1
set laststatus=2   " Always show the statusline 

""" Ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

"""" exclude some files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

""""custome file find command
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

""" CommandT
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

""" superTab
"let g:SuperTabDefaultCompletionType = "context"
