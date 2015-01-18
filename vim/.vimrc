set nocompatible               " be iMproved
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'



" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on
set number
set tabstop=8
set showmatch
set colorcolumn=81
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

"set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim

