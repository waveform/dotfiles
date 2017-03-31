" heavily inspired by Miller Medeiros .vimrc file
"set rtp+=~/.files/vim
"try
"    source ~/.files/vim.vimrc
"catch
"endtry


set nocompatible
" Section Plugin {{{
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'waveform/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'
Plug 'majutsushi/tagbar'

call plug#end()
" }}}

" Section General {{{

syntax on
filetype plugin indent on

" local dirs
set backupdir=~/.vim/backup
set directory=~/.vim/swap

" spell and encoding
set spelllang=en_us
set encoding=utf-8 nobomb
set fileencodings=utf-8,gbk

" abbr
"abbr funciton function
"abbr teh the
"abbr tempalte template
"abbr fitler filter

" performance / buffer
set hidden             " current buffer can be put into background
set lazyredraw         " don't update the display while executing macros
set ttyfast            " faster redrawing

" history and file handling
set history=256
set undolevels=256
set autoread           " reload files if changed externally

" backup and swap files
set nowritebackup
set noswapfile
set nobackup

" searching and regexp
set ignorecase smartcase
set hlsearch
set incsearch
set gdefault           " RegExp global by default
set magic              " enable extended regexes.

" keys
let mapleader=","
let maplocalleader=";"
set backspace=indent,eol,start " make backspace behave in a sane manner
"set esckeys                   " allow cursor keys in insert mode
set nostartofline              " make j/k respect the columns
"set virtualedit=all           " allow the cursor to go in to 'invalid' places
set timeoutlen=500             " how long it wait for mapped commands
set ttimeoutlen=100            " faster timeout for escape key and others

" }}}

" Section User Interface {{{

let g:solarized_termcolors=256
let g:solarized_visibility='high'
set t_Co=256                   " 256 colors terminal
set background=dark
colorscheme solarized

if has('gui_running')
    set guifont=Monaco:h18
    set guioptions-=T          " remove toolbar
    set guioptions-=L          " left scroll bar
    set guioptions-=r          " right scroll bar
    set guioptions-=b          " bottom scroll bar
    set guioptions-=h          " only calculate bottom scroll size of current line
    set shortmess=atI          " Don't show the intro message at start and
                               "   truncate msgs (avoid press ENTER msgs).
endif

set cursorline                 " highlight current line
set showmode
set laststatus=2               " show the status line all the time
set number
set relativenumber
set report=0                   " show all changes.
set showcmd                    " show incomplete commands
set showmatch                  " show matching braces
set splitbelow splitright
set title                      " show the filename in the window title bar.
set ruler

" scroll
set scrolloff=5        " start scrolling n lines before horizontal border of window.
set sidescrolloff=7    " start scrolling n chars before end of screen
set sidescroll=1       " the minimal number of columns to scroll horizontally.

" command completion
set wildmenu                   " hitting tab in command mode will show possible completions
set wildchar=<TAB>
set wildmode=list:longest      " complete files like a shell
set wildignore+=*.DS_STORE,*.db,*.jpg,*.png,*.gif,*.so,*.swp,*.zip

" diff
set diffopt=filler             " add vertical spaces to keep right and left aligned
set diffopt+=vertical
set diffopt+=iwhite

" folding
set foldmethod=syntax      " fold based on indent
set foldnestmax=5
set nofoldenable           " don't fold by default
set foldlevel=1

" list chars
set listchars=tab:→\ ,trail:⋅,extends:❯,precedes:❮   "eol:¬,
"set showbreak=↪
set fillchars=fold:-
set list

" sounds effects
set noerrorbells
set visualbell

" }}}

" Section Indentation and TextWrap {{{
"
"
" indentation
set expandtab
set autoindent
set smartindent
set cindent
set nocopyindent
set smarttab
set softtabstop=4  " edit as if the tabs are 4 characters wide
set tabstop=4      " the visible width of tabs
set shiftwidth=4   " number of spaces to use for indent and unindent
set shiftround     " round indent to a multiple of 'shiftwidth'

" wrap
set nowrap
"set wrapmargin=8
"set textwidth=120
"set colorcolumn=+1    " show large lines
set formatoptions=qrnl " automatic formating.
set formatoptions-=o   " don't start new lines with comment leader on pressing 'o'

set nomodeline         " don't use modeline (security)
set pastetoggle=<leader>p    " paste mode: avoid auto indent, treat chars as literal.

" }}}

" Section Others {{{
"set linebreak         " set soft wrapping

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " highlight conflicts
match ErrorMsg /TODO|FIXME/

set clipboard=unnamed

set completeopt+=longest       " completion mode on insert mode
"set mat=2              " how many tenths of a second to blink
set synmaxcol=256      " faster when opening files with large lines, default is 3000

" }}}

" Section Home-made Mapping and Function {{{
" reload vimrc file
noremap <leader>r :so $MYVIMRC<CR>
" close quickfix and locationlist windows
noremap <leader>c :ccl <bar> lcl<CR>

" mapping tab for intent
"nnoremap <tab> V>
"nnoremap <s-tab> V<
"vnoremap <tab> >gv
"vnoremap <s-tab> <gv
"[DEPRECATED] #use below commands instead of it
" another reason is we want to keep functionality of Ctrl+I
" 5>>, 3<<, 4==
" >%, =%, <%, ]p
" =i{, =a{, =2a{
" >i{, <i{

" reformat code
"nnoremap <leader>rf gg=G

" strip trailing whitespace
function! StripWhitespace()
    let old_cursor = getpos('.')
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', old_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
noremap <leader>a  :Ag 

" }}}

" Section Plugins {{{
" NERDTree
map <silent> <c-e> :NERDTreeToggle<CR>
let NERDTreeIgnore=['.DS_Store', '.git']
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=0
let NERDTreeHighlightCursorline=1

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"let g:ctrlp_use_caching = 0
let g:ctrlp_custom_ignore = {
  \ 'dir' : '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pdf|o|docx|pyc|d|a)$',
  \ 'link': '',
  \ }

" YouCompleteMe
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_confirm_extra_conf = 0
let g:ycm_python_binary_path = 'python'
let g:syntastic_always_populate_loc_list = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_filetype_whitelist = { 'cpp' : 1, 'hpp' : 1, 'c' : 1, 'h' : 1}
let g:ycm_filetype_blacklist = { 'hex' : 1, 'txt' : 1 }
"let g:ycm_complete_in_comments = 1
"let g:ycm_complete_in_strings = 0
"let g:ycm_key_invoke_completion = '<c-a>'

" Ag
let g:ag_prg="ag --vimgrep --smart-case"
let g:ag_working_path_mode="r"

" Tabular
noremap <silent> <leader>t: :Tabularize /:<CR>
noremap <silent> <leader>t= :Tabularize /=<CR>
noremap <silent> <leader>t, :Tabularize /,<CR>
noremap <silent> <leader>t" :Tabularize /"<CR>
noremap <silent> <leader>t\| :Tabularize /\|<CR>

" Easy Motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0 " disable default mapping
" s{char}{char} to move to {char}{char}
map  s <Plug>(easymotion-bd-f2)
nmap s <Plug>(easymotion-overwin-f2)
" move to line
map  <leader>l <Plug>(easymotion-bd-jk)
nmap <leader>l <Plug>(easymotion-overwin-line)

" vim-tmux-navigator
"let g:tmux_navigator_save_on_switch = 2
let g:tmux_navigator_disable_when_zoomed = 1

" }}}

