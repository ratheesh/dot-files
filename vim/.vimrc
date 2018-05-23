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

" install vimplug if it is not installed
let vimplug_exists=expand('~/.vim/autoload/plug.vim')
if !filereadable(vimplug_exists)
    if !executable("curl")
        echoerr "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
    echo "Installing Vim-Plug..."
    echo ""
    silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
"}}}

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/vim-easy-align', { 'on': '<plug>(LiveEasyAlign)' }
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 't9md/vim-textmanip'
Plug 'w0rp/ale' " This requires vim > v.8.0 with +timers +job +channel
Plug 'ratheesh/vim-smooth-scroll'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ratheesh/ctrlp_bdelete.vim'
Plug 'mattn/ctrlp-register'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'ratheesh/ctrlp-extensions.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'dylanaraps/root.vim'
Plug 'lokikl/vim-ctrlp-ag'
Plug 'shinnya/ctrlp-jumplist'
Plug 'mattn/ctrlp-mark'
Plug 'brookhong/cscope.vim'
Plug 'takac/vim-hardtime'    " Make life under ViM little difficult!
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim'
Plug 't9md/vim-smalls'
Plug 'bootleq/vim-cycle', { 'as': 'bootleq_vim-cycle' }
Plug 'godlygeek/tabular'
Plug 'thaerkh/vim-indentguides'
Plug 'tpope/vim-git', { 'for':'gitcommit' }
Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'ratheesh/git_patch_tags.vim', { 'for':'gitcommit' }
Plug 'vim-airline/vim-airline'
Plug 'ratheesh/vim-extended-ft'
Plug 'MaxMEllon/vim-shiny'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-highlightedundo'
Plug 'ratheesh/vim-bling'
Plug 'ckarnell/Antonys-macro-repeater'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'antoyo/vim-licenses'
Plug 'kshenoy/vim-signature'
" Plug 'eapache/rainbow_parentheses.vim'
" Plug 'ratheesh/hiPairs'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'shiyanhui/vim-slash'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'python-mode/python-mode', {'branch': 'develop', 'for': 'python'}
Plug 'lilydjwg/colorizer'
" Plug 'vim-scripts/DrawIt'
Plug 'ratheesh/yankmatches'
Plug 'haya14busa/is.vim'
Plug 'triglav/vim-visual-increment'
Plug 'vim-scripts/blockquote.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'greymd/oscyank.vim'

" text objects related
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'junegunn/vim-after-object'
Plug 'glts/vim-textobj-comment'
" Plug 'wellle/targets.vim'
Plug 'machakann/vim-swap' " to swap args
Plug 'tommcdo/vim-exchange' " exchange regions

" writing prose
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-colors-pencil'
Plug 'ratheesh/vim-airline-formatting'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-textobj-quote'
Plug 'beloglazov/vim-online-thesaurus'

if has('nvim')
    Plug 'Shougo/deoplete.nvim',      { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/denite.nvim',        { 'do': ':UpdateRemotePlugins' }
    Plug 'dunstontc/projectile.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'chemzqm/denite-extra',      { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neomru.vim',         { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neoyank.vim',        { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/denite.nvim'
    Plug 'dunstontc/projectile.nvim'
    Plug 'chemzqm/denite-extra'
    Plug 'Shougo/neomru.vim'
    Plug 'Shougo/neoyank.vim'

    Plug 'Shougo/deoplete.nvim'
    " Following are required for deoplete to work in ViM
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()
"}}}

" ViM generic settings {{{
syntax   on
filetype on
filetype plugin indent on
set number relativenumber
if !has('nvim')
    set noesckeys
    if v:version >= 800
        packadd! matchit
    else
        runtime macros/matchit.vim
    endif
endif

set nostartofline
set numberwidth=1
" set tabstop=4
" set matchpairs+=<:>
" set whichwrap=<,>,h,l
set whichwrap=<,>,[,]
set showmatch
" set matchtime=4
" set colorcolumn=81
" execute "set colorcolumn=" . join(range(81,335), ',')
" set columns=80
set ruler
set nofoldenable    " disable folding
set display=lastline
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
set updatetime=200
" Time in milliseconds waited for a mapping to complete
set timeout
set timeoutlen=700
" Time in milliseconds waited for a key code to complete
set ttimeout
set ttimeoutlen=0
set wildmenu
set fileformats=unix,dos,mac
set virtualedit=block

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
set cpoptions+=n
" $ for change command instead of deleting word then insert
set cpoptions+=$

set hidden   " See http://items.sjbach.com/319/configuring-vim-right
set winminheight=0    " Windows need not have height
set foldmethod=marker
set lazyredraw " don't redraw while executing macros
" set copyindent
if has('clipboard')
    if has('nvim')
        set clipboard+=unnamedplus
    else
        set clipboard& clipboard+=unnamed
        set clipboard-=autoselect
    endif
endif
set encoding=utf-8
set scrolloff=5       " Show next 3 lines while scrolling.
set sidescrolloff=5   " Show next 5 columns while side-scrolling.
set laststatus=2
if !has('gui_running')
    set t_Co=256  " Support for 256 colors
endif
set noshowmode

set modeline
set modelines=5

set showtabline=2
" set fillchars="vert:\│,fold:-"
set fillchars+=vert:\│,fold:-
set list
" set listchars=eol:¬,trail:·,extends:❯,precedes:❮
" set listchars=trail:·,extends:❯,precedes:❮
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set fillchars+=diff:⣿
set completeopt+=preview
set cscopetag

" Spell checking
setglobal spell spelllang=en_us
" By default spelling is off...
" set nospell
" ...but enable it for the English text files I use a lot.
au BufRead,BufNewFile,BufWrite *.txt,*.tex,*.latex set spell
au BufRead,BufNewFile,BufWrite *.exp,*.c,*.sh,*shrc setlocal nospell

" Set scroll margin to 0 in git commit buffers to avoid cursor in non-zero pos
" au BufRead,BufNewFile,BufWrite *.stgit*,COMMIT_EDITMSG set scrolloff=0

set ttyfast

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

" disable bracketed paste!
" This causes issues with pasting using shift-Insert
" set t_BE=

if (has('nvim'))
    " show results of substition as they're happening but don't open a split
    set inccommand=nosplit
endif
set splitbelow
set splitright

"Remember the positions in files with some git-specific exceptions"
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$")
            \           && expand("%") !~ "COMMIT_EDITMSG"
            \           && expand("%") !~ "MERGE_EDITMSG"
            \           && expand("%") !~ "ADD_EDIT.patch"
            \           && expand("%") !~ "addp-hunk-edit.diff"
            \           && expand("%") !~ "git-rebase-todo" |
            \   exe "normal g`\"" |
            \ endif

autocmd BufWritePost
            \ * if &l:filetype ==# '' || exists('b:ftdetect')
            \ |   unlet! b:ftdetect
            \ |   filetype detect
            \ | endif

augroup vimrc-sync-onstart
    autocmd!
    autocmd BufEnter * :syntax sync maxlines=200
augroup END

let mapleader      = "\<Space>"
let maplocalleader = "\\"
" }}}

" General Config {{{
" Create temporary files
if !isdirectory($HOME.'/.vim/tmp') && exists('*mkdir')
    call mkdir($HOME.'/.vim/tmp')
endif

if has("persistent_undo")
    set undofile
    set undolevels=500   " Maximum number of changes that can be undone
    set undoreload=200   " Maximum number lines to save for undo on a buffer reload
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
set writebackup

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
    set shada=%,<300,'100,/10,:100,s100,h,f1,n$HOME/.config/nvim/shada.info
    " autocmd VimLeave * wshada!
else
    set viminfo=%,<300,'100,/10,:100,s100,h,f1,n$HOME/.vim/tmp/viminfo
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
autocmd VimEnter COMMIT_EDITMSG if getline(1) == '' | execute 1 | startinsert | endif
autocmd BufRead,BufNew,BufNewFile gitconfig setlocal ft=gitconfig " git config file
autocmd BufRead,BufNew,BufNewFile *.md,*.markdown,*.mkd setlocal ft=markdown
autocmd BufRead,BufNew,BufNewFile *.c,*.cpp,*.h,*.txt execute "set colorcolumn=" . join(range(81,335), ',')

" close Quickfix/Locationlist when file is selected
" autocmd FileType qf nmap <buffer> <CR> <CR>:lclose<CR>

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
nnoremap <Up>      <NOP>
nnoremap <Down>    <NOP>
nnoremap <Left>    <NOP>
nnoremap <Right>   <NOP>
xnoremap <Up>      <NOP>
xnoremap <Down>    <NOP>
xnoremap <Left>    <NOP>
xnoremap <Right>   <NOP>
inoremap <Up>      <NOP>
inoremap <Down>    <NOP>
inoremap <Left>    <NOP>
inoremap <Right>   <NOP>

" set pastetoggle=<F2> " Paste mode to avoid indented paste
" nmap <Leader><Leader> :
" imap jj <Esc>
imap <Esc> l
vmap <Esc> l
inoremap jj l
nnoremap K i<CR><Esc>
" vnoremap jj l

" swap ' and ` for easy marks navigation
nnoremap ' `
nnoremap ` '
xnoremap ' `
xnoremap ` '

if has('nvim')
    nnoremap <silent><Leader>so     :source ~/.config/nvim/init.vim<CR>
else
    nnoremap <silent><Leader>so     :source $MYVIMRC<CR>
endif
nnoremap <silent><Leader>w      :w<CR>
" nnoremap <silent><Leader>ws     :w !sudo tee %
nnoremap <silent><Leader>x      :x<CR>
nnoremap <silent><Leader>qq     :q<CR>
nnoremap <silent><Leader>qn     :q!<CR>
" close preview
nnoremap <silent><Leader>cp     :pclose<CR>
" close locationlist
nnoremap <silent><Leader>cl     :lcl<CR>
" close quickfix
nnoremap <silent><Leader>cq     :ccl<CR>

" map up/down in command mode to C-p/C-u
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>

" navigate naturally even with wrapped lines
noremap <silent><expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent><expr> k (v:count == 0 ? 'gk' : 'k')

" Don't lose deleted text in insert mode <C-u>
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" redraw screen
" nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l><Paste>

" disable audio and visual bells
set noerrorbells
set novisualbell
set belloff=all
set t_vb=

" Write current buffer with sudo privileges
" nnoremap <silent><Leader>sw     :w !sudo tee % &> /dev/null<CR>
" Force saving files that require root permission
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Move across vim split Windows
if has('nvim')
    map <M-j> <C-W>j
    map <M-k> <C-W>k
    map <M-h> <C-W>h
    map <M-l> <C-W>l
else
    map j <C-W>j
    map k <C-W>k
    map h <C-W>h
    map l <C-W>l
endif

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
xmap <silent><Leader><Leader> V
nmap <silent><Leader><BS> <c-v>
xmap <silent><Leader><BS> <c-v>
nmap <Leader>; :
xmap <Leader>; :

" map <F9>                  :bprev<CR>
" map <F10>                 :bnext<CR>
map <F4>                    :echo expand('%:p')<CR>
nmap <silent><Leader>bd     :bdelete<CR>
nmap <silent><BS>           :nohlsearch<CR>
nmap <silent><Leader>bh     :Startify<CR>
" nmap <silent><Leader><Tab>  :b#<CR>
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
" map <tab> %

"spell suggestion in a popup
nnoremap \s ea<C-X><C-S>
" }}}

" Plugins Customization

" Theme {{{
syntax on
let g:enable_bold_font = 1
color darktheme
" }}}

" Tagbar {{{
nmap <silent><F8>            :TagbarToggle<CR>
nnoremap <silent><leader>tt  :TagbarOpenAutoClose<CR>
" }}}

"vim-cycle {{{
nmap  <silent><Leader>e <Plug>CycleNext
nmap  <silent><Leader>r <Plug>CyclePrev

let g:cycle_default_groups_for_c = [
            \ [[ 'unsigned', 'signed', 'register' ]],
            \ [[ 'char',  'short', 'int', 'long', 'void' ]],
            \ [[ 'u8',  'u16', 'u32', 'u64' ]],
            \ [[ 'uint8_t',  'uint16_t', 'uint32_t', 'uint64_t', 'size_t' ]],
            \ [[ 'SINT8', 'SINT16', 'SINT32', 'SINT64' ]],
            \ [[ 'UINT8', 'UINT16', 'UINT32', 'UINT64' ]],
            \ [[ '>>', '<<' ]],
            \ [[ '=>>', '<<=' ]],
            \ [[ '&&', '||' ]],
            \ [[ '>=', '<=' ]],
            \ [[ '->', '.'  ]],
            \ ]

let g:cycle_default_groups_for_cpp = [
            \ [[ 'unsigned', 'signed', 'register' ]],
            \ [[ 'bool', 'char',  'short', 'int', 'long' ]],
            \ [[ 'u8',  'u16', 'u32', 'u64' ]],
            \ [[ 'uint8_t',  'uint16_t', 'uint32_t', 'uint64_t', 'size_t' ]],
            \ [[ 'SINT8', 'SINT16', 'SINT32', 'SINT64' ]],
            \ [[ 'UINT8', 'UINT16', 'UINT32', 'UINT64' ]],
            \ [[ '>>', '<<' ]],
            \ [[ '=>>', '<<=' ]],
            \ [[ '&&', '||' ]],
            \ [[ '>=', '<=' ]],
            \ [[ '->', '.'  ]],
            \ ]

let g:cycle_default_groups_for_python = [
            \ [[ 'if', 'elseif', 'else', 'endif' ]],
            \ ]

let g:cycle_default_groups_for_sh = [
            \ [[ 'eq', 'gt', 'lt', 'le', 'ge' ]],
            \ [[ '&&', '||' ]],
            \ [[ '>=', '<=' ]],
            \ [[ '>>', '<<' ]],
            \ [[ '=>>', '<<=' ]],
            \ [[ '-n', '-z' ]],
            \ ]

let g:cycle_default_groups = [
            \ [[ 'true', 'false' ]],
            \ [[ 'yes', 'no' ]],
            \ [[ 'on', 'off' ]],
            \ [[ 'allow', 'deny' ]],
            \ [[ 'before', 'after' ]],
            \ [[ 'block', 'inline', 'none' ]],
            \ [[ 'define', 'undef' ]],
            \ [[ 'good', 'bad' ]],
            \ [[ 'in', 'out' ]],
            \ [[ 'left', 'right' ]],
            \ [[ 'min', 'max' ]],
            \ [[ 'on', 'off' ]],
            \ [[ 'start', 'stop' ]],
            \ [[ 'success', 'failure' ]],
            \ [[ 'up', 'down' ]],
            \ [[ 'left', 'right' ]],
            \ [[ 'sunday', 'monday', 'tuesday', 'wednesday', 'thursday',
            \    'friday', 'saturday' ]],
            \ [[ 'january', 'february', 'march', 'april', 'may', 'june', 'july',
            \    'august', 'september', 'october', 'november', 'december' ]],
            \ [[ '0', '1' ]],
            \ [[ '+', '-' ]],
            \ [[ '}', '{' ]],
            \ [[ ')', '(' ]],
            \ [[ ']', '[' ]],
            \ [[ '>', '<' ]],
            \ [[ '&', '|' ]],
            \ [[ '==', '!=']],
            \ ]
" }}}

" python-mode {{{
let g:pymode_options = 0
let g:pymode_options_colorcolumn = 1
" }}}

" yankmatches {{{
let g:YankMatches#ClipboardRegister='a'
nmap <silent><Leader>dm    :call ForAllMatches('delete', {})<CR>
nmap <silent><Leader>di    :call ForAllMatches('delete', {'inverse':1})<CR>
nmap <silent><Leader>ym    :call ForAllMatches('yank',   {})<CR>
nmap <silent><Leader>yi    :call ForAllMatches('yank',   {'inverse':1})<CR>
vmap <silent><Leader>dm    :<C-U>call ForAllMatches('delete', {'visual':1})<CR>
vmap <silent><Leader>di    :<C-U>call ForAllMatches('delete', {'visual':1, 'inverse':1})<CR>
vmap <silent><Leader>ym    :<C-U>call ForAllMatches('yank',   {'visual':1})<CR>
vmap <silent><Leader>yi    :<C-U>call ForAllMatches('yank',   {'visual':1, 'inverse':1})<CR>
" }}}

" Doxygen {{{
let g:load_doxygen_syntax = 1
" }}}

" Vim-airline {{{
" let g:airline_highlighting_cache = 0

" Appearance
let g:airline_powerline_fonts = 0
let g:airline_theme           = 'darkmode' " sane ones -> ubaryd sol wombat bubblegum
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

if has('nvim')
    set mouse=nicr
else
    if has('mouse')
        set mouse=a
    endif
endif

" let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#whitespace#enabled         = 0
" let g:airline_skip_empty_sections                   = 1
let g:airline#extensions#capslock#enabled           = 1
let g:airline_detect_spelllang                      = 0
let g:airline_detect_modified                       = 1
" let g:airline#parts#ffenc#skip_expected_string      = 'utf-8[unix]'
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
    call airline#parts#define_accent('mode', 'bold')
    " call airline#parts#define_accent('branch', 'italic')
    call airline#parts#define_raw('linenr', '%l')
    call airline#parts#define_accent('linenr', 'bold')
    call airline#parts#define_raw('modified', '%{&modified ? "[+]" : ""}')
    call airline#parts#define_accent('modified', 'orange')
    " call airline#parts#define_accent('readonly', 'bold')
    let g:airline_section_a = airline#section#create_left(['mode','crypt','paste','keymap','capslock','iminsert'])
    let g:airline_section_b = airline#section#create(['hunks'])
    let g:airline_section_c = airline#section#create(['readonly',' %f', 'modified'])
    let g:airline_section_x = airline#section#create_right(['tagbar','filetype'])
    let g:airline_section_y = airline#section#create_right(['ffenc'])
    let g:airline_section_z = airline#section#create_right(['branch','windowswap','obsession','☰%l:%v│','ch:%02B│','%p%%'])
    " let g:airline_section_z = airline#section#create_right(['branch','windowswap','obsession','☰%l:%v│','%p%%'])
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
" let g:airline#extensions#cursormode#enabled       = 1
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
if !get(g:, 'airline_powerline_fonts', 0)
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

" let g:airline_mode_map = {
"             \ '__' : '-',
"             \ 'n'  : 'Ɲѳrmαl',
"             \ 'i'  : '¶ƞsεrt',
"             \ 'R'  : 'Rερlαcε',
"             \ 'c'  : '₵md',
"             \ 'v'  : 'Ʋisuαl',
"             \ 'V'  : 'Ʋ-Liƞε',
"             \ '' : 'Ʋ-ẞlѳck',
"             \ 's'  : 'Subst',
"             \ 'S'  : 'Subst-Liƞε',
"             \ '' : 'Subst-ẞlk',
"             \ }
" }}}

" Vim-licenses {{{
let g:licenses_copyright_holders_name = 'Ratheesh <ratheeshreddy@gmail.com>'
let g:licenses_authors_name           = 'Ratheesh S'
let g:licenses_default_commands       = ['gplv2', 'mit']
" }}}

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

let g:ctrlp_match_window = 'min:1,max:15,results:2000'
" let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_match_current_file = 0

" let g:ctrlp_map             = '<Leader>p'
let g:ctrlp_cmd               = 'CtrlPBuffer'
let g:ctrlp_show_hidden       = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers      = ['.ctrlp', '.git', '.svn', '.hg']
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
nnoremap <silent><leader>fj :CtrlPJumpList<CR>
nnoremap <silent><leader>fm :CtrlPMark<CR>
" nnoremap <Leader>fm :CtrlPMixed<CR>

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|o|dll|stgit*)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }
let g:ctrlp_custom_ignore = '\v\~$|\.git/COMMIT_EDITMSG$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr|svn)($|[/\\])|__init__\.py'

" disable numbers in ctrlp buffer
autocmd BufEnter ControlP set nonumber
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

" root.vim {{{
let g:root#auto = 1
let g:root#echo = 0
" }}}

" vim-ctrlp-ag {{{
nnoremap <silent><Leader>gg :CtrlPag<CR>
vnoremap <silent><Leader>gg :CtrlPagVisual<CR>
nnoremap <leader>/          :CtrlPagLocate<space>
" nnoremap <leader>cp :CtrlPagPrevious<CR>
let g:ctrlp_ag_ignores = '--ignore .git
            \ --ignore "deps/*"
            \ --ignore "_build/*"
            \ --ignore "node_modules/*"'
" }}}

" ctrlp-mark {{{
" leaveout all except alphabhets
let g:ctrlp_mark_match_string = 'v:val !~ "^ \\(\\W\\|\\d\\).*"'
" }}}

" denite {{{

" reset 50% winheight on window resize
augroup deniteresize
    autocmd!
    autocmd VimResized,VimEnter * call denite#custom#option('default',
                \'winheight', winheight(0) / 3)
augroup end

call denite#custom#option('default', {
            \ 'prompt'                :  '➜ ',
            \ 'auto-accel'            :  v:true,
            \ 'auto-highlight'        :  v:true,
            \ 'mode'                  :  'normal',
            \ 'root-markers'          :  '.git,.hg,.svn',
            \ 'smartcase'             :  v:true,
            \ 'highlight_mode_normal' :  'DeniteNormalHLLine',
            \ 'prompt_highlight'      :  'DenitePrompt',
            \ })

call denite#custom#var('file_rec', 'command',
            \ ['rg', '--files', '--glob', '!.git', ''])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
            \ ['--hidden', '--vimgrep', '--no-heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
            \'noremap')
call denite#custom#map('normal', '<Esc>', '<NOP>',
            \'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
            \'noremap')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>',
            \'noremap')
call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>',
            \'noremap')

nnoremap <silent><Leader>do   :P<C-u>Denite file_rec -mode=insert<CR>
nnoremap <silent><Leader>db   :<C-u>Denite buffer -mode=normal<CR>
nnoremap <silent><Leader>dd   :P<C-u>DeniteCursorWord grep<CR>
nnoremap <silent><Leader>d/   :P<C-u>DeniteProjectDir grep<CR>
nnoremap <silent><Leader>dp   :<C-u>Denite register -mode=normal<CR>
nnoremap <silent><Leader>dl   :<C-u>Denite location_list -no-empty<CR>
nnoremap <silent><Leader>du   :<C-u>Denite file_mru<CR>
nnoremap <silent><Leader>dy   :<C-u>Denite neoyank<CR>
" nnoremap <silent><leader>ds   :<C-u>Denite history:search -mode=normal<CR>
" nnoremap <silent><leader>dc   :<C-u>Denite history:cmd -mode=normal<CR>

hi link deniteMatchedChar Special

" }}}

" vim-startify {{{
let g:startify_custom_header = get(g:, 'startify_custom_header', [
            \'',
            \'',
            \'           _    __ _  __  ___ __',
            \'          | |  / /(_)/  |/  // /',
            \'          | | / // // /|_/ // /',
            \'          | |/ // // /  / //_/',
            \'          |___//_//_/  /_/(_)',
            \'',
            \'',
            \ ])
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
nmap <silent><leader>sn <plug>(signify-next-hunk)
nmap <silent><leader>sp <plug>(signify-prev-hunk)
" }}}

" vim-gitgutter {{{
let g:gitgutter_map_keys=0
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

" vim-smalls {{{
let g:smalls_auto_jump                  = 1
let g:smalls_auto_jump_min_input_length = 2
let g:smalls_auto_jump_timeout          = 0.3
nmap <Leader>j <Plug>(smalls)
omap <Leader>j <Plug>(smalls)
xmap <Leader>j <Plug>(smalls)
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger       = ""
let g:UltiSnipsListSnippets        = "<C-Tab>"
let g:UltiSnipsJumpForwardTrigger  = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:indentLine_faster            = 1
"}}}

" vim-ale {{{
let g:ale_sign_column_always   = 1
let g:ale_lint_on_text_changed = "never"
let g:ale_lint_on_insert_leave = 1
autocmd BufEnter ControlP let b:ale_enabled = 0
let g:ale_set_loclist  = 0
let g:ale_set_quickfix = 1
let g:ale_open_list    = 0
" let g:ale_gitcommit_gitlint_use_global=1
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

" au VimEnter  * RainbowParenthesesToggle
" au BufEnter  * RainbowParenthesesLoadRound
" au BufEnter  * RainbowParenthesesLoadSquare
" au BufEnter  * RainbowParenthesesLoadBraces
" au BufEnter  * RainbowParenthesesLoadChevrons
" }}}

" hipairs {{{
let g:hiPairs_hl_matchPair = {
            \    'term'    : 'underline,bold',
            \    'ctermfg' : '24',
            \    'ctermbg' : 'NONE',
            \    'cterm'   : 'underline,bold',
            \    'guifg'   : '#0386f6',
            \    'guibg'   : 'NONE',
            \    'gui'     : 'underline,bold',
            \ }

let g:hiPairs_hl_unmatchPair = {
            \    'term'    : 'bold,underline',
            \    'ctermfg' : '0',
            \    'ctermbg' : '2',
            \    'cterm'   : 'bold,underline',
            \    'guifg'   : '#000000',
            \    'guibg'   : '#ff0000',
            \    'gui'     : 'bold,underline',
            \ }
" }}}

" vim-indentguides {{{
let g:indentguides_ignorelist = ['text', 'vim']
let g:indentguides_spacechar  = '┆'
let g:indentguides_tabchar    = '¦'
let g:indentguides_firstlevel = 0
" }}}

" hardtime {{{
let g:hardtime_default_on             = 0
let g:hardtime_timeout                = 2000
let g:hardtime_showmsg                = 1
let g:hardtime_ignore_buffer_patterns = ["NERD.*", "Tagbar.*"]
let g:hardtime_maxcount               = 2
nnoremap <silent><leader>th           :HardTimeToggle<CR>
" }}}

" deoplete {{{
set completeopt+=noinsert
let g:deoplete#enable_at_startup = 1
if !has('nvim')
    let g:deoplete#enable_yarp   = 1
endif
let g:deoplete#enable_refresh_always      = 1
let g:deoplete#auto_complete_delay        = 50
let g:deoplete#auto_refresh_delay         = 50
let g:deoplete#auto_complete_start_length = 2
let g:deoplete#enable_ignore_case         = 1
let g:deoplete#enable_smart_case          = 1
let g:deoplete#enable_camel_case          = 1
let g:deoplete#file#enable_buffer_path    = 1
let g:deoplete#max_list                   = 50
let deoplete#tag#cache_limit_size         = 10000000
" let g:deoplete#complete_method            = "completefunc"

" Don't align these lines!
set completeopt=longest,menuone
set pumheight=8 " set max. Height of popup menu

let g:deoplete#sources  = {}
let g:deoplete#sources_ = [] " includes all sources

" Use partial fuzzy matches like YouCompleteMe
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])
call deoplete#custom#source('_', 'sorters', ['sorter_word'])
" call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#source('ultisnips', 'rank', 9999)

call deoplete#custom#option('smart_case', v:true)

" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-\> pumvisible() ? "\<C-w>" : "\<C-\>"
inoremap <expr><C-y> deoplete#close_popup()

inoremap <expr><C-l>   pumvisible() ? deoplete#refresh() : "\<C-l>"
" Undo completion i.e remove whole completed word (default plugin mapping)
inoremap <expr><C-g> deoplete#undo_completion()

" let g:deoplete#disable_auto_complete = 1
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#mappings#manual_complete()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use Tab to forward cycle
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" following code works only in ViM for now
" if !has('nvim')
    " let g:UltiSnipsExpandTrigger = "<nop>"
    " inoremap <CR> <C-r>=pumvisible() ? UltiSnips#ExpandSnippetOrJump() : "\n"<CR>
" endif

" }}}

" vim-textmanip {{{
" xmap <Leader>dd <Plug>(textmanip-duplicate-down)
" nmap <Leader>dd <Plug>(textmanip-duplicate-down)
xmap <Leader>dj <Plug>(textmanip-duplicate-down)
nmap <Leader>dj <Plug>(textmanip-duplicate-down)
xmap <Leader>dk <Plug>(textmanip-duplicate-up)
nmap <Leader>dk <Plug>(textmanip-duplicate-up)
xmap <Leader>dl <Plug>(textmanip-duplicate-right)
xmap <Leader>dh <Plug>(textmanip-duplicate-left)

if has('nvim')
    " nmap <M-j> <Plug>(textmanip-move-down)
    " nmap <M-k> <Plug>(textmanip-move-up)
    "
    xmap <M-j> <Plug>(textmanip-move-down)
    xmap <M-k> <Plug>(textmanip-move-up)
    xmap <M-h> <Plug>(textmanip-move-left)
    xmap <M-l> <Plug>(textmanip-move-right)
else
    " nmap j <Plug>(textmanip-move-down)
    " nmap k <Plug>(textmanip-move-up)
    "
    xmap j <Plug>(textmanip-move-down)
    xmap k <Plug>(textmanip-move-up)
    xmap h <Plug>(textmanip-move-left)
    xmap l <Plug>(textmanip-move-right)
endif

nmap <Leader>o <Plug>(textmanip-blank-below)
nmap <Leader>O <Plug>(textmanip-blank-above)

" toggle insert/replace with <C-s>
nmap <C-s> <Plug>(textmanip-toggle-mode)
xmap <C-s> <Plug>(textmanip-toggle-mode)
" }}}

" cscope {{{
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>fl :call ToggleLocationList()<CR>
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

" vim-shiny {{{
nmap p  <Plug>(shiny-p)
nmap P  <Plug>(shiny-P)
nmap gp <Plug>(shiny-gp)
nmap gP <Plug>(shiny-gP)
" }}}

" nerd-commentar {{{
let g:NERDCreateDefaultMappings  = 0
let g:NERDSpaceDelims            = 1
let g:NERDCompactSexyComs        = 1
let g:NERDDefaultAlign           = 'left'
" let g:NERDCustomDelimiters       = { 'c': { 'left': '/*','right': '*/' } }
let g:NERDCommentEmptyLines      = 1
let g:NERDTrimTrailingWhitespace = 1

if has('nvim')
    nmap <silent><M-;>  :call NERDComment("n", "Append")<CR>
else
    nmap <silent>;    :call NERDComment("n", "Append")<CR>
endif

nmap <silent><Leader>cc :call NERDComment("n", "Comment")<CR>
xmap <silent><Leader>cc :call NERDComment("x", "Comment")<CR>

nmap <silent><Leader>cu :call NERDComment("n", "Uncomment")<CR>
xmap <silent><Leader>cu :call NERDComment("x", "Uncomment")<CR>

nmap <silent><Leader>cs :call NERDComment("n", "Sexy")<CR>
xmap <silent><Leader>cs :call NERDComment("x", "Sexy")<CR>

nmap <silent><Leader>ct :call NERDComment("n", "Toggle")<CR>
xmap <silent><Leader>ct :call NERDComment("x", "Toggle")<CR>

" this does not work on ftypes that does not support multipart delimiters
nmap <silent><Leader>cm :call NERDComment("n", "Minimal")<CR>
xmap <silent><Leader>cm :call NERDComment("x", "Minimal")<CR>
" }}}

" auto-pairs {{{
let g:AutoPairsFlyMode            = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
" }}}

" vim-highlightedundo {{{
let g:highlightedundo#highlight_mode            = 2
let g:highlightedundo#highlight_duration_delete = 200
let g:highlightedundo#highlight_duration_add    = 250
nmap u     <Plug>(highlightedundo-undo)
nmap <C-r> <Plug>(highlightedundo-redo)
nmap U     <Plug>(highlightedundo-Undo)
nmap g-    <Plug>(highlightedundo-gminus)
nmap g+    <Plug>(highlightedundo-gplus)
" nmap U     <C-r>
" }}}

" vim-cursormode {{{
let g:cursormode_exit_mode = 'd'
let cursormode_color_map = {
            \   "n"     :  "#c0c0c0",
            \   "i"     :  "#e75a3a",
            \   "R"     :  "#ff34be",
            \   "v"     :  "#46c28e",
            \   "V"     :  "#0366d6",
            \   "\<C-V>":  "#ffca88",
            \   "d"     :  "#eeeeee",
            \ }
" }}}

" vim-pencil {{{
let g:pencil#autoformat      = 0     " 0 = disable, 1 = enable (def)
let g:pencil#textwidth       = 80
let g:pencil#cursorwrap      = 0     " 0 = disable, 1 = enable (def)
let g:pencil#mode_indicators = {'hard': 'H', 'auto': 'A', 'soft': 'S', 'off': '',}

augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init({'wrap': 'hard'})
    autocmd FileType text call pencil#init({'wrap': 'hard'})
augroup END

" manual reformatting shortcuts
nnoremap Q gqap<CR>
xnoremap Q gq<CR>
nnoremap <silent><leader>Q vapJgqap<CR>
" }}}

" vim-airline-formatting {{{
let g:airline#extensions#formatting#enabled        = 1
" spaces / tabs indicator
let g:airline#extensions#formatting#space_glyph    = '•'
let g:airline#extensions#formatting#tab_glyph      = '▸'

" symbolizes the text body
let g:airline#extensions#formatting#text_glyph     = '≡'

" wrap/nowrap inidcator (if Pencil isn't found)
let g:airline#extensions#formatting#wrap_no_pencil = '¶'
" }}}

" vim-textobj-quote {{{
augroup textobj_quote
    autocmd!
    autocmd FileType markdown call textobj#quote#init()
    autocmd FileType textile call textobj#quote#init()
    autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END
" }}}

" vim-easy-align {{{
let g:easy_align_bypass_fold = 1
nmap ga     <Plug>(EasyAlign)
xmap ga     <Plug>(EasyAlign)
xmap <CR>   <plug>(LiveEasyAlign)
let g:easy_align_ignore_groups = ['Comment', 'String']
" }}}

" vim-visual-increment {{{
set nrformats=alpha,octal,hex
" }}}

" oscyank {{{
noremap <leader>y :Oscyank<CR>
" }}}

" vim-bling {{{
let g:bling_time         = 175
let g:bling_count        = 1
let g:bling_color_fg     = '0'
let g:bling_color_bg     = '131'
let g:bling_color_cterm  = 'NONE'
let g:bling_color_gui_fg = '#000000'
let g:bling_color_gui_bg = '#bdb76b'
let g:bling_no_expr      = 1
" }}}

" vim-peekaboo {{{
let g:peekaboo_window='vert bo 60new'
" }}}

" Misc useful functions {{{
" bracket-paste settings - supports only ViM for now
if !has('nvim') && has('patch-8.0-330')
    if &term =~ "xterm.*"
        let &t_SI = &t_SI . "\<ESC>[?2004h"
        let &t_EI = "\<ESC>[?2004l" . &t_EI
        function! XTermPasteBegin(ret)
            set pastetoggle=<Esc>[201~
            set paste
            return a:ret
        endfunction
        map  <expr><Esc>[200~ XTermPasteBegin("i")
        imap <expr><Esc>[200~ XTermPasteBegin("")
        vmap <expr><Esc>[200~ XTermPasteBegin("c")
        cmap <expr><Esc>[200~ <nop>
        cmap <expr><Esc>[201~ <nop>
    endif
endif

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
    let l:modeline = printf(" vim: set ft=%s ff=%s ts=%d sw=%d tw=%d %sexpandtab:",
                \ &filetype, &fileformat, &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
    let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
    call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Toggle locationlist and quickfix list
function! GetBufferList()
    redir =>buflist
    silent! ls!
    redir END
    return buflist
endfunction

function! ToggleList(bufname, pfx)
    let buflist = GetBufferList()
    for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
        if bufwinnr(bufnum) != -1
            exec(a:pfx.'close')
            return
        endif
    endfor
    if a:pfx == 'l' && len(getloclist(0)) == 0
        echohl ErrorMsg
        echo "Location List is Empty."
        return
    endif
    let winnr = winnr()
    exec(a:pfx.'open')
    if winnr() != winnr
        wincmd p
    endif
endfunction

nmap <silent><leader>tl :call ToggleList("Location List", 'l')<CR>
nmap <silent><leader>tq :call ToggleList("Quickfix List", 'c')<CR>

" Make text inserted in insertmode into smaller undo chunks.
" This is useful for text mode. But for programming mode ???
" inoremap . .<c-g>u
" inoremap ? ?<c-g>u
" inoremap ! !<c-g>u
" inoremap , ,<c-g>u
" }}}

" Misc macros {{{
" Print syntax highlight group for the word under cursor in command area
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}

" Use guicolors in terminal (we need to place this here as it is easy to disable!)
if has("termguicolors")
    set termguicolors
endif

if has('nvim')
    " Set cursor color based on mode. Though this is limited compared to cursor
    " mode, this setting does not break locationlist/preview window title issue
    " with airline plugin.
    " Only neovim support for now!
    highlight nCursor guifg=#e0e0e0 guibg=#e0e0e0 gui=inverse,bold cterm=inverse,bold
    highlight iCursor guifg=#46c283 guibg=#46c283 gui=inverse,bold cterm=inverse,bold
    highlight vCursor guifg=#fccc82 guibg=#fccc82 gui=inverse,bold cterm=inverse,bold
    highlight oCursor guifg=#ff005f guibg=#ff005f gui=inverse,bold cterm=inverse,bold
    highlight rCursor guifg=#d65b84 guibg=#d65b84 gui=inverse,bold cterm=inverse,bold
    set guicursor=n:block-nCursor-blinkon0,i-ci:block-iCursor-blinkon0,v-ve:block-vCursor-blinkon0,o:block-oCursor-blinkon0,r-cr:block-rCursor-blinkon0
    autocmd VimLeave * set guicursor=a:block-NCursor-blinkon0
endif

" Autoload vimrc on save
" autocmd BufWritePost .vimrc source %

" End of File
