set nocompatible               " be iMproved
set hidden
filetype off                   " required!


call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'

" Using git URL
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin options
Plug 'nsf/gocode', { 'tag': 'go.weekly.2012-03-13', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'edsono/vim-matchit'
Plug 'justinmk/vim-sneak'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'edkolev/promptline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }

call plug#end()

filetype plugin indent on
set number
set tabstop=8
set showmatch
set showcmd
" set colorcolumn=81
set ruler
set wildignore=*.swp,*.bak
set wildmode=longest,list
set noswapfile
set fileformats=unix,dos,mac
set ignorecase
set smartcase
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set showcmd
set nowrap
set backspace=indent,eol,start
set autoindent
set copyindent
syntax on
set encoding=utf-8
set laststatus=2
set t_Co=256
let mapleader = ","

" general config
nmap <leader>bn :bnext<cr>
nmap <leader>bp :bprev<cr>

"configure individual Plugins
"vim-airline
" let base16colorspace=256  " Access colors present in 256 colorspace
let g:airline_powerline_fonts = 0
let g:airline_theme='wombat'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" colorscheme solarized
"End of File
