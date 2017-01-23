" Section Plugin {{{

"filetype off

"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'
"Plugin 'sickill/vim-monokai'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'scrooloose/nerdtree'
"Plugin 'tpope/vim-fugitive'
"Plugin 'rking/ag.vim'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'Raimondi/delimitMate'
"Plugin 'godlygeek/tabular'

"call vundle#end()
"filetype plugin indent on

" }}}

"set rtp+=~/dotfiles/vim

"try
"source ~/dotfiles/vim/my.vim
"catch
"endtry


" Section General {{{

" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter

set nocompatible
set autoread

set history=256
"set textwidth=120

set backupdir=~/.vim/backup
set directory=~/.vim/swap

" }}}

" Section User Interface {{{

syntax on
colorscheme monokai

" make the highlighting of tabs and other non-text less annoying
" highlight SpecialKey ctermbg=none ctermfg=8
" highlight NonText ctermbg=none ctermfg=8

" make comments and HTML attributes italic
" highlight Comment cterm=italic
" highlight htmlArg cterm=italic

set guifont=Monaco:h18
set t_Co=256

set number
set relativenumber

set nowrap
"set wrapmargin=8
"set linebreak        " set soft wrapping
"set showbreak=…      " show ellipsis at breaking

set autoindent
set smartindent

" toggle invisible characters
set list
set listchars=tab:→\ ,trail:⋅,extends:❯,precedes:❮   "eol:¬,
"set showbreak=↪

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" make backspace behave in a sane manner
set backspace=indent,eol,start

" Tab control
set expandtab
set smarttab
set tabstop=4      " the visible width of tabs
set softtabstop=4  " edit as if the tabs are 4 characters wide
set shiftwidth=4   " number of spaces to use for indent and unindent
set shiftround     " round indent to a multiple of 'shiftwidth'
set completeopt+=longest

" code folding settings
set foldmethod=syntax  " fold based on indent
set foldnestmax=10
set nofoldenable       " don't fold by default
set foldlevel=1

set clipboard=unnamed

set ttyfast            " faster redrawing
set diffopt+=vertical
set laststatus=2       " show the status line all the time
set so=7               " set 7 lines to the cursors - when moving vertical
set wildmenu           " enhance command line completion
set hidden             " current buffer can be put into background
set showcmd            " show incomplete commands
"set noshowmode         " don't show which mode, disabled for PowerLine
set wildmode=list:longest  " complete files like a shell
set scrolloff=3        " lines of text around cursor
set shell=$SHELL
set cmdheight=1        " cmd bar height
set ruler
set title

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch
set nolazyredraw       " don't redraw while executing macros

set magic              " set magic on, for regex

set showmatch          " show matching braces
set mat=2              " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

" }}}

"common conf {{
"set nowritebackup
"set noswapfile
"set nobackup
set cursorline
"set modelines=0
set synmaxcol=128
"set ttyscroll=10
set encoding=utf-8
set fileencodings=utf-8,gbk

if exists("&undodir")
  set undodir=~/.vim/undo
endif

"}}

"mapping
" for intent
nnoremap <tab> V>
nnoremap <s-tab> V<
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" Section Plugins {{{
" NERDTree
map <silent> <c-e> :NERDTreeToggle<CR>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\.(git|hg|svn|pyc|o)$'

" ToggleNERDTree
let NERDTreeShowHidden=1

" YouCompleteMe
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_confirm_extra_conf = 0
let g:ycm_python_binary_path = 'python'
let g:syntastic_always_populate_loc_list = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_complete_in_comments = 1
"let g:ycm_complete_in_strings = 1
"let g:ycm_key_invoke_completion = '<c-a>'

" Ag
let g:ag_working_path_mode="r"

" }}}
