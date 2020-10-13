set number
set relativenumber 

set timeoutlen=150

if (has("termguicolors"))
 set termguicolors
endif

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
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'OmniSharp/omnisharp-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-surround'
Plug 'chriskempson/base16-vim'
Plug 'mike-hearn/base16-vim-lightline'
Plug 'itchyny/vim-gitbranch'

call plug#end()

colorscheme base16-tomorrow-night-eighties

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
      \ 'colorscheme': 'base16_eighties',
      \ 'active': {
      \   'right': [['gitbranch']]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" nerd tree

map <c-n> :NERDTreeToggle<cr>
let g:NERDTreeMinimalUI = 1

" fzf 

nnoremap <leader>; :Buffers<cr>
nnoremap <leader>f :Files<cr>

let g:fzf_preview_window = 'right:70%'

" goyo/limelight

let g:limelight_conceal_ctermfg = 'gray'

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" floaterm

let g:floaterm_keymap_new    = '<f7>'
let g:floaterm_keymap_prev   = '<f8>'
let g:floaterm_keymap_next   = '<f9>'
let g:floaterm_keymap_toggle = '<f12>'
let g:floaterm_title         = '$1/$2'
let g:floaterm_width=0.8
let g:floaterm_height=0.8

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
