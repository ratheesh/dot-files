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
Plug 'junegunn/vim-easy-align', { 'on': '<plug>(LiveEasyAlign)' }

" Using git URL
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin options

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Plug 'wincent/terminus'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
" Plug 'rstacruz/vim-opinion'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'
Plug 'matze/vim-move'
" Plug 'atweiden/vim-dragvisuals'
Plug 'zirrostig/vim-schlepp'
" Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale' " This requires vim > v.8.0 with +timers +job +channel
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-smooth-scroll'
" Plug 'adelarsq/vim-matchit'
" Plug 'justinmk/vim-sneak'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'ratheesh/ctrlp_bdelete.vim'
" Plug 'the9ball/ctrlp-gtags'
" Plug 'mattn/ctrlp-mark'
Plug 'mattn/ctrlp-register'
" Plug 'mattn/ctrlp-git'
" Plug 'imkmf/ctrlp-branches'
" Plug 'thiderman/ctrlp-project'
Plug 'ivalkeen/vim-ctrlp-tjump'
" Plug 'thiderman/ctrlp-project'
Plug 'ratheesh/ctrlp-extensions.vim'
" Plug 'fisadev/vim-ctrlp-cmdpalette'
" Plug 'jasoncodes/ctrlp-modified.vim'
" Plug 'DavidEGx/ctrlp-smarttabs'
" Plug 'JazzCore/ctrlp-cmatcher'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'lokikl/vim-ctrlp-ag'
" Plug 'ivan-cukic/vim-ctrlp-cscope'
Plug 'dbeecham/ctrlp-commandpalette.vim'
Plug 'brookhong/cscope.vim'
Plug 'Vaelatern/vim-script-refactor'
" Plug 'pelodelfuego/vim-swoop'
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'yggdroot/leaderf'
" Plug 'gcavallanti/vim-noscrollbar'
" Plug 'wikitopian/hardmode'
Plug 'takac/vim-hardtime'    " Make life under ViM little difficult!
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim'
" Plug 'mbbill/undotree'
" Plug 'simnalamburt/vim-mundo'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'tommcdo/vim-lion'
" Plug 'mtth/scratch.vim'
" Plug 'vheon/vim-cursormode'
" Plug 'edkolev/promptline.vim'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'Yggdroot/indentLine'
Plug 'ervandew/lookup'
Plug 'thaerkh/vim-indentguides'
Plug 'tpope/vim-git'
Plug 'mhinz/vim-signify'
" Plug 'mhinz/vim-halo'
Plug 'airblade/vim-gitgutter'
Plug 'ratheesh/git_patch_tags.vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'svermeulen/vim-easyclip'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'osyo-manga/vim-anzu'
" Plug 'itchyny/lightline.vim'
" Plug 'ap/vim-buftabline'
" Plug 'unblevable/quick-scope'
" Plug 'rhysd/clever-f.vim'
Plug 'ratheesh/vim-extended-ft'
" Plug 'bruno-/vim-vertical-move'
Plug 't9md/vim-quickhl'
Plug 'machakann/vim-highlightedyank'
" Plug 'kana/vim-operator-user'
" Plug 'haya14busa/vim-operator-flashy'
Plug 'machakann/vim-highlightedundo'
" Plug 'WolfgangMehner/c-support'
" Plug 'vim-scripts/AutoAlign'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
" Plug 'vim-scripts/DoxygenToolkit.vim'
" Plug 'scrooloose/nerdcommenter'
" Plug 'scrooloose/nerdtree'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'vim-scripts/YankRing.vim'
Plug 'bfredl/nvim-miniyank'
" Plug 'haya14busa/incsearch.vim'
" Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'antoyo/vim-licenses'
Plug 'kshenoy/vim-signature'
" Plug 'MattesGroeger/vim-bookmarks'
" Plug 'mattn/ctrlp-mark'
" Plug 'shinnya/ctrlp-jumplist'
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'luochen1990/rainbow'
Plug 'eapache/rainbow_parentheses.vim'
" Plug 'tpope/vim-characterize'
" Plug 'adelarsq/vim-matchit'
" Plug 'vitalk/vim-shebang'
Plug 'tpope/vim-endwise'
" Plug 'vim-scripts/taglist.vim'
" Plug 'ervandew/supertab'
" Plug 'vim-scripts/OmniCppComplete'
" Plug 'rking/ag.vim'
" Plug 'sjl/vitality.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'gelguy/Cmd2.vim'
Plug 'jalvesaq/vimcmdline'
" Plug 'rhysd/vim-grammarous'
" Plug 'pelodelfuego/vim-swoop'
Plug 'python-mode/python-mode', {'branch': 'develop'}
" Plug 'fatih/vim-go' , { 'do': ':GoInstallBinaries' }
" Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'ntpeters/vim-airline-colornum'
" Plug 'Shougo/neocomplete.vim'
" Plug 'christoomey/vim-tmux-navigator'
" Plug '~/.vim/local/c_std'
" Plug 'nsf/gocode'
Plug 'lilydjwg/colorizer'
" Plug 'ryanpcmcquen/fix-vim-pasting'
" Plug 'ConradIrwin/vim-bracketed-paste'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    " Plug 'zchee/deoplete-clang'
    " Plug 'tweekmonster/deoplete-clang2'
    Plug 'roxma/nvim-yarp'
    " Plug 'roxma/vim-hug-neovim-rpc'
    " Plug 'zchee/deoplete-jedi'
    " Plug 'zchee/deoplete-go' , { 'do': 'make'}
    " Plug 'eagletmt/neco-ghc'
    " Plug 'zchee/deoplete-zsh'
endif

" Haskell plugins
" Plug 'itchyny/vim-haskell-indent'
" Plug 'sdiehl/haskell-vim-proto'
" Plug 'eagletmt/ghcmod-vim'
" Plug 'eagletmt/neco-ghc'

call plug#end()
"}}}

" ViM generic settings {{{
syntax   on
filetype on
filetype plugin indent on
set number relativenumber
if !has('nvim')
    set esckeys
    filetype plugin indent on
    if v:version >= 800
        packadd! matchit
    else
        runtime macros/matchit.vim
    endif
else
    set guicursor=
endif
set nostartofline
set numberwidth=1
set tabstop=4
set bs=2
" set ww=<,>,h,l
set showmatch
set matchtime=1
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
set timeout
set timeoutlen=500
" Time in milliseconds waited for a key code to complete
set ttimeout
set ttimeoutlen=0
set wildmenu
set fileformats=unix,dos,mac
" set virtualedit=all

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
" Show filename and path in window title (even in terminal)
set title
set showcmd
set nowrap
set backspace=indent,eol,start
set autoindent
set autoread
set autowrite
set cursorline
set linebreak
if has('linebreak')
  try
    set breakindent
    let &showbreak='↪ '
  catch /E518:/
    " Unknown option: breakindent
  endtry
endif
set cpo+=n
set hidden   " See http://items.sjbach.com/319/configuring-vim-right
set wmh=0    " Windows need not have height
set foldmethod=marker
set lazyredraw
" set copyindent
set gcr=a:blinkon0              " Disable cursor blink
if has('clipboard')
    set clipboard& clipboard+=unnamed
    set clipboard-=autoselect
endif
set encoding=utf-8
set scrolloff=3       " Show next 3 lines while scrolling.
set sidescrolloff=5   " Show next 5 columns while side-scrolling.
set laststatus=2
if !has('gui_running')
    set t_Co=256  " Support for 256 colors
endif
set noshowmode
set showtabline=2
" set fillchars="vert:\│,fold:-"
set fillchars+=vert:\│,fold:-
" set list
" set listchars=eol:¬,trail:·,extends:❯,precedes:❮
set listchars=trail:·,extends:❯,precedes:❮
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
au BufRead,BufNewFile,BufWrite *.exp,*.c,*.sh,*shrc setlocal nospell

" Set scroll margin to 0 in git commit buffers to avoid cursor in non-zero pos
" au BufRead,BufNewFile,BufWrite *.stgit*,COMMIT_EDITMSG set scrolloff=0

" Skip the splash screen
" set shortmess+=I
set novb
if !has('nvim')
    set ttyfast
endif
" Text formatting options
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

" disable bracketed paste!
" This causes issues with pasting using shift-Insert
" set t_BE=

if (has('nvim'))
    " show results of substition as they're happening but don't open a split
    set inccommand=nosplit
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
" Create temporary files
if !isdirectory($HOME.'/.vim/tmp') && exists('*mkdir')
    call mkdir($HOME.'/.vim/tmp')
endif

if has("persistent_undo")
    set undofile
    set undolevels=200   " Maximum number of changes that can be undone
    set undoreload=1000  " Maximum number lines to save for undo on a buffer reload
    set undodir=$HOME/.vim/tmp/undotree/
    if !isdirectory(&undodir)
        call mkdir(&undodir)
    endif
endif

set backup
set backupdir=$HOME/.vim/tmp/backup/
set backupext=-vimbackup
set backupskip=
if !isdirectory(&backupdir)
    call mkdir(&backupdir)
endif

" swap files
set directory   =$HOME/.vim/tmp/swap//
if !isdirectory(&directory)
    call mkdir(&directory)
endif
set updatecount =100

" viminfo settings
if has('nvim')
    "  ShaDa/viminfo:
    "   ' - Maximum number of previously edited files marks
    "   < - Maximum number of lines saved for each register
    "   @ - Maximum number of items in the input-line history to be
    "   s - Maximum size of an item contents in KiB
    "   h - Disable the effect of 'hlsearch' when loading the shada
    "   set shada='50,s100,n$XDG_CACHE_HOME/nvim/shada
    " set viminfo=%,<800,'300,/50,<1000,:100,s100,h,f1,n$HOME/.config/nvim/viminfo
    set shada=%,<800,'300,/50,<1000,:100,s100,h,f1,n$HOME/.config/nvim/shada.info
else
    set viminfo=%,<800,'300,/50,<1000,:100,s100,h,f1,n$HOME/.vim/tmp/viminfo
endif

" hooks
" Relative linenumbers disabled in insertmode
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,InsertLeave * set relativenumber
:  autocmd BufLeave,InsertEnter * set norelativenumber
:augroup END

" highlight command mode text
if !has('nvim')
    hi Normal  ctermfg=7  ctermbg=233  cterm=NONE guifg=#cccccc guibg=#1a1a1a gui=NONE
    au CmdLineEnter * hi Normal ctermfg=2
    au CmdLineLeave * hi Normal ctermfg=253
endif

" Set default file types for specific file names
autocmd BufNewFile,BufRead .bashrc*,bashrc,bash.bashrc,.bash_aliases,.bash_profile*,.bash_logout*,*.bash,*.ebuild set filetype=sh
autocmd BufNewFile,BufRead .zshrc,zshrc,.zprofile,zprofile,.zshenv,zshenv,.zimrc,zimrc,.zlogin,zlogin,.zlogout,zlogout set filetype=sh
autocmd BufNewFile,BufRead .stgit* set filetype=gitcommit
autocmd FileType gitcommit setlocal expandtab " Expand tabs in git commit mode
autocmd FileType gitcommit setlocal scrolloff=0
autocmd FileType gitcommit setlocal spell
autocmd VimEnter COMMIT_EDITMSG if getline(1) == '' | execute 1 | startinsert | endif
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0]) " set cursor position to starting on gitcommit buffers
autocmd FileType vim setlocal expandtab " Expand tabs in vim mode
autocmd FileType vim setlocal colorcolumn=0
autocmd FileType python setlocal expandtab " Expand tabs in python mode
autocmd FileType python let b:match_words = '\<if\>:\<elif\>:\<else\>'
autocmd BufRead,BufNew,BufNewFile gitconfig setlocal ft=gitconfig " git config file
autocmd BufRead,BufNew,BufNewFile *.md,*.markdown,*.mkd setlocal ft=markdown

" Save when buffer command takes one to another file and when losing focus
augroup focus_lost
    au!
    au FocusLost * silent! wall
augroup END

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter   * setlocal cursorline
    au VimLeave,WinLeave,BufWinLeave   * setlocal nocursorline
augroup END

" Little welcome message!
" autocmd VimEnter * echo "Willkommen zu meinem ViM Welt! (^-^)"
autocmd VimEnter * set noshowmode
autocmd VimEnter * set showcmd
autocmd VimEnter * set wrap

" Treat c-header as C source file type
autocmd BufNewFile,BufRead .h set filetype=ch

" keybindings
" disable arrow key navigation to break bad habit
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>

" vnoremap <Up>    <NOP>
" vnoremap <Down>  <NOP>
" vnoremap <Left>  <NOP>
" vnoremap <Right> <NOP>

" set pastetoggle=<F2> " Paste mode to avoid indented paste
" nmap <Leader><Leader> :
" imap jj <Esc>
imap <Esc> l
vmap <Esc> l
inoremap jj l
" vnoremap jj l
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
" close preview
nnoremap <silent><Leader>cp     :pclose<CR>
" close locationlist
nnoremap <silent><Leader>cl     :lcl<CR>

" map up/down in command mode to C-p/C-u
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>

" redraw screen
" nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l><Paste>

" disable audio and visual bells
set noerrorbells
set novisualbell
set t_vb=

"Add empty lines
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" Write current buffer with sudo privileges
" nnoremap <silent><Leader>sw     :w !sudo tee % &> /dev/null<CR>
" Force saving files that require root permission
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

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
nmap <silent><Leader><BS> <c-v>
" map <F9>                  :bprev<CR>
" map <F10>                 :bnext<CR>
map <F4>                    :echo expand('%:p')<CR>
nmap <silent><Leader>bd     :bdelete<CR>
nmap <silent><BS>           :nohlsearch<CR>
nmap <silent><Leader>bh     :Startify<CR>
nmap <silent><Leader><Tab>  :b#<CR>
" nnoremap <Leader>[        :let @+ = expand("%")<CR>

" visual indentation (does not exit Visual mode after indentation)
" make shift+tab and tab indent
xnoremap > >gv
xnoremap < <gv
" imap <S-Tab> <C-o><<

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

"spell suggestion in a popup
nnoremap \s ea<C-X><C-S>
" }}}

" Theme {{{
syntax on
color darktheme
" }}}

" Tagbar {{{
nmap <silent><F8>            :TagbarToggle<CR>
nnoremap <silent><leader>tt  :TagbarOpenAutoClose<CR>
" }}}


" python-mode {{{
let g:pymode_options = 0
let g:pymode_options_colorcolumn = 1
" }}}

" Doxygen {{{
let g:load_doxygen_syntax = 1
" }}}

" Vim-airline {{{
" let g:airline_highlighting_cache = 0

" Appearance
" let g:airline_powerline_fonts = 0
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
let g:airline#extensions#hunks#enabled               = 1
let g:airline#extensions#hunks#non_zero_only         = 1
let g:airline#extensions#branch#enabled              = 1
let g:airline#extensions#branch#displayed_head_limit = 20

let g:airline_symbols.paste = 'ραstε'
let g:airline_symbols.branch = '±'
" let g:airline_symbols.spell = 'Ꞩ'
" let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.readonly = ''

" Customize Airline Layout
function! AirlineInit()
    call airline#parts#define_accent('mode', 'italic')
    " call airline#parts#define_accent('branch', 'italic')
    call airline#parts#define_raw('linenr', '%l')
    call airline#parts#define_accent('linenr', 'bold')
    call airline#parts#define_raw('modified', '%{&modified ? "[+]" : ""}')
    call airline#parts#define_accent('modified', 'red')
    " call airline#parts#define_accent('readonly', 'bold')
    let g:airline_section_a = airline#section#create_left(['mode','crypt','paste','keymap','capslock','iminsert','☰%l:%v'])
    let g:airline_section_b = airline#section#create(['hunks'])
    let g:airline_section_c = airline#section#create(['readonly',' %f', 'modified'])
    let g:airline_section_x = airline#section#create_right(['tagbar','filetype'])
    let g:airline_section_y = airline#section#create_right(['ffenc'])
    let g:airline_section_z = airline#section#create_right(['branch','windowswap','obsession','ch:%02B│','%p%%'])
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
let g:airline#extensions#cursormode#enabled       = 1
let g:airline#extensions#anzu#enabled             = 1
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
    let g:airline#extensions#tabline#left_alt_sep  = '│'
    let g:airline#extensions#tabline#right_sep     = ''
    let g:airline#extensions#tabline#right_alt_sep = '│'
    let g:airline_left_alt_sep                     = '│'
    let g:airline_right_alt_sep                    = '│'
endif

" let g:airline#extensions#tabline#excludes = ['COMMIT_EDITMSG']
" let g:airline#extensions#tabline#buffer_idx_format = {
" \ '0': '⁰ ',
" \ '1': '೧ ',
" \ '2': '೨ ',
" \ '3': '೩ ',
" \ '4': '೪ ',
" \ '5': '೫ ',
" \ '6': '೬ ',
" \ '7': '೭ ',
" \ '8': '೮ ',
" \ '9': '೯ '
" \ }

autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

" let g:airline#extensions#default#section_truncate_width = {
" \ 'c': 30,
" \ }

let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'Ɲѳrmαl',
            \ 'i'  : '¶ƞsεrt',
            \ 'R'  : 'Rερlαcε',
            \ 'c'  : '₵md',
            \ 'v'  : 'Ʋisuαl',
            \ 'V'  : 'Ʋ-Liƞε',
            \ '' : 'Ʋ-ẞlѳck',
            \ 's'  : 'Subst',
            \ 'S'  : 'Subst-Liƞε',
            \ '' : 'Subst-ẞlk',
            \ }
" }}}

" vim-anzu {{{
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)

" This command is an overridden one to make sure otherone works if this plugin
" is disabled
nmap <silent><BS>       :nohlsearch<CR>\|<Plug>(anzu-clear-search-status)
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
endif

let g:ctrlp_clear_cache_on_exit = 1
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
nnoremap <silent><Leader>fl :CtrlPLine<CR>
nnoremap <silent><Leader>fy :CtrlPYankring<CR>
nnoremap <silent><leader>fc :CtrlPCommandPalette<cr>
" nnoremap <Leader>fm :CtrlPMixed<CR>

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|o|dll|stgit*)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }
let g:ctrlp_custom_ignore = '\v\~$|\.git/COMMIT_EDITMSG$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr|svn)($|[/\\])|__init__\.py'
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
let g:ctrlp_bdelete_keymap_trigger='<C-_>'
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
nnoremap <silent><Leader>gg :CtrlPag<CR>
vnoremap <silent><Leader>gg :CtrlPagVisual<CR>
nnoremap <leader>ca :CtrlPagLocate<space>
" nnoremap <leader>cp :CtrlPagPrevious<CR>
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

" vim-signify {{{
let g:signify_vcs_list               = [ 'git', 'svn' ]
let g:signify_realtime               = 0
let g:signify_update_on_bufenter     = 0
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '='
let g:signify_sign_show_count        = 1
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" }}}

" vim-gitgutter {{{
let g:gitgutter_override_sign_column_highlight = 0
if exists('&signcolumn')  " Vim 7.4.2201
    set signcolumn=yes
else
    let g:gitgutter_sign_column_always = 1
endif

" let g:gitgutter_eager = 1 " Update when switching/writing buffers
autocmd FileType tagbar,nerdtree setlocal signcolumn=no

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

" Easymotion {{{
let g:EasyMotion_do_mapping       = 0 " Disable default mappings
nmap <silent><Leader>jj <Plug>(easymotion-overwin-f)
nmap <silent><Leader>jk <Plug>(easymotion-overwin-f2)
nmap <silent><Leader>jl <Plug>(easymotion-overwin-line)
let g:EasyMotion_smartcase        = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout
let g:EasyMotion_prompt = 'Jump to → '
"}}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger       = "<C-e>"
let g:UltiSnipsListSnippets        = "<C-tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:indentLine_faster            = 1
"}}}

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
let g:rbpt_max         = 15
let g:bold_parentheses = 0

let g:rbpt_colorpairs = [
            \ ['gray',        'firebrick2'     ],
            \ ['darkgreen',   'SpringGreen3'   ],
            \ ['blue',        'DodgerBlue'     ],
            \ ['green',       'DeepPink3'      ],
            \ ['blue',        'DarkOrchid3'    ],
            \ ['red',         'MediumVioletRed'],
            \ ['magenta',     'PeachPuff3'     ],
            \ ['cyan',        'DodgerBlue'     ],
            \ ['darkred',     'firebrick3'     ],
            \ ['brown',       'RoyalBlue3'     ],
            \ ['darkblue',    'DarkOrchid3'    ],
            \ ['gray',        'firebrick3'     ],
            \ ['darkgreen',   'RoyalBlue3'     ],
            \ ['darkmagenta', 'SeaGreen3'      ],
            \ ['darkcyan',    'DarkOrchid3'    ],
            \ ['red',         'firebrick3'     ],
            \ ]

au VimEnter  * RainbowParenthesesToggle
au BufEnter  * RainbowParenthesesLoadRound
au BufEnter  * RainbowParenthesesLoadSquare
au BufEnter  * RainbowParenthesesLoadBraces
" au BufEnter  * RainbowParenthesesLoadChevrons

" }}}

"Expand region {{{

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

" vim-miniyank {{{
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

" map <leader>p <Plug>(miniyank-startput)
" map <leader>P <Plug>(miniyank-startPut)

if !has('nvim')
    map p <Plug>(miniyank-cycle)
else
    map <M-p> <Plug>(miniyank-cycle)
endif
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
map <silent>z/ <Plug>(incsearch-fuzzy-/)
map <silent>z? <Plug>(incsearch-fuzzy-?)
" }}}

" vim-easyalign {{{
xmap ga     <Plug>(EasyAlign)
nmap ga     <Plug>(EasyAlign)
xmap <cr>   <plug>(LiveEasyAlign)
" }}}

" hardtime {{{
let g:hardtime_default_on             = 0
let g:hardtime_timeout                = 2000
let g:hardtime_showmsg                = 1
let g:hardtime_ignore_buffer_patterns = ["NERD.*", "Tagbar.*"]
let g:hardtime_maxcount               = 2
nnoremap <silent><leader>th           :HardTimeToggle<CR>
" }}}

" neosnippet {{{
" if  has('nvim')
" let g:neosnippet#enable_completed_snippet = 1
" imap <silent><C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <silent><C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <silent><C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <silent><C-k>     <Plug>(neosnippet_expand_or_jump)
" endif
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
" let g:deoplete#complete_method            = "completefunc"

" Don't align these lines!
set completeopt=longest,menuone
set pumheight=8 " set max. height of popup menu

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> deoplete#close_popup()

inoremap <expr><C-l>   pumvisible() ? deoplete#refresh() : "\<C-l>"
" Undo completion i.e remove whole completed word (default plugin mapping)
inoremap <expr><C-g> deoplete#undo_completion()
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" let g:deoplete#disable_auto_complete = 1
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#mappings#manual_complete()

function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
" }}}

" Use Tab to forward cycle
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

let g:deoplete#sources     = {}
let g:deoplete#sources_   = [] " includes all sources

" Use partial fuzzy matches like YouCompleteMe
call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
call deoplete#custom#set('_', 'converters', ['converter_auto_paren'])
" }}}

" vim-move {{{
let g:move_map_keys = 0
if has('nvim')
    nmap <M--> <Plug>MoveLineDown
    nmap <M-=> <Plug>MoveLineUp
else
    " vmap k <Plug>MoveBlockUp
    " vmap j <Plug>MoveBlockDown
    nmap = <Plug>MoveLineUp
    nmap - <Plug>MoveLineDown
endif
" }}}

" vim-schlepp {{{
" Move block/lines as you wish
if has('nvim')
    vmap <M-k> <Plug>SchleppUp
    vmap <M-j> <Plug>SchleppDown
    vmap <M-h> <Plug>SchleppLeft
    vmap <M-l> <Plug>SchleppRight
else
    vmap k <Plug>SchleppUp
    vmap j <Plug>SchleppDown
    vmap h <Plug>SchleppLeft
    vmap l <Plug>SchleppRight
endif

" Duplication selection region
vnoremap Dk <Plug>SchleppDupUp
vnoremap Dj <Plug>SchleppDupDown
vnoremap Dh <Plug>SchleppDupLeft
vnoremap Dl <Plug>SchleppDupRight

"Other settings
let g:Schlepp#allowSquishingLines  = 1
let g:Schlepp#allowSquishingBlocks = 1
let g:Schlepp#trimWS               = 1
let g:Schlepp#reindent             = 1
" }}}

" NERDTree {{{
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" map <C-n> :NERDTreeToggle<CR>
" nnoremap <Leader>\ :NERDTreeToggle<CR>
" nnoremap <silent><Leader>v :NERDTreeFind<CR>
" nnoremap <silent><Leader>] :wincmd w<CR>
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

" gundo {{{
let g:gundo_prefer_python3=1
let g:gundo_preview_bottom=1
let g:gundo_right=1
nnoremap <silent><Leader>u :GundoToggle<CR>
" }}}

" vim-smooth-scroll {{{
noremap <silent><c-u> :call smooth_scroll#up(&scroll, 50, 4)<CR>
noremap <silent><c-d> :call smooth_scroll#down(&scroll, 50, 4)<CR>
noremap <silent><c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent><c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
" }}}

" scratch {{{
" Enable data persistence across sessions
let g:scratch_persistence_file=1
let g:scratch_filetype = 'text'
" }}}

" vim-highlightedyank {{{
" NOTE: Enabling yankring plugin breaks this functionality!
nnoremap Y yy
let g:highlightedyank_highlight_duration=200
" }}}

" vim-commentary {{{
autocmd FileType expect setlocal commentstring=#\ %s
" }}}

" tcomment {{{
let g:tcommentMaps = 0
nnoremap <silent><leader>cc :TComment<CR>
vnoremap <silent><leader>cc :TComment<CR>
" nnoremap <silent><leader>cb :TCommentBlock<CR>
" vnoremap <silent><leader>cb :TCommentBlock<CR>
" }}}

" vim-highlightedundo {{{
let g:highlightedundo#highlight_mode = 2
let g:highlightedundo#highlight_duration_delete=200
let g:highlightedundo#highlight_duration_add=250
nmap u     <Plug>(highlightedundo-undo)
nmap <C-r> <Plug>(highlightedundo-redo)
nmap U     <Plug>(highlightedundo-Undo)
nmap g-    <Plug>(highlightedundo-gminus)
nmap g+    <Plug>(highlightedundo-gplus)
" }}}

" vim-quickhl {{{
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
" }}}

" vim-cursormode {{{
let g:cursormode_exit_mode = 'd'
let cursormode_color_map = {
            \   "n"     :  "#c0c0c0",
            \   "i"     :  "#e75a3a",
            \   "R"     :  "#ff34be",
            \   "v"     :  "#28b473",
            \   "V"     :  "#0366d6",
            \   "\<C-V>":  "#ffca88",
            \   "d"     :  "#eeeeee",
            \ }
" }}}

" bracket-paste settings {{{
if &term =~ "xterm.*"
    let &t_SI = &t_SI . "\<ESC>[?2004h"
    let &t_EI = "\<ESC>[?2004l" . &t_EI
    function! XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~  XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    vmap <expr> <Esc>[200~ XTermPasteBegin("c")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif
" }}}

" Misc macros {{{
" Print syntax highlight group for the work under cursor
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}

" Use guicolors in terminal (we need to place this here as it is easy to disable!)
if has("termguicolors")
    set termguicolors
endif

" Autoload vimrc on save
" autocmd BufWritePost .vimrc source %

" End of File
