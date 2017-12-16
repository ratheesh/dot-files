" Copyright (C) 2017  Ratheesh <ratheeshreddy@gmail.com>
" Author: Ratheesh <ratheeshreddy@gmail.com>
"
" This program is free software; you can redistribute it and/or
" modify it under the terms of the GNU General Public License
" as published by the Free Software Foundation; either version 2
" of the License, or (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <http://www.gnu.org/licenses/>.

" Bootstrap settings {{{
" set nocompatible               " be iMproved
if &compatible | set nocompatible | endif
set hidden
filetype off                  " required!
"}}}

" Plugins {{{
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

" Plug 'wincent/terminus'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-sensible'
Plug 'rstacruz/vim-opinion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
" Plug 'mhinz/vim-signify'
" Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale' " This requires vim > v.8.0 with +timers +job +channel
Plug 'terryma/vim-expand-region'
Plug 'adelarsq/vim-matchit'
" Plug 'justinmk/vim-sneak'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'd11wtq/ctrlp_bdelete.vim'
" Plug 'the9ball/ctrlp-gtags'
" Plug 'mattn/ctrlp-mark'
Plug 'mattn/ctrlp-register'
" Plug 'mattn/ctrlp-git'
" Plug 'imkmf/ctrlp-branches'
" Plug 'thiderman/ctrlp-project'
Plug 'ivalkeen/vim-ctrlp-tjump'
" Plug 'thiderman/ctrlp-project'
" Plug 'sgur/ctrlp-extensions.vim'
" Plug 'fisadev/vim-ctrlp-cmdpalette'
" Plug 'jasoncodes/ctrlp-modified.vim'
" Plug 'DavidEGx/ctrlp-smarttabs'
" Plug 'JazzCore/ctrlp-cmatcher'
Plug 'FelikZ/ctrlp-py-matcher'
" Plug 'lokikl/vim-ctrlp-ag'
" Plug 'ivan-cukic/vim-ctrlp-cscope'
Plug 'dbeecham/ctrlp-commandpalette.vim'
Plug 'brookhong/cscope.vim'
Plug 'Vaelatern/vim-script-refactor'
" Plug 'pelodelfuego/vim-swoop'
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'yggdroot/leaderf'
" Plug 'gcavallanti/vim-noscrollbar'
" Plug 'wikitopian/hardmode' " Make life under ViM little difficult!
Plug 'takac/vim-hardtime'
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim'
" Plug 'mbbill/undotree'
" Plug 'simnalamburt/vim-mundo'
Plug 'easymotion/vim-easymotion'
Plug 'mtth/scratch.vim'
" Plug 'vheon/vim-cursormode'
" Plug 'edkolev/promptline.vim'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'Yggdroot/indentLine'
if !has('nvim')
Plug 'thaerkh/vim-indentguides'
endif
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'
Plug 'ratheesh/git_patch_tags.vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
" Plug 'ap/vim-buftabline'
" Plug 'unblevable/quick-scope'
" Plug 'rhysd/clever-f.vim'
Plug 'ratheesh/vim-extended-ft'
Plug 'machakann/vim-highlightedyank'
" Plug 'WolfgangMehner/c-support'
Plug 'vim-scripts/AutoAlign'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Plug 'tpope/vim-commentary'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'vim-scripts/YankRing.vim'
" Plug 'haya14busa/incsearch.vim'
" Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'antoyo/vim-licenses'
Plug 'kshenoy/vim-signature'
" Plug 'MattesGroeger/vim-bookmarks'
" Plug 'mattn/ctrlp-mark'
" Plug 'shinnya/ctrlp-jumplist'
" Plug 'kien/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow'
" Plug 'tpope/vim-characterize'
Plug 'adelarsq/vim-matchit'
Plug 'vitalk/vim-shebang'
Plug 'tpope/vim-endwise'
" Plug 'vim-scripts/taglist.vim'
" Plug 'ervandew/supertab'
Plug 'vim-scripts/OmniCppComplete'
Plug 'rking/ag.vim'
Plug 'sjl/vitality.vim'
" Plug 'gelguy/Cmd2.vim'
" Plug 'jalvesaq/vimcmdline'
Plug 'rhysd/vim-grammarous'
" Plug 'pelodelfuego/vim-swoop'
" Plug 'python-mode/python-mode'
" Plug 'fatih/vim-go' , { 'do': ':GoInstallBinaries' }
" Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'ntpeters/vim-airline-colornum'
" Plug 'Shougo/neocomplete.vim'
Plug 'christoomey/vim-tmux-navigator'
" Plug '~/.vim/local/c_std'
Plug 'nsf/gocode'
Plug 'lilydjwg/colorizer'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  " Plug 'zchee/deoplete-clang'
  " Plug 'tweekmonster/deoplete-clang2'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'zchee/deoplete-jedi'
  Plug 'zchee/deoplete-go' , { 'do': 'make'}
  Plug 'eagletmt/neco-ghc'
  Plug 'zchee/deoplete-zsh'
endif

" Haskell plugins
Plug 'itchyny/vim-haskell-indent'
Plug 'sdiehl/haskell-vim-proto'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'

call plug#end()
"}}}

" ViM generic settings {{{
filetype plugin indent on
set number relativenumber
if !has('nvim')
  set esckeys
endif
set nostartofline
set numberwidth=1
set tabstop=8
set bs=2
" set ww=<,>,h,l
set showmatch
set matchtime=1
set showcmd
" set colorcolumn=81
execute "set colorcolumn=" . join(range(81,335), ',')
" set columns=80
set ruler
set nofoldenable    " disable folding
if has('wildmenu')
	set nowildmenu
	set wildmode=list:longest,full
	set wildoptions=tagfile
	set wildignorecase
	set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
	set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
	set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
	set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
	set wildignore+=__pycache__,*.egg-info
endif
" Abbreviations of messages and avoid 'hit enter' prompt
set shortmess+=aoOtTIc
" Ask for confirmation (instead of aborting an action)
set confirm
" Shorten default to time to update swap files and gutter plugins
set updatetime=500
" Time in milliseconds waited for a mapping to complete
set timeoutlen=550
" Time in milliseconds waited for a key code to complete
set ttimeoutlen=0
set wildmenu
set nobackup
set noswapfile
set fileformats=unix,dos,mac
set magic
" What to save for views:
set viewoptions-=options
set viewoptions+=slash,unix
set viewoptions=cursor,folds,unix,slash,curdir
set viewdir=$CACHE/tmp/view
set ignorecase
set smartcase
set smarttab
set gdefault
set magic
set hlsearch
set incsearch
set history=1000
if has("persistent_undo")
" Persistent undo (i.e vim remembers undo actions even if file is closed and
" reopened)
    set undofile
    set undolevels=100   " Maximum number of changes that can be undone
    set undoreload=1000  " Maximum number lines to save for undo on a buffer reload
    set undodir=$HOME/.vim/.undotree/
endif
" Show filename and path in window title (even in terminal)
set title
set showcmd
set nowrap
set backspace=indent,eol,start
set autoindent
set autoread
set autowrite
set cursorline
" set cursorcolumn
if exists('+breakindent')
  set breakindent showbreak=\ +
endif
set linebreak
if has('linebreak')
  set breakindent
  let &showbreak = '↳ '
  set cpo+=n
end
set hidden   " See http://items.sjbach.com/319/configuring-vim-right
set wmh=0    " Windows need not have height
set foldmethod=marker
set lazyredraw
" set copyindent
set gcr=a:blinkon0              " Disable cursor blink
if has('clipboard')
	set clipboard& clipboard+=unnamedplus
endif
set encoding=utf-8
set scrolloff=3       " Show next 3 lines while scrolling.
set sidescrolloff=5   " Show next 5 columns while side-scrolling.
set laststatus=2
if !has('gui_running')
set t_Co=256  " Support for 256 colors
endif
set noshowmode
" set fillchars="vert:\│,fold:-"
set fillchars+=vert:\│
" set list
" set listchars+=eol:↲
set fillchars+=diff:⣿
set completeopt+=preview
set cscopetag
" $ for change command instead of deleting word then insert
set cpoptions+=$

" Spell checking
setglobal spell spelllang=en_us
" By default spelling is off...
" set nospell
" ...but enable it for the English text files I use a lot.
au BufRead,BufNewFile,BufWrite *.txt,*.tex,*.latex set spell

" Set scroll margin to 0 in git commit buffers to avoid cursor in non-zero pos
" au BufRead,BufNewFile,BufWrite *.stgit*,COMMIT_EDITMSG set scrolloff=0

" Skip the splash screen
" set shortmess+=I
set novb
if !has('nvim')
        set ttyfast
endif
set formatoptions+=1
set formatoptions+=c  " Autowrap comments using textwidth
set formatoptions+=j  " Delete comment character when joining commented lines
set formatoptions+=l  " do not wrap lines that have been longer when starting insert mode already
set formatoptions+=n  " Recognize numbered lists
set formatoptions+=o  " Insert comment leader after hitting o or O in normal mode
set formatoptions+=q  " Allow formatting of comments with "gq".
set formatoptions+=r  " Insert comment leader after hitting <Enter>
" set formatoptions+=t  " Auto-wrap text using textwidth"
set nostartofline
set lbr

" Show the effect of substitute incrementally
if has('nvim')
    set inccommand=nosplit
endif

" set iskeyword-=_

" let python_highlight_all=1

" nvim/vim
" if has('nvim')
    " set inccommand=split
    " set viminfo+=n.vim-nviminfo
" else
    " set viminfo+=n.vim-viminfo
" endif
" Remember last buffers loaded and file position
if has('nvim')
        "  ShaDa/viminfo:
	"   ' - Maximum number of previously edited files marks
	"   < - Maximum number of lines saved for each register
	"   @ - Maximum number of items in the input-line history to be
	"   s - Maximum size of an item contents in KiB
	"   h - Disable the effect of 'hlsearch' when loading the shada
  set viminfo=%,<800,'300,/50,:100,s10,h,f0,n$HOME/.config/nvim/viminfo
else
  set viminfo=%,<800,'300,/50,:100,h,f0,n$HOME/.viminfo
endif

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
autocmd BufWritePost
    \ * if &l:filetype ==# '' || exists('b:ftdetect')
    \ |   unlet! b:ftdetect
    \ |   filetype detect
    \ | endif

let mapleader = "\<Space>"
" }}}

" General Config {{{
" hooks
" Relative linenumbers disabled in insertmode
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Set default file types for specific file names
autocmd BufNewFile,BufRead .bashrc*,bashrc,bash.bashrc,.bash_aliases,.bash_profile*,.bash_logout*,*.bash,*.ebuild set filetype=sh
autocmd BufNewFile,BufRead .zshrc,zshrc,.zprofile,zprofile,.zshenv,zshenv,.zimrc,zimrc,.zlogin,zlogin,.zlogout,zlogout set filetype=sh
autocmd BufNewFile,BufRead .stgit* set filetype=gitcommit
autocmd FileType gitcommit setlocal expandtab " Expand tabs in git commit mode
autocmd FileType gitcommit setlocal scrolloff=0
autocmd VimEnter COMMIT_EDITMSG if getline(1) == '' | execute 1 | startinsert | endif
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0]) " set cursor position to starting on gitcommit buffers
autocmd FileType vim setlocal expandtab " Expand tabs in vim mode
autocmd FileType python setlocal expandtab " Expand tabs in python mode
autocmd BufRead,BufNew,BufNewFile gitconfig setlocal ft=gitconfig " git config file
autocmd BufRead,BufNew,BufNewFile *.md,*.markdown,*.mkd setlocal ft=markdown

" Save when buffer command takes one to another file and when losing focus
set autowrite
augroup focus_lost
    au!
    au FocusLost * silent! wall
augroup END

" Little welcome message!
autocmd VimEnter * echo "Willkommen zum meinem ViM Welt! (^-^)"
autocmd VimEnter * set noshowmode

" Treat c-header as C source file type
let g:c_syntax_for_h = 1
autocmd BufNewFile,BufRead .h set filetype=ch

" keybindings
" disable arrow key navigation to break bad habit
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>

" set pastetoggle=<F2> " Paste mode to avoid indented paste
" nmap <Leader><Leader> :
" imap jj <Esc>
imap <Esc> l
vmap <Esc> l
inoremap jj l
vnoremap jj l
nnoremap ' `
nnoremap ` '
if  has('nvim')
nnoremap <silent><Leader>so     :source ~/.config/nvim/init.vim<CR>
else
nnoremap <silent><Leader>so     :source $MYVIMRC<CR>
endif
nnoremap <silent><Leader>w      :w<CR>
" nnoremap <silent><Leader>ws     :w !sudo tee %
nnoremap <silent><Leader>x      :x<CR>
nnoremap <silent><Leader>q      :q<CR>
nnoremap <silent><Leader>qn     :q!<CR>
nnoremap <silent><Leader>qp     :pclose<CR>
nnoremap <silent><Leader>ql     :lcl<CR>

" Move across vim split Windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Increase/decrease size and width (left, down, up and right) using ctrl-alt
nnoremap <C-A-h> <C-w>2<
nnoremap <C-A-j> <C-w>2+
nnoremap <C-A-k> <C-w>2-
nnoremap <C-A-l> <C-w>2>

" Horizontal and vertical splits
nnoremap <silent><Leader>sp :split<CR>
nnoremap <silent><Leader>vs :vsplit<CR>

" Make current window the only one on screen
nnoremap <A-o> <C-w>ozv

" nnoremap <Leader>j :
nmap <silent><Leader><Leader> V
" map <F9>                  :bprev<CR>
" map <F10>                 :bnext<CR>
map <F5>                  :echo expand('%:p')<CR>
nmap <silent><Leader>bd           :bdelete<CR>
nmap <silent><Leader><Backspace>  :nohlsearch<CR>
nmap <silent><Leader>bh           :Startify<CR>
nmap <silent><Leader><Tab>        :b#<CR>
" nnoremap <Leader>[        :let @+ = expand("%")<CR>

" visual indentation (does not exit Visual mode after indentation)
" make shift+tab and tab indent
vmap <Tab>   >gv
vmap <S-Tab> <gv
imap <S-Tab> <C-o><<

" Toggle keybindings
set pastetoggle=<Leader>tp
nnoremap <silent><Leader>tg :GitGutterSignsToggle<CR>
nnoremap <silent><Leader>ta :ALEToggle<CR>
nnoremap <silent><Leader>ts :SignatureToggleSigns<CR>

" folding
" Close all folds and open and focus on fold containing current line
nnoremap <silent><Leader>z zMzvzz
" Make zm and zr work as zM and zR respectively
nnoremap zm zM
nnoremap zr zR

" Use <tab> to move between bracket pairs (related to matchit plugin)
map <tab> %
" }}}

" Theme {{{
syntax on
color darktheme
" }}}

" Tagbar {{{
nmap <silent><F8>            :TagbarToggle<CR>
nnoremap <silent><leader>tt  :TagbarOpenAutoClose<CR>
" }}}

" C/C++ {{{
let g:ch_syntax_for_h           = 1
let g:c_conditional_is_operator = 1
let c_no_if0                    = 0
let g:c_no_if0                  = 0
" }}}

" Doxygen {{{
let g:load_doxygen_syntax = 1
" }}}

" Vim-airline {{{
" let g:airline_highlighting_cache = 0

" Appearance
let g:airline_powerline_fonts = 1
let g:airline_theme           = 'darkmode' " sane ones -> ubaryd sol wombat bubblegum
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif

if has('nvim')
  set mouse=nicr
else
  set mouse=a
endif
" let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#whitespace#enabled         = 0
" let g:airline_skip_empty_sections                   = 1
let g:airline#extensions#capslock#enabled           = 1
let g:airline_detect_spelllang                      = 0
let g:airline_detect_modified                       = 1
let g:airline#parts#ffenc#skip_expected_string      = 'utf-8[unix]'
let g:airline_detect_paste                          = 1
let g:airline#extensions#virtualenv#enabled         = 1
let g:airline#extensions#ctrlp#show_adjacent_modes  = 1
let g:airline#extensions#tagbar#enabled             = 1
let g:airline#extensions#virtualenv#enabled         = 1
let g:airline#extensions#wordcount#enabled          = 1
let g:airline#extensions#tagbar#enabled             = 1
let g:airline#extensions#tagbar#flags               = 'f'
let g:airline#extensions#wordcount#formatter        = 'default'
let g:airline#extensions#wordcount#format           = '%dWords'
" let g:airline#extensions#wordcount#filetypes        = ''

" vcs
let g:airline#extensions#vimagit#enabled             = 1
let g:airline#extensions#hunks#non_zero_only         = 1
let g:airline#extensions#branch#enabled              = 1
let g:airline#extensions#branch#displayed_head_limit = 20

let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.spell = 'Ꞩ'
" let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.readonly = ''

" Customize Airline Layout
function! AirlineInit()
    call airline#parts#define_accent('mode', 'italic')
    call airline#parts#define_accent('branch', 'italic')
    call airline#parts#define_raw('linenr', '%l')
    call airline#parts#define_accent('linenr', 'bold')
    call airline#parts#define_raw('modified', '%{&modified ? "[+]" : ""}')
    call airline#parts#define_accent('modified', 'red')
    " call airline#parts#define_accent('readonly', 'bold')
    let g:airline_section_a = airline#section#create_left(['mode','crypt','paste','keymap','capslock','iminsert', '%l:%v«ch:%02B»'])
    let g:airline_section_b = airline#section#create(['hunks'])
    let g:airline_section_c = airline#section#create(['readonly',' %f', 'modified'])
    let g:airline_section_x = airline#section#create_right(['tagbar','filetype'])
    let g:airline_section_y = airline#section#create_right(['ffenc'])
    let g:airline_section_z = airline#section#create_right(['branch','windowswap','obsession','%p%%'])
endfunction

autocmd User AirlineAfterInit,AirlineAfterTheme call AirlineInit()
" autocmd VimEnter * call AirlineInit()

" Error checking
" let g:airline#extensions#syntastic#enabled   = 1
let g:airline#extensions#ale#enabled      = 1
let airline#extensions#ale#warning_symbol = 'ω:'
let airline#extensions#ale#error_symbol   = 'Ԑ:'

" Tabline settings
let g:airline#extensions#tabline#enabled          = 1
let g:airline#extensions#tabline#buffers_label    = 'Buffers'
let g:airline#extensions#tabline#tabs_level       = 'Tabs'
let g:airline#extensions#tabline#fnamemod         = ':t'
let g:airline#extensions#tabline#formatter        = 'unique_tail_improved'
let g:airline#extensions#tabline#show_splits      = 1
let g:airline#extensions#tabline#show_tab_type    = 1
let g:airline#extensions#tabline#show_tab_nr      = 1
let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#tab_min_count    = 1
let g:airline#extensions#tabline#show_tab_type    = 1
let g:airline#extensions#tabline#exclude_preview  = 1
let airline#extensions#tabline#disable_refresh    = 0
let g:airline#extensions#tabline#buffer_idx_mode  = 1
nmap <silent><leader>1 <Plug>AirlineSelectTab1
nmap <silent><leader>2 <Plug>AirlineSelectTab2
nmap <silent><leader>3 <Plug>AirlineSelectTab3
nmap <silent><leader>4 <Plug>AirlineSelectTab4
nmap <silent><leader>5 <Plug>AirlineSelectTab5
nmap <silent><leader>6 <Plug>AirlineSelectTab6
nmap <silent><leader>7 <Plug>AirlineSelectTab7
nmap <silent><leader>8 <Plug>AirlineSelectTab8
nmap <silent><leader>9 <Plug>AirlineSelectTab9
nmap <silent><leader>h <Plug>AirlineSelectPrevTab
nmap <silent><leader>l <Plug>AirlineSelectNextTab
if !exists('g:airline_powerline_fonts')
        let g:airline#extensions#tabline#left_sep      = ''
        let g:airline#extensions#tabline#left_alt_sep  = '|'
        let g:airline#extensions#tabline#right_sep     = ''
        let g:airline#extensions#tabline#right_alt_sep = '|'
endif

" let g:airline#extensions#tabline#excludes = ['COMMIT_EDITMSG']
let g:airline#extensions#tabline#buffer_idx_format = {
        \ '0': '⁰ ',
        \ '1': '೧ ',
        \ '2': '೨ ',
        \ '3': '೩ ',
        \ '4': '೪ ',
        \ '5': '೫ ',
        \ '6': '೬ ',
        \ '7': '೭ ',
        \ '8': '೮ ',
        \ '9': '೯ '
        \ }

autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

" let g:airline#extensions#default#section_truncate_width = {
                        " \ 'c': 30,
                        " \ }

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'Normal',
      \ 'i'  : 'Insert',
      \ 'R'  : 'Replace',
      \ 'c'  : 'Cmd',
      \ 'v'  : 'Visual',
      \ 'V'  : 'V-Line',
      \ '' : 'V-Block',
      \ 's'  : 'Subst',
      \ 'S'  : 'Subst-Ln',
      \ '' : 'Subst-Blk',
      \ }

" }}}

" lightline {{{
let g:lightline = {
        \ 'colorscheme': 'Dracula',
        \ 'active': {
        \   'right': [ [ 'lineinfo' ],
        \              [ 'percent' ],
        \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ],
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
        \       },
        \ 'enable': {
        \       'statusline': 1,
        \       'tabline': 1,
        \ },
        \ 'component': {
        \   'charvaluehex': '0x%B'
        \ },
        \ 'component_function': {
        \   'gitbranch': 'fugitive#head'
        \ },
        \ }
"}}}

" Vim-licenses {{{
let g:licenses_copyright_holders_name = 'Ratheesh <ratheeshreddy@gmail.com>'
let g:licenses_authors_name           = 'Ratheesh S'
let g:licenses_default_commands       = ['gplv2', 'mit']
" }}}

" vim-sneak{{{
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
let g:sneak#label  = 1
let g:sneak#s_next = 1
"}}}

" CtrlP {{{
let g:ctrlp_extensions = [ 'tag', 'buffertag', 'quickfix', 'undo', 'line',
        \ 'changes', 'mixed', 'cscope', 'jumplist', 'marks', 'register' ]

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
        let g:ctrlp_user_command = 'ag %s --hidden -l --nocolor -g ""'
        let g:ctrlp_use_caching = 0
else
        set grepprg=ag\ --nogroup\ --nocolor
        let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
        let g:ctrlp_clear_cache_on_exit = 0
endif

let g:ctrlp_lazy_update =  300

" let g:ctrlp_by_filename = 0
" let g:ctrlp_follow_symlinks = 0

" if executable('fzf')
        " nnoremap <Leader>ff :FZF<CR>
" endif

let g:ctrlp_match_window = 'min:1,max:10,results:100'
" let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_match_current_file = 0

" let g:ctrlp_map             = '<Leader>p'
let g:ctrlp_cmd               = 'CtrlPBuffer'
let g:ctrlp_show_hidden       = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers      = ['.ctrlp']
let g:ctrlp_mruf_exclude      = '\v\.git/(COMMIT_EDITMSG|MERGE_MSG|index)'
let g:ctrlp_max_files         = 200000
" let g:ctrlp_mruf_relative   = 1
set autochdir

nnoremap <silent><Leader>fo :CtrlP<CR>
nnoremap <silent><Leader>fb :CtrlPBuffer<CR>
nnoremap <silent><Leader>fr :CtrlPMRU<CR>
nnoremap <silent><Leader>ft :CtrlPBufTag<CR>
nnoremap <silent><Leader>fT :CtrlPBufTagAll<CR>
nnoremap <silent><Leader>fj :CtrlPJumpList<CR>
nnoremap <silent><Leader>fp :CtrlPRegister<CR>
nnoremap <silent><leader>fc :CtrlPCommandPalette<cr>
" nnoremap <Leader>fm :CtrlPMixed<CR>

let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn)$',
        \ 'file': '\v\.(exe|so|o|dll|stgit*)$',
        \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
        \ }
let g:ctrlp_custom_ignore = '\v\~$|\.git/COMMIT_EDITMSG$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
" }}}

" ctrlp-funky {{{
nnoremap <silent><Leader>fu :CtrlPFunky<CR>
" Narrow the list down with a word under cursor
nnoremap <silent><Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<CR>
let g:ctrlp_funky_matchtype        = 'path'
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_nolim            = 1
" }}}

" ctrlp_bdelete {{{
call ctrlp_bdelete#init()
"}}}

" vim-ctrlp-tjump {{{
nnoremap <silent><c-]> :CtrlPtjump<CR>
vnoremap <silent><c-]> :CtrlPtjumpVisual<CR>
let g:ctrlp_tjump_only_silent = 1
" }}}

" ctrlp-extensions {{{
nnoremap <silent><Leader>fy :CtrlPYankring<CR>
let g:ctrlp_yankring_limit           = 100
let g:ctrlp_yankring_highlight       = 1
let g:ctrlp_yankring_use_textchanged = 1
let g:ctrlp_yankring_minimum_chars   = 2
" }}}

" vim-swoop {{{
" nmap <Leader>l :call Swoop()<CR>
" vmap <Leader>l :call SwoopSelection()<CR>
" let g:swoopIgnoreCase = 1
" let g:swoopAutoInsertMode = 0
" }}}

" vim-ctrlp-ag {{{
" nnoremap <c-f> :CtrlPag<CR>
" vnoremap <c-f> :CtrlPagVisual<CR>
nnoremap <silent><leader>ca :CtrlPagLocate
nnoremap <silent><leader>cp :CtrlPagPrevious<CR>
let g:ctrlp_ag_ignores = '--ignore .git
    \ --ignore "deps/*"
    \ --ignore "_build/*"
    \ --ignore "node_modules/*"'
" }}}

" supertab  {{{
let g_SuperTabDefaultCompletionType="context"
"}}}

" vim-startify {{{
let g:startify_custom_header = get(g:, 'startify_custom_header', [
  \'',
  \'',
  \'			 _    __ _  __  ___ __',
  \'			| |  / /(_)/  |/  // /',
  \'			| | / // // /|_/ // /',
  \'			| |/ // // /  / //_/',
  \'			|___//_//_/  /_/(_)',
  \'',
  \'',
  \ ])
  " }}}
let g:startify_bookmarks = [
                        \       {'c': '~/.vimrc'     },
                        \       {'g': '~/.gitconfig' },
                        \       {'s': '~/.screenrc'  },
                        \       {'t': '~/.tmux.conf' },
                        \       {'z': '~/.zshrc'     },
                        \ ]
" }}}

" vim-gitgutter {{{
let g:gitgutter_override_sign_column_highlight = 0
if exists('&signcolumn')  " Vim 7.4.2201
        set signcolumn=yes
else
        let g:gitgutter_sign_column_always = 1
endif

let g:gitgutter_eager = 1 " Update when switching/writing buffers
" autocmd FileType tagbar,nerdtree setlocal signcolumn=no

let g:gitgutter_sign_modified = '='

nmap <silent><Leader>gn <Plug>GitGutterNextHunk
nmap <silent><Leader>gp <Plug>GitGutterPrevHunk
nmap <silent><Leader>ga <Plug>GitGutterStageHunk
nmap <silent><Leader>gr <Plug>GitGutterRevertHunk
nmap <silent><Leader>gu <Plug>GitGutterUndoHunk
nmap <silent><Leader>gP <Plug>GitGutterPreviewHunk
" }}}

" vim-signature {{{
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkTextHL        = "SignColumn"
" }}}

" nerd-commentar {{{
let g:NERDSpaceDelims            = 1
let g:NERDCompactSexyComs        = 1
let g:NERDDefaultAlign           = 'left'
let g:NERDAltDelims_java         = 1
let g:NERDCustomDelimiters       = { 'c': { 'left': '/*','right': '*/' } }
let g:NERDCommentEmptyLines      = 1
let g:NERDTrimTrailingWhitespace = 1
" }}}

" Easymotion {{{
let g:EasyMotion_do_mapping       = 0 " Disable default mappings
nmap <silent><Leader>jj <Plug>(easymotion-overwin-f)
nmap <silent><Leader>jk <Plug>(easymotion-overwin-f2)
nmap <silent><Leader>jl <Plug>(easymotion-overwin-line)
let g:EasyMotion_smartcase        = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout
"}}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger       = "<c-\>"
let g:UltiSnipsJumpForwardTrigger  = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

let g:indentLine_faster            = 1
"}}}

" Doxygen-toolkit {{{
let g:DoxygenToolkit_briefTag_pre = "@Synopsis  "
let g:DoxygenToolkit_paramTag_pre = "@Param "
let g:DoxygenToolkit_returnTag    = "@Returns   "
" let g:DoxygenToolkit_blockHeader  = "--------------------------------------------------------------------------"
" let g:DoxygenToolkit_blockFooter  = "--------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName   = "Ratheesh"
" let g:DoxygenToolkit_licenseTag   = "GPLv2"
" }}}

" ale {{{
let g:ale_sign_column_always   = 1
let g:ale_lint_on_text_changed = 'never'
autocmd BufEnter ControlP let b:ale_enabled = 0
autocmd BufEnter ControlP set nonumber
" }}}

" Syntastic {{{
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list           = 0
let g:syntastic_check_on_open           = 1
let g:syntastic_check_on_wq             = 0
let g:syntastic_reuse_loc_lists         = 0

let g:syntastic_python_checkers         = ['python', 'flake8']
let g:syntastic_python_flake8_post_args = '--ignore=W391'
" }}}

" rainbow_parenthesis {{{
" ((((((((((((((((()))))))))))))))))
let g:rbpt_colorpairs = [
    \ [178,     'RoyalBlue3'    ],
    \ [162,     'SeaGreen3'     ],
    \ [12,      'DarkOrchid3'   ],
    \ [132,     'firebrick3'    ],
    \ [93,      'RoyalBlue3'    ],
    \ [208,     'SeaGreen3'     ],
    \ [126,     'DarkOrchid3'   ],
    \ [94,      'firebrick3'    ],
    \ [198,     'RoyalBlue3'    ],
    \ [166,     'SeaGreen3'     ],
    \ [142,     'DarkOrchid3'   ],
    \ [172,     'firebrick3'    ],
    \ [162,     'RoyalBlue3'    ],
    \ [28,      'SeaGreen3'     ],
    \ [96,      'DarkOrchid3'   ],
    \ [34,     'firebrick3'     ],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
" au VimEnter     * RainbowParenthesesToggle
" au Syntax       * RainbowParenthesesLoadRound
" au Syntax       * RainbowParenthesesLoadSquare
" au Syntax       * RainbowParenthesesLoadBraces
" }}}

"rainbow {{{
let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': [132, 65, 68, 95],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
"}}}

"Expana region {{{
" nmap K <Plug>(expand_region_expand)
" nmap J <Plug>(expand_region_shrink)

call expand_region#custom_text_objects({
    \ 'a]' :1,
    \ 'ab' :1,
    \ 'aB' :1,
    \ 'ii' :0,
    \ 'ai' :0,
    \ 'iI' :0,
    \ 'aI' :0,
    \ 'if' :0,
    \ 'af' :0,
    \ 'ic' :0,
    \ 'ac' :0,
    \ })
" }}}

" YankRing {{{
nmap <silent><leader>y :YRShow<CR>
" put the yankring_history file in ~/.backup
" let g:yankring_history_dir = '~/.backup'
" }}}

" vim-indent-guide {{{
let g:indentguides_ignorelist = ['text', 'vim']
let g:indentguides_spacechar  = '┆'
let g:indentguides_tabchar    = '¦'
let g:indentguides_firstlevel = 0
" }}}

" quick-scope {{{
let g:qs_highlight_on_keys                 = ['f', 'F', 't', 'T']
let g:qs_first_occurrence_highlight_color  = 162
let g:qs_second_occurrence_highlight_color = 130
" }}}

" vim-bookmarks {{{
highlight BookmarkSign ctermbg=234 ctermfg=27
" highlight BookmarkLine ctermbg=194 ctermfg=NONE
" let g:bookmark_sign = '♥'
" let g:bookmark_highlight_lines = 1
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_auto_save               = 1
let g:bookmark_auto_close              = 1
" nmap <leader>mm  :BookmarkToggle<CR>
" nmap <leader>mi  :BookmarkAnnotate<CR>
" nmap <leader>mn  :BookmarkNext<CR>
" nmap <leader>mp  :BookmarkPrev<CR>
" nmap <leader>ma  :BookmarkShowAll<CR>
" nmap <leader>mc  :BookmarkClear<CR>
" nmap <leader>mx  :BookmarkClearAll<CR>
" nmap <leader>mkk :BookmarkMoveUp<CR>
" nmap <leader>mjj :BookmarkMoveDown<CR>
" }}}

" incsearch-fuzzy {{{
map z/ <silent><Plug>(incsearch-fuzzy-/)
map z? <silent><Plug>(incsearch-fuzzy-?)
" }}}

" vim-easyalign {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}

" hardtime {{{
let g:hardtime_timeout                = 2000
let g:hardtime_showmsg                = 1
let g:hardtime_ignore_buffer_patterns = ["NERD.*", "Tagbar.*"]
let g:hardtime_maxcount               = 2
" }}}

" neosnippet {{{
if  has('nvim')
let g:neosnippet#enable_completed_snippet = 1
imap <C-k>     <silent><Plug>(neosnippet_expand_or_jump)
smap <C-k>     <silent><Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <silent><Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <silent><Plug>(neosnippet_expand_or_jump)
endif
" }}}

" deoplete {{{
set completeopt+=noinsert
let g:deoplete#enable_at_startup          = 1
if !has('nvim')
let g:deoplete#enable_yarp                = 1
endif
let g:deoplete#enable_refresh_always      = 1
let g:deoplete#auto_complete_delay        = 50
let g:deoplete#auto_refresh_delay         = 50
let g:deoplete#auto_complete_start_length = 3
let g:deoplete#enable_ignore_case         = 1
let g:deoplete#enable_smart_case          = 1
let g:deoplete#enable_camel_case          = 1
let g:deoplete#file#enable_buffer_path    = 1
let g:deoplete#max_list                   = 25
let deoplete#tag#cache_limit_size         = 10000000
let g:deoplete#complete_method            = "completefunc"
set completeopt=longest,menuone

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> deoplete#close_popup()

inoremap <expr><C-l>   pumvisible() ? deoplete#refresh() : "\<C-l>"
inoremap <expr><Space> pumvisible() ? deoplete#close_popup() : "\<Space>"
" Close popup and delete Airlinebackward character
" inoremap <expr><BS> deoplete#smart_close_popup()."\<BS>"
" Undo completion i.e remove whole completed word (default plugin mapping)
inoremap <expr> <C-g> deoplete#undo_completion()

" let g:deoplete#disable_auto_complete = 1
inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#mappings#manual_complete()
		function! s:check_back_space() abort "{{{
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
		endfunction"}}}

" Use Tab to forward cycle
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

let g:deoplete#sources     = {}
let g:deoplete#sources_   = [] " includes all sources

" Use partial fuzzy matches like YouCompleteMe
call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
call deoplete#custom#set('_', 'converters', ['converter_auto_paren'])
" }}}

" NERDTree {{{
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
" nnoremap <Leader>\ :NERDTreeToggle<CR>
nnoremap <silent><Leader>v :NERDTreeFind<CR>
nnoremap <silent><Leader>] :wincmd w<CR>
" }}}


" cscope {{{
" nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
" nnoremap <leader>fl :call ToggleLocationList()<CR>
let g:cscope_silent = 1

if has("cscope")
        set csprg=/usr/bin/cscope
        set csto=0
        set cst
        set nocsverb
        " add any database in current directory
        if filereadable("cscope.out")
            cs add cscope.out
        " else add database pointed to by environment
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
        set csverb
endif
" }}}

" Misc macros {{{
" Print syntax highlight group for the work under cursor
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}

" Use guicolors in terminal (we seem to need to place this here)
" set termguicolors

" gundo {{{
let g:gundo_prefer_python3=1
let g:gundo_preview_bottom=1
let g:gundo_right=1
nnoremap <silent><Leader>u :GundoToggle<CR>
" }}}

" scratch {{{
" Enable data persistence across sessions
let g:scratch_persistence_file=1
let g:scratch_filetype = 'text'
" }}}

" vim-highlightedyank {{{
map y <Plug>(highlightedyank)
" map Y <Plug>(highlightedyank)
let g:highlightedyank_highlight_duration = 200
hi HighlightedyankRegion ctermfg=180 ctermbg=236 cterm=NONE
" }}}
" Autoload vimrc on save
" autocmd BufWritePost .vimrc source %
" End of File
