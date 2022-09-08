" originally based from jeffknupps vimrc, then expanded

set nocompatible               " be iMproved
filetype off                   " required!

set foldmethod=indent
set foldlevel=99

set mouse=a " catch mouse clicks for positioning                              
set wrapscan " search fron beginning if end of file is reached


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
let g:vundle_default_git_proto='git'
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'

Plugin 'gmarik/vundle'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-repeat'
Plugin 'ctrlpvim/ctrlp.vim'  " file/buffer finder :CtrlP [starting-directory]
Plugin 'plasticboy/vim-markdown' 
"Plugin 'Valloric/YouCompleteMe'
Plugin 'sjl/gundo.vim'
"Plugin 'vim-syntastic/syntastic'
Plugin 'phleet/vim-mercenary'  " :HGdiff {rev}, :Hgblame
Plugin 'tpope/vim-fugitive'  " :Git {command}, :Gstatus, :Gblame
Plugin 'mhinz/vim-signify'  " show SCM status of lines
Plugin 'itchyny/lightline.vim'
"Plugin 'mitechie/pyflakes-pathogen'
"Plugin 'morhetz/gruvbox'  " retro colour scheme
Plugin 'altercation/vim-colors-solarized'
"Plugin 'psf/black'  " Python code formatter, only works when vim is built
"                    " with Python>=3.6 (:py3 import sys; print(sys.version))
" see also https://github.com/psf/black/issues/1304

let g:signify_vcs_list = [ 'hg', 'git' ]
let g:signify_line_highlight = 1
let g:pycodestyle_map='<leader>8'

call vundle#end()          

" ==========================================================
" Shortcuts
" ==========================================================
let mapleader=","             " change the leader to be a comma vs slash

" sudo write this
cmap W! w !sudo tee % >/dev/null

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

set enc=utf-8                 " the best all-purpose encoding

" don't bell or blink
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif
set vb

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
"autocmd FileType * setlocal colorcolumn=0

""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set wrap                    " Wrap text
set linebreak               " don't wrap text in the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set formatoptions=tcroql    " Setting text and comment formatting to auto
"set textwidth=80            " Lines are automatically wrapped after 80 columns

"""" Reading/Writing
set autowrite               " Stop complaining about unsaved buffers
set autowriteall            " 
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" Paste from clipboard
map <leader>p "+p
" Copy to clipboard
map <leader>c "+y

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

map <C-space> :bn <CR>
map <C-M-space> :bp <CR>

"colorscheme gruvbox
"colorscheme solarized
set background=dark
"set background=light

set noswapfile
if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" GUI
hi DiffText gui=underline guibg=red guifg=black
set guifont=Meslo:h18
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 18
    set linespace=5
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h18
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif


" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

" let g:syntastic_python_checkers = ['pylint']

" disable by default, run pylint via ctrl-w s and open error list window
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" nnoremap <C-w>s :SyntasticCheck<CR> :lopen<CR>



" configure lightline
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

"set statusline+=%{fugitive#statusline()}
