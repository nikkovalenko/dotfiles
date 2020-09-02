set number
set relativenumber 

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent

set splitright
set splitbelow

set scrolloff=5

set incsearch
set ignorecase
set smartcase
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

set noshowmode
set cmdheight=2

set hidden

set nowrap

set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c

filetype plugin indent on

let mapleader = "\<Space>"

au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" ========================================================
"   plugins
" ========================================================

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'

call plug#end()

" ========================================================
"   keyboard shortcuts
" ========================================================

inoremap jk <esc>
inoremap kj <esc>

tnoremap jk <c-\><c-n>
tnoremap kj <c-\><c-n>

vnoremap jk <esc>
vnoremap kj <esc>

cnoremap jk <esc>
cnoremap kj <esc>

inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>

nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>

vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
vnoremap <up> <nop>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-l> <c-\><c-n><c-w>l

nnoremap <leader>t :call OpenTerminal()<cr>
nnoremap <leader>m :call ToggleMaximizeWindow()<cr>

map <leader>n :nohl<cr>

map H ^
map L $

nnoremap <leader><leader> <c-^>

nnoremap <leader>ln :set rnu!<cr>

" ========================================================
"   plugin settings
" ========================================================

" lightline

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

" gruvbox

let g:gruvbox_bold = '0'
let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox


" nerd tree

map <c-n> :NERDTreeToggle<cr>
let g:NERDTreeMinimalUI = 1

nnoremap <tab> :bnext<cr>
nnoremap <s-tab> :bprevious<cr>
nnoremap <f5> :buffers<cr>:buffer<space>

" ========================================================
"   functions
" ========================================================

function! OpenTerminal()
    vsplit term://zsh
endfunction

let g:maximized = 0
function! ToggleMaximizeWindow()
    if winnr() == 1 && winnr('$') == 1
        return 
    endif

    if g:maximized == 0
        let g:maximized = 1
        wincmd |
        wincmd _
    else
        let g:maximized = 0
        wincmd =
    endif
endfunction
