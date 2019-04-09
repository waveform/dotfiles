" heavily inspired by Miller Medeiros .vimrc file
set rtp+=~/dotfiles/vim/

set nocompatible
" Section Plugin {{{
call plug#begin('~/dotfiles/vim/.vim/plugged')

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'sunaku/vim-dasht'
Plug 'jiangmiao/auto-pairs'
Plug 'Chiel92/vim-autoformat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'waveform/vim-colors-solarized'

call plug#end()
" }}}

" Section General {{{

syntax on
filetype plugin indent on

" local dirs
set backupdir=~/dotfiles/vim/.vim/backup
set directory=~/dotfiles/vim/.vim/swap

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

set clipboard+=unnamedplus

set completeopt+=longest       " completion mode on insert mode
"set mat=2              " how many tenths of a second to blink
set synmaxcol=256      " faster when opening files with large lines, default is 3000

set grepprg=rg\ --vimgrep

" }}}

" Section Home-made Function {{{
" strip trailing whitespace
function! StripWhitespace()
    let old_cursor = getpos('.')
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', old_cursor)
    call setreg('/', old_query)
endfunction

function! TestBackend()
    call job_start('tmux send-keys -t right C-z "python nnx_compiler_testbench_backend.py all -j 4" Enter')
endfunction

function! RebuildTags()
    call jobstart(['/bin/sh', '-c', 'rm -f tags && ctags -R --languages=python'])
endfunction
" }}}

" Section Plugins {{{

" FZF
let g:fzf_buffers_jump = 1 " [Buffers] Jump to the existing window if possible

"Strip
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* FindX call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --type-add "wave:include:readme,txt,py,make,lua,py,log,json,h,c,cpp,config,cmake" --color "always" '.shellescape(<q-args>), 1, <bang>0)
"command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --type-add "wave:include:readme,txt,py,make,lua,py,log,json,h,c,cpp,config,cmake" --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" vim-tmux-navigator
let g:tmux_navigator_disable_when_zoomed = 1

" dasht
let g:dasht_filetype_docsets = {}
let g:dasht_filetype_docsets['python'] = ['(num|sci)py', 'pandas']
let g:dasht_filetype_docsets['cpp'] = ['^c$']
let g:dasht_filetype_docsets['html'] = ['css', 'js']

" netrw
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" use below commands to do indent
" another reason is we want to keep functionality of Ctrl+I
" 5>>, 3<<, 4==
" >%, =%, <%, ]p
" =i{, =a{, =2a{
" >i{, <i{

" Section Home-made Mapping {{{
nnoremap <silent> <leader>a  :Find<SPACE><C-R><C-W><CR>
nnoremap <silent> <leader>b  :Buffers<CR>
" close quickfix and locationlist windows
noremap  <silent> <leader>c  :ccl <bar> lcl<CR>
nnoremap <silent> <leader>d  :call Dasht([expand('<cword>'), expand('<cWORD>')])<Return>
nnoremap <silent> <leader>f  :GFiles<CR>
nnoremap <silent> <leader>h  :History<CR>
nnoremap <silent> <leader>m  :Marks<CR>
" reload vimrc file
noremap  <silent> <leader>r  :so $MYVIMRC<CR>
noremap           <leader>s  :w<CR>



" search tag about the word under cursor
nnoremap          <leader>tt :ts<SPACE><C-R><C-W><CR>
" reload file
noremap  <silent> <leader>rr :edit!<CR>
" toggle hybrid line numbers
nnoremap <silent> <leader>ln :set nu! rnu!<CR>
" toggle netrw window
nnoremap <silent> <leader>ex :Lexplore<CR>
" strip trailing whitespace
noremap           <leader>ss :call StripWhitespace()<CR>
" reformat code
noremap           <leader>rf :Autoformat<CR>
" toggle scrolling sync
nnoremap <silent> <leader>sb :set scb!<CR>
" rebuild tags
nnoremap          <leader>rt :call RebuildTags()<CR>

tnoremap          <Esc> <C-\><C-n>

"nnoremap          <leader>ff :Files<SPACE>
"nnoremap <silent> <leader>t  :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>
"nnoremap <silent> <leader>hp :Helptags<CR>
nnoremap          <leader>rg :FindX<SPACE>
nnoremap          <leader>cc :Make clang++ -std=c++14 -g "%"<CR>
noremap           <leader>bb :call TestBackend()<CR>

autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
autocmd FileType netrw setl bufhidden=wipe

" }}}
