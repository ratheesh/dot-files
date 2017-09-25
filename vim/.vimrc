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

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

Plug 'Shougo/vimproc.vim', { 'do': 'make' }

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-expand-region'
Plug 'adelarsq/vim-matchit'
Plug 'justinmk/vim-sneak'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim'
Plug 'easymotion/vim-easymotion'
Plug 'edkolev/promptline.vim'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'raimondi/delimitmate'
" Plug 'oblitum/rainbow'

call plug#end()

filetype plugin indent on
set number
set tabstop=8
set showmatch
set showcmd
" set colorcolumn=81
execute "set colorcolumn=" . join(range(81,335), ',')
" set columns=80
set ruler
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmode=longest,list
set nobackup
set noswapfile
set fileformats=unix,dos,mac
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set showcmd
set nowrap
set backspace=indent,eol,start
set autoindent
set autoread
set autowrite
set cursorline
if exists('+breakindent')
	set breakindent showbreak=\ +
endif
set foldmethod=marker
set lazyredraw
set linebreak
set copyindent
set encoding=utf-8
set laststatus=2
set t_Co=256
set fillchars="vert:|,fold:-"

let mapleader = "\<Space>"

" general config

" Remember last buffers loaded and file position
set viminfo='10,\"100,:20,%,n~/.viminfo'
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Theme setting
syntax on
color darktheme

nmap <leader>bn :bnext<cr>
nmap <leader>bp :bprev<cr>
map <F9> :bprev<cr>
map <F10> :bnext<cr>
nmap <Leader>k :bdelete<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

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

" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0

" Rainbow delimiters
" au FileType c,cpp,objc,objcpp call rainbow#load()
" let g:rainbow_active = 1
" let g:rainbow_ctermfgs = [66, 30, 95, 60, 93]

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
	let g:ctrlp_user_command = 'ag %s --hidden -l --nocolor -g ""'
endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_show_hidden = 1

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>r :CtrlPMRU<CR>
nnoremap <Leader>m :CtrlPMixed<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q<CR>
nmap <Leader><Leader> V

nnoremap <leader>t :TagbarOpenAutoClose<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:indentLine_faster=1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" colorscheme solarized

"Expand region
map K <Plug>(expand_region_expand)
"End of File
