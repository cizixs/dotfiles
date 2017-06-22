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
set wildmenu    " visual autocomplete for command menu
set showmatch   " highlight matching [{()}]
set lazyredraw
set mouse=a	"enable using mouse
"""}


"""{indent and space
""" space is important in python, using whitespace instead of tab gives more 
""" flexablity.
set tabstop=4	"tab equals 4 spaces when showing
set expandtab	"convert tab to space
set softtabstop=4 " replace tab with spaces when inserting
set shiftwidth=4	"number of spaces to use for autoindenting

set backspace=indent,eol,start	"allow backspace
set whichwrap+=<,>,h,l
set autoindent	"auto indent
set autoread
set copyindent
set smartindent
set shiftround
set smarttab
set lbr
set tw=500	"line break on 500 characters
let mapleader="," "set , as leader
"""}

"""search
set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <leader><space> :nohlsearch<CR>

"""file-relate
filetype indent on
filetype plugin on
filetype plugin indent on
set nobackup
set noswapfile
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
set foldlevelstart=10
set foldnestmax=10
" set foldcolumn=4	"show fold levels on the left


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
" execute pathogen#infect()

""" vim bundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'airblade/vim-gitgutter'
Plugin 'davidhalter/jedi-vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'Konfekt/FastFold'
Plugin 'kshenoy/vim-signature'
Plugin 'Lokaltog/vim-powerline'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplete.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/a.vim'
Plugin 'wincent/command-t'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']

let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = {'mode': 'active', 'passvive_filetypes': ['go'] }

""" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

""" NerdTree
autocmd vimenter * NERDTree "auto open nerdtree
autocmd vimenter * if !argc() | NERDTree | endif
"toggle nerdtree with Enter key
map <C-n> :NERDTreeToggle<CR> 
"close nerdtree if it is the last open panel
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"ignore certain files
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\~$']

"Taglist
map <f3> :TlistToggle<CR>
set tags=./tags;/  "find tags upto root, so you can find tag files anywhere in your repo
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
""" FastFold
let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding=1
let g:php_folding=1
let g:perl_fold=1

"""JSHint2
let jshint2_read = 1
let jshint2_close = 0
let jshint2_max_height=8

"""Vim-Javascript
let g:javascript_plugin_jsdoc = 1

"" Add virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif
