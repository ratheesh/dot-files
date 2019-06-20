" Copyright (C) 2018  Ratheesh <ratheeshreddy@gmail.com>
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

" Install vimplug if it is not already installed
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

" disable shallow cloning
let g:plug_shallow=0
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
Plug 'tpope/vim-capslock'
" Plug 'w0rp/ale' " This requires vim > v.8.0 with +timers +job +channel
Plug 'ratheesh/vim-smooth-scroll'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ratheesh/ctrlp_bdelete.vim'
Plug 'mattn/ctrlp-register'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'ratheesh/ctrlp-extensions.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'shinnya/ctrlp-jumplist'
Plug 'mattn/ctrlp-mark'
Plug 'jasoncodes/ctrlp-modified.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'brookhong/cscope.vim'
Plug 'takac/vim-hardtime'    " Make life under ViM little difficult!
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim'
Plug 't9md/vim-smalls'
Plug 'bootleq/vim-cycle', { 'as': 'bootleq_vim-cycle' }
Plug 'godlygeek/tabular'
Plug 'thaerkh/vim-indentguides'
Plug 'tpope/vim-git', { 'for':'gitcommit' }
Plug 'airblade/vim-gitgutter'
Plug 'ratheesh/git_patch_tags.vim', { 'for':'gitcommit' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-airline/vim-airline'
Plug 'retorillo/airline-tablemode.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'ratheesh/vim-extended-ft'
Plug 'MaxMEllon/vim-shiny'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-highlightedundo'
Plug 'ckarnell/Antonys-macro-repeater'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
Plug 'terryma/vim-expand-region'
Plug 'antoyo/vim-licenses'
Plug 'kshenoy/vim-signature'
Plug 'ratheesh/hiPairs'
Plug 'jiangmiao/auto-pairs'
" Plug 'tpope/vim-endwise'
Plug 'rhysd/endwize.vim'
Plug 'ratheesh/vim-c-slash', {'for': ['c', 'cpp', 'cxx', 'cmake', 'clang']}
if has('nvim')
    Plug 'lambdalisue/suda.vim'
endif
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'python-mode/python-mode', {'branch': 'develop', 'for': 'python'}
Plug 'tweekmonster/braceless.vim', { 'for': 'python'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'rhysd/git-messenger.vim'
Plug 'lilydjwg/colorizer'
Plug 'ratheesh/yankmatches'
Plug 'vim-scripts/blockquote.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'greymd/oscyank.vim'
Plug 'vim-scripts/blockquote.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'haya14busa/is.vim'
Plug 'romainl/vim-cool'
if has('nvim')
    Plug 'gelguy/wilder.nvim',         { 'do': ':UpdateRemotePlugins' }
else
    Plug 'gelguy/Cmd2.vim'
endif " if
Plug 'andymass/vim-matchup'
Plug 'fvictorio/vim-yank-queue'

Plug 'kana/vim-submode'
" Custom text objects related
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'rhysd/vim-textobj-anyblock'
Plug 'rhysd/vim-textobj-conflict'  " i/a =
Plug 'anyakichi/vim-textobj-ifdef' " i/a #
Plug 'FooSoft/vim-argwrap'
Plug 'augustold/vim-custom-surround'
Plug 'kana/vim-textobj-line'
Plug 'junegunn/vim-after-object'
Plug 'glts/vim-textobj-comment'
Plug 'machakann/vim-swap' " to swap args
Plug 'PeterRincker/vim-argumentative' " (c/d/v)(i/a),
Plug 'tommcdo/vim-exchange' " exchange regions
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'haya14busa/vim-operator-flashy'

" writing prose
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-colors-pencil'
Plug 'ratheesh/vim-airline-formatting'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-textobj-quote'
Plug 'beloglazov/vim-online-thesaurus'

Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }

" Shougo's plugins
Plug 'Shougo/echodoc.vim'
if has('nvim')
    Plug 'Shougo/deoplete.nvim',         { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/denite.nvim',           { 'do': ':UpdateRemotePlugins' }
    Plug 'ncm2/float-preview.nvim',      { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'Shougo/denite.nvim'

    " Following are required for deoplete to work in ViM
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neco-syntax'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-tag'

Plug 'dunstontc/projectile.nvim'
Plug 'chemzqm/denite-extra'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-tmux'
" Plug 'ncm2/ncm2-path'
" Plug 'ratheesh/ncm2-tagprefix', {'branch': 'func_signature'}
" Plug 'ncm2/ncm2-syntax'

call plug#end()

" Install missing or new plugins on startup
autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif

"}}}

" ViM generic settings {{{
syntax   on
filetype on
filetype plugin indent on
set number relativenumber
if !has('nvim')
    set noesckeys
    if v:version >= 800
        " packadd! matchit
    else
        " runtime macros/matchit.vim
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
    if has('nvim')
        set wildoptions=pum
    else
        set wildoptions=tagfile
    endif " if nvim
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
set updatetime=150
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
set nojoinspaces
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
set fillchars+=vert:\║,fold:-
set list
" set listchars=eol:¬,trail:·,extends:❯,precedes:❮
" set listchars=trail:·,extends:❯,precedes:❮
set listchars=tab:¦\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
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

augroup bufrd
    autocmd!
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
augroup END

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
set updatecount=100

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
augroup numbertoggle
    autocmd!
    autocmd BufEnter,InsertLeave * set relativenumber
    autocmd BufLeave,InsertEnter * set norelativenumber
augroup END

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
" vmap <Esc> l
inoremap jj l
nnoremap K i<CR><Esc>
" vnoremap jj l
noremap gV `[v`]
noremap Y y$

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
noremap  <silent><expr> j (v:count == 0 ? 'gj' : 'j')
noremap  <silent><expr> k (v:count == 0 ? 'gk' : 'k')

xnoremap <silent><expr> j  mode() ==# "v" ? "gj" : "j"
xnoremap <silent><expr> gj mode() ==# "v" ? "j"  : "gj"
xnoremap <silent><expr> k  mode() ==# "v" ? "gk" : "k"
xnoremap <silent><expr> gk mode() ==# "v" ? "k"  : "gk"

" Increment selected range based on the normal/line or in visual block mode
" xnoremap <silent><expr> <C-a> mode() ==# "\<C-V>" ? "g\<c-a>"  : "\<c-a>"

" Don't lose deleted text in insert mode <C-u>
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

nnoremap <silent><CR>   :call append(line('.'), '')<CR>
nnoremap <silent><M-CR> :call append(line('.')-1, '')<CR>

" redraw screen
" nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l><Paste>

" disable audio and visual bells
set noerrorbells
set novisualbell
set belloff=all
set t_vb=

" Write current buffer with sudo privileges
" nnoremap <silent><Leader>sw     :w !sudo tee % &> /dev/null<CR>
if !has('nvim')
    " Force saving files that require root permission
    command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
else
    command! W :w suda://%
    command! E :e suda://%
endif

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

" nnoremap <F9>                  :bprev<CR>
" nnoremap <F10>                 :bnext<CR>
noremap <F4>                    :echo expand('%:p')<CR>
nnoremap <silent><Leader>bd     :bdelete<CR>
nnoremap <silent><BS>           :nohlsearch<CR>
nnoremap <silent><Leader>bh     :Startify<CR>
" nnoremap <silent><Leader><Tab>  :b#<CR>
" nnoremap <Leader>[        :let @+ = expand("%")<CR>

" visual indentation (does not exit Visual mode after indentation)
" make shift+tab and tab indent
xnoremap > >gv
xnoremap < <gv
" imap <S-Tab> <C-o><<

" Toggle keybindings
" set pastetoggle=<Leader>tp
" nnoremap <silent><Leader>tg :GitGutterSignsToggle<CR>
" nnoremap <silent><Leader>ta :ALEToggle<CR>
" nnoremap <silent><Leader>ts :SignatureToggleSigns<CR>

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
let g:tagbar_sort             = 0 " don't sort items by name
let g:tagbar_indent           = 1
let g:tagbar_expand           = 0
let g:tagbar_show_linenumbers = 0
let g:tagbar_autoshowtag      = 1
nnoremap <silent><F8>            :TagbarToggle<CR>
" nnoremap <silent><leader>tt  :TagbarOpenAutoClose<CR>
" }}}

"vim-cycle {{{
let g:cycle_no_mappings = 1
nmap  <silent>- <Plug>CycleNext
nmap  <silent>+ <Plug>CyclePrev

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

let g:cycle_default_groups_for_gitrebase = [
            \ [[ 'pick', 'fixup', 'reword', 'edit', 'squash', 'drop' ]],
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
" let g:pymode_python            = 'python2'
" let g:pymode_python              = 'python'
let g:pymode_options             = 0
let g:pymode_options_colorcolumn = 1
let g:pymode_virtualenv          = 1
let g:pymode_indent              = 0
let g:pymode_rope                = 0
let g:pymode_lint                = 1
let g:pymode_lint_cwindow        = 0
let g:pymode_lint_signs          = 0
let g:pymode_syntax_space_errors = 0
let g:pymode_trim_whitespaces    = 0
let g:pymode_debug               = 0
let g:pymode_rope                = 0
let g:pydoc_perform_mappings     = 0
" let g:pymode_lint_checkers       = ['pylint', 'pep8', 'mccabe']
let g:pymode_lint_checkers       = ['pep8']
" let g:pymode_lint_ignore       = "E501"

" }}}

" braceless {{{
autocmd FileType python BracelessEnable +indent +fold +highlight
let g:braceless_block_key = 'i'
" }}}

" yankmatches {{{
let g:YankMatches#ClipboardRegister='a'
nnoremap <silent><Leader>dm    :call ForAllMatches('delete', {})<CR>
nnoremap <silent><Leader>di    :call ForAllMatches('delete', {'inverse':1})<CR>
nnoremap <silent><Leader>ym    :call ForAllMatches('yank',   {})<CR>
nnoremap <silent><Leader>yi    :call ForAllMatches('yank',   {'inverse':1})<CR>
vnoremap <silent><Leader>dm    :<C-U>call ForAllMatches('delete', {'visual':1})<CR>
vnoremap <silent><Leader>di    :<C-U>call ForAllMatches('delete', {'visual':1, 'inverse':1})<CR>
vnoremap <silent><Leader>ym    :<C-U>call ForAllMatches('yank',   {'visual':1})<CR>
vnoremap <silent><Leader>yi    :<C-U>call ForAllMatches('yank',   {'visual':1, 'inverse':1})<CR>
" }}}

" git-messenger {{{
nnoremap <silent><Leader>gm <Plug>(git-messenger)
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
let g:airline#extensions#wordcount#enabled          = 1
let g:airline#extensions#tagbar#enabled             = 1
let g:airline#extensions#tagbar#flags               = 'f'
let g:airline#extensions#wordcount#formatter        = 'default'
let g:airline#extensions#wordcount#format           = '%dWords'
let g:airline#extensions#anzu#enabled               = 0
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
let g:airline_symbols.readonly = '🔒'

" Customize Airline Layout
function! AirlineInit()
    call airline#parts#define_accent('mode', 'bold')
    " call airline#parts#define_accent('branch', 'italic')
    call airline#parts#define_accent('readonly', 'bold')
    call airline#parts#define_raw('linenr', '%l')
    call airline#parts#define_accent('linenr', 'bold')
    call airline#parts#define_raw('modified', '%{&modified ? "[+]" : ""}')
    call airline#parts#define_accent('modified', 'orange')
    call airline#parts#define_accent('tagbar', 'tagbar_color')
    call airline#parts#define_accent('filetype', 'ft_color')
    call airline#parts#define_raw('gutentags', '%{gutentags#statusline()}')

    " Condense path to manageable length
    call airline#parts#define_raw('path', '%{utils#CondensePath(expand("%f"), 25)}')
    call airline#parts#define_accent('path', 'path_color')

    " project root segment
    if !exists('g:gitroot')
        let g:gitroot=''
    endif
    " call airline#parts#define_raw('gitroot', '%{utils#gitroot()}')
    call airline#parts#define_raw('gitroot', '%{utils#getprojectname()}')
    call airline#parts#define_accent('gitroot', 'gitroot_color')
    call airline#parts#define_raw('gitroot_[', '%{empty(g:gitroot)? "" : "["}')
    call airline#parts#define_accent('gitroot_[', 'gitroot_paren_color')
    call airline#parts#define_raw('gitroot_]', '%{empty(g:gitroot)? "" : "]"}')
    call airline#parts#define_accent('gitroot_]', 'gitroot_paren_color')

    let g:airline_section_a = airline#section#create_left(['mode','crypt','paste','keymap','capslock','iminsert'])
    let g:airline_section_b = airline#section#create(['hunks', 'gutentags'])
    let g:airline_section_c = airline#section#create(['gitroot_[','gitroot','gitroot_]','readonly','path', 'modified'])
    let g:airline_section_x = airline#section#create_right(['tagbar','filetype'])
    let g:airline_section_y = airline#section#create_right(['ffenc'])
    let g:airline_section_z = airline#section#create_right(['≡%l:%v','ch:%02Bh','%p%%'])
    " let g:airline_section_z = airline#section#create_right(['branch','windowswap','obsession','≡%l:%v│','ch:%02Bh│','%p%%'])
    " let g:airline_section_z = airline#section#create_right(['branch','windowswap','obsession','≡l:%v│','%p%%'])
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
nmap <silent><F9>      <Plug>AirlineSelectPrevTab
nmap <silent><F10>     <Plug>AirlineSelectNextTab

if !get(g:, 'airline_powerline_fonts', 0)
    let g:airline#extensions#tabline#left_sep      = ''
    let g:airline#extensions#tabline#left_alt_sep  = '│'
    let g:airline#extensions#tabline#right_sep     = ''
    let g:airline#extensions#tabline#right_alt_sep = '│'
    let g:airline_left_alt_sep                     = '│'
    let g:airline_right_alt_sep                    = '│'
endif

let g:airline#extensions#default#section_truncate_width = {
            \ 'c': 25,
            \ }

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

" vim-anzu {{{
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" let g:anzu_status_format = "%p(%i/%l) %w"
let g:anzu_status_format = "%#AnzuNormal#anzu%#AnzuArrow# ➜ %#AnzuSearchObj#%p
            \%#AnzuParen#(%#AnzuSearchCnt#%i%#AnzuSeparator#/%#AnzuSearchTotalCnt
            \#%l%#AnzuParen#)%#None#"

" This command is an overridden one to make sure other one works if this plugin
" is disabled
nnoremap <silent><BS>  :nohlsearch<CR>\|<Plug>(anzu-clear-search-status)
" }}}

" Vim-licenses {{{
let g:licenses_copyright_holders_name = 'Ratheesh <ratheeshreddy@gmail.com>'
let g:licenses_authors_name           = 'Ratheesh S'
let g:licenses_default_commands       = ['gplv2', 'gplv3', 'mit']
" }}}

" CtrlP {{{
let g:ctrlp_extensions = [ 'tag', 'buffertag', 'quickfix', 'undo', 'line',
            \ 'changes', 'mixed', 'cscope', 'jumplist', 'marks', 'register' ]

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

let g:ctrlp_prompt_mappings = { 'PrtExit()': ['<esc>', '<c-c>', '<c-g>'] }

let g:ctrlp_use_caching = 0
if executable('fd')
    let g:ctrlp_user_command = 'fd --type f --hidden --color never "" %s'
    " let g:ctrlp_user_command = 'fd --hidden --color=never "" "%s"'
    set grepprg=rg\ --color=never
elseif executable('rg')
    let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
    set grepprg=rg\ --color=never
elseif executable('ag')
    let g:ctrlp_user_command = 'ag %s --hidden -l --nocolor -g ""'
    set grepprg=ag\ --nogroup\ --nocolor
else
    echom "Can\'t find fd/rg/ag executable. CtrlP may be slow!!!"
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
    let g:ctrlp_use_caching = 1
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
nnoremap <silent><leader>fg :CtrlPModified<CR>
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

" vim-ctrlp-ag {{{
" nnoremap <silent><Leader>gg :CtrlPag<CR>
" vnoremap <silent><Leader>gg :CtrlPagVisual<CR>
" nnoremap <leader>/          :CtrlPagLocate<space>
" " nnoremap <leader>cp :CtrlPagPrevious<CR>
" let g:ctrlp_ag_ignores = '--ignore .git
"             \ --ignore "deps/*"
"             \ --ignore "_build/*"
"             \ --ignore "node_modules/*"'
" }}}

" fly-grep {{{
nnoremap <Space>/ :FlyGrep<cr>
let g:FlyGrep_input_delay=1000
let g:spacevim_commandline_prompt='==>'
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
            \ 'prompt'                      : '➜ ',
            \ 'auto-accel'                  : v:true,
            \ 'auto-highlight'              : v:true,
            \ 'mode'                        : 'normal',
            \ 'start-filter'                : v:true,
            \ 'empty'                       : v:false,
            \ 'reversed'                    : v:true,
            \ 'root-markers'                : '.git,.hg,.svn',
            \ 'smartcase'                   : v:true,
            \ 'highlight_mode_normal'       : 'DeniteNormalHLLine',
            \ 'highlight-filter-background' : 'DeniteFloatWin',
            \ 'prompt_highlight'            : 'DenitePrompt',
            \ 'split'                       : 'horizantal',
            \ })


" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr><CR>    denite#do_map('do_action')
    nnoremap <silent><buffer><expr>d       denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr>p       denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr>q       denite#do_map('quit')
    nnoremap <silent><buffer><expr><Esc>   denite#do_map('quit')
    nnoremap <silent><buffer><expr>i       denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr>a       denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr><C-l>   denite#do_map('redraw')
    nnoremap <silent><buffer><expr><C-h>   denite#do_map('restore_sources')
    nnoremap <silent><buffer><expr><Space> denite#do_map('toggle_select').'j'
    nnoremap <silent><buffer><expr><Tab>   denite#do_map('choose_action')
endfunction

" Denite variables
call denite#custom#var('file/rec', 'command',
            \ ['rg', '--files', '--glob', '!.git', ''])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
            \ ['--hidden', '--vimgrep', '--no-heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Denite sources
"

nnoremap <silent><Leader>do   :<C-u>Denite file/rec<CR>
nnoremap <silent><Leader>db   :<C-u>Denite buffer<CR>
nnoremap <silent><Leader>dd   :P<C-u>DeniteCursorWord grep<CR>
nnoremap <silent><Leader>d/   :P<C-u>DeniteProjectDir grep<CR>
nnoremap <silent><Leader>dp   :<C-u>Denite register<CR>
nnoremap <silent><Leader>dl   :<C-u>Denite location_list -no-empty<CR>
nnoremap <silent><Leader>du   :<C-u>Denite file_mru<CR>
nnoremap <silent><Leader>dy   :<C-u>Denite neoyank<CR>
nnoremap <silent><Leader>dr   :<C-u>Denite -resume<CR>
" nnoremap <silent><leader>ds   :<C-u>Denite history:search -mode=normal<CR>
" nnoremap <silent><leader>dc   :<C-u>Denite history:cmd -mode=normal<CR>

hi link deniteMatchedChar Special

" }}}

" vim-startify {{{

let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   Files']            },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]

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

let g:startify_files_number=10
let g:startify_change_to_vcs_root=1

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
    if has('nvim')
        set signcolumn=auto:3
    else
        set signcolumn=yes
    endif " if nvim
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

" textobj for hunks (i/a)h
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual

" }}}

" git-patch-tags {{{
augroup gitCommmit
    au!
    autocmd FileType gitcommit
                \  nmap <buffer> <LocalLeader>gs  <Plug>GitSignOff
                \| nmap <buffer> <LocalLeader>gt  <Plug>GitTested
                \| nmap <buffer> <LocalLeader>ga  <Plug>GitAck
                \| nmap <buffer> <LocalLeader>gc  <Plug>GitCC
                \| nmap <buffer> <LocalLeader>gr  <Plug>GitReviewed
                \| nmap <buffer> <LocalLeader>gR  <Plug>GitReporter
augroup END
" }}}

" gutentags {{{
" enable only ctags
let g:gutentags_modules = ['ctags']

" config project root markers.
let g:gutentags_project_root = ['.root', '.git', '.svn']

" generate datebases in my cache directory, prevent gtags files polluting my project
" let g:gutentags_cache_dir = expand('~/.cache/tags')

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

" neo-snippets {{{
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

let g:neosnippet#enable_completed_snippet = 1

imap <expr><TAB>
            \ pumvisible() ? "\<C-n>" :
            \ neosnippet#expandable_or_jumpable() ?
            \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB>
            \ neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

" }}}

" vim-ale {{{
let g:ale_sign_column_always   = 1
let g:ale_lint_on_text_changed = "never"
let g:ale_lint_on_insert_leave = 1
autocmd BufEnter ControlP let b:ale_enabled = 0
let g:ale_set_loclist  = 0
let g:ale_set_quickfix = 1
let g:ale_open_list    = 0
let g:ale_gitcommit_gitlint_use_global=0
let g:ale_python_pylint_executable = 'python'

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

" ShowPairs {{{
let g:showpairs_limit=1000
" }}}

" hipairs {{{
let g:hiPairs_timeout=1000
let g:hiPairs_insert_timeout=1000
let g:hiPairs_stopline_more=200
let g:hiPairs_hl_matchPair = {
            \    'term'    : 'bold,underline',
            \    'ctermfg' : '24',
            \    'ctermbg' : 'NONE',
            \    'cterm'   : 'bold,underline',
            \    'guifg'   : '#008fff',
            \    'guibg'   : 'NONE',
            \    'gui'     : 'bold,underline',
            \ }

let g:hiPairs_hl_unmatchPair = {
            \    'term'    : 'bold,underline',
            \    'ctermfg' : 'NONE',
            \    'ctermbg' : '2',
            \    'cterm'   : 'bold,underline',
            \    'guifg'   : 'NONE',
            \    'guibg'   : '#f92a5b',
            \    'gui'     : 'bold,underline',
            \ }
" }}}

" vim-indentguides {{{
let g:indentguides_ignorelist = ['text', 'vim', 'python']
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
" nnoremap <silent><leader>th           :HardTimeToggle<CR>
" }}}

"jedi-vim {{{
let g:jedi#show_call_signatures       = 1
let g:jedi#popup_on_dot               = 1
" let g:jedi#goto_command             = "<leader>d"
let g:jedi#auto_vim_configuration     = 0
let g:jedi#popup_select_first         = 0
let g:jedi#show_call_signatures_delay = 100
let g:jedi#smart_auto_mappings        = 1
let g:jedi#goto_assignments_command   = "<leader>g"
let g:jedi#goto_definitions_command   = ""
let g:jedi#completions_enabled        = 0
let g:jedi#documentation_command      = "K"
let g:jedi#usages_command             = "<leader>n"
let g:jedi#completions_command        = "<C-Space>"
let g:jedi#rename_command             = "<leader>R"
"}}}

" echodoc {{{
let g:echodoc#enable_at_startup      = 1
let g:echodoc#enable_force_overwrite = 1
let g:deoplete#_prev_completion      = 1
if has('nvim')
    if exists('*nvim_open_win')
        let g:echodoc#type="floating"
    else
        let g:echodoc#type="virtual"
    endif
else
    let g:echodoc#type="echo"
endif

let g:echodoc#highlight_identifier = "EchoDocFunc"
let g:echodoc#highlight_arguments  = "EchoDocParam"
let g:echodoc#highlight_trailing   = "EchoDocTrailing"
" }}}

" Languageclient-Neovim {{{
let g:LanguageClient_selectionUI         = 'location-list'
let g:LanguageClient_diagnosticsEnable   = 0
let g:LanguageClient_diagnosticsSignsMax = 0
let g:LanguageClient_hasSnippetSupport   = 0
let g:LanguageClient_serverCommands      = {
            \ 'c': ['/usr/bin/clangd'],
            \ 'cpp': ['/usr/bin/clangd'],
            \ 'python': ['/usr/local/bin/pyls'],
            \ }
let g:LanguageClient_autoStart = 1
" }}}

" deoplete {{{
set completeopt+=noinsert
let g:deoplete#enable_at_startup = 1
if !has('nvim')
    let g:deoplete#enable_yarp   = 1
endif
" let g:deoplete#auto_complete_delay          = 30
let g:deoplete#auto_refresh_delay           = 30
let g:deoplete#file#enable_buffer_path      = 1
let g:deoplete#max_list                     = 100
let deoplete#tag#cache_limit_size           = 10000000
let g:deoplete#buffer#require_same_filetype = 0
" let g:deoplete#complete_method              = "completefunc"
let g:deoplete#complete_method            = "omnifunc"

call deoplete#custom#option({
            \ 'auto_complete_delay' : 50,
            \ 'ignore_case'         : v:false,
            \ 'smart_case'          : v:true,
            \ 'complete_method'     : 'omnifunc',
            \ 'min_pattern_length'  : 2,
            \ 'async_timeout'       : 100,
            \ 'refresh_always'      : v:true,
            \ 'num_processes'       : 2,
            \ })

" call deoplete#custom#option('candidate_marks',
"             \ ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'])

" inoremap <expr>A  pumvisible() ? deoplete#insert_candidate(0) : 'A'
" inoremap <expr>S  pumvisible() ? deoplete#insert_candidate(1) : 'S'
" inoremap <expr>D  pumvisible() ? deoplete#insert_candidate(2) : 'D'
" inoremap <expr>F  pumvisible() ? deoplete#insert_candidate(3) : 'F'
" inoremap <expr>G  pumvisible() ? deoplete#insert_candidate(4) : 'G'
" inoremap <expr>H  pumvisible() ? deoplete#insert_candidate(5) : 'H'
" inoremap <expr>J  pumvisible() ? deoplete#insert_candidate(6) : 'J'
" inoremap <expr>K  pumvisible() ? deoplete#insert_candidate(7) : 'K'
" inoremap <expr>L  pumvisible() ? deoplete#insert_candidate(8) : 'L'

" call deoplete#custom#option('refresh_always', v:true)
" call deoplete#custom#option('num_processes', 0)

" Don't align these lines!
set completeopt=longest,menuone
set pumheight=10 " set max. Height of popup menu

" let g:deoplete#sources  = {}
" let g:deoplete#sources_ = [] " includes all sources
call deoplete#custom#option('sources', {
            \ '_': [],
            \})

" Use partial fuzzy matches like YouCompleteMe
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
" call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy'])

" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

call deoplete#custom#source('buffer'         , 'mark' , '[Buf]')
call deoplete#custom#source('clangx'         , 'mark' , '[CLang')
call deoplete#custom#source('clang'          , 'mark' , '[CLang')
call deoplete#custom#source('LanguageClient' , 'mark' , '[LSP]')
" call deoplete#custom#source('member'         , 'mark' , '[M]')
call deoplete#custom#source('function'       , 'mark' , '[Func]')

call deoplete#custom#source('_', 'sorters', ['sorter_mru', 'sorter_rank'])

call deoplete#custom#source('LanguageClient' , 'rank' , 9960)
call deoplete#custom#source('jedi'           , 'rank' , 9959)
call deoplete#custom#source('neosnippet'     , 'rank' , 9958)
call deoplete#custom#source('ultisnips'      , 'rank' , 9958)
call deoplete#custom#source('member'         , 'rank' , 9957)
call deoplete#custom#source('tag'            , 'rank' , 9955)
call deoplete#custom#source('clangx'         , 'rank' , 9954)
call deoplete#custom#source('clang'          , 'rank' , 9953)
call deoplete#custom#source('buffer'         , 'rank' , 9952)
call deoplete#custom#source('function'       , 'rank' , 9951)

call deoplete#custom#var('around', {
            \   'range_above': 5,
            \   'range_below': 5,
            \   'mark_above': '[↑]',
            \   'mark_below': '[↓]',
            \   'mark_changes': '[*]',
            \})

" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-\> pumvisible() ? "\<C-w>" : "\<C-\>"
" inoremap <expr><Esc> pumvisible() ?deoplete#close_popup():"\<Esc>"

inoremap <expr><C-l>   pumvisible() ? deoplete#refresh() : "\<C-l>"
" Undo completion i.e remove whole completed word (default plugin mapping)
inoremap <expr><C-g> deoplete#undo_completion()

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
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" following code works only in ViM for now
" if !has('nvim')
" let g:UltiSnipsExpandTrigger = "<nop>"
" inoremap <CR> <C-r>=pumvisible() ? UltiSnips#ExpandSnippetOrJump() : "\n"<CR>
" endif

" \ 'converter_remove_overlap',
" \ 'converter_truncate_menu',
" \ 'converter_truncate_abbr',
call deoplete#custom#source('_', 'converters', [
            \ 'converter_remove_paren',
            \ 'converter_auto_delimiter',
            \ ])

" show doc strings for jedi
let g:deoplete#sources#jedi#show_docstring = 1

" }}}

" ncm2#enable_for_buffer {{{
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect
" let g:ncm2#complete_delay = 200
" let g:ncm2#popup_delay    = 100
" let g:ncm2#matcher='abbrfuzzy'
" let g:ncm2#sorter='abbrfuzzy'
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" call ncm2#override_source('tagprefix'        , {'mark': 'T'})
" call ncm2#override_source('bufword'          , {'mark': 'B'})
" call ncm2#override_source('bufpath'          , {'mark': 'BufPath'})
" call ncm2#override_source('cwdpath'          , {'mark': './'})
" call ncm2#override_source('rootpath'         , {'mark': '#'})
" call ncm2#override_source('tmux'             , {'mark': 'Tmux'})
" call ncm2#override_source('LanguageClient_c' , {'mark': 'LSP'})

" call deoplete#custom#source('buffer'         , 'mark' , '[Buf]')
" let g:ncm2_tagprefix='[T]'
" let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
" let $NVIM_PYTHON_LOG_LEVEL="INFO"
" }}}

" vim-textobj-anyblock {{{
let g:textobj#anyblock#blocks = [ '(', '{', '[', '"', "'"]
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

" nmap <Leader>o <Plug>(textmanip-blank-below)
" nmap <Leader>O <Plug>(textmanip-blank-above)

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
    nnoremap <silent><M-;>  :call NERDComment("n", "Append")<CR>
else
    nnoremap <silent>;    :call NERDComment("n", "Append")<CR>
endif

nnoremap <silent><Leader>cc :call NERDComment("n", "Comment")<CR>
xnoremap <silent><Leader>cc :call NERDComment("x", "Comment")<CR>

nnoremap <silent><Leader>cu :call NERDComment("n", "Uncomment")<CR>
xnoremap <silent><Leader>cu :call NERDComment("x", "Uncomment")<CR>

nnoremap <silent><Leader>ci :call NERDComment("n", "Invert")<CR>
xnoremap <silent><Leader>ci :call NERDComment("x", "Invert")<CR>

nnoremap <silent><Leader>cs :call NERDComment("n", "Sexy")<CR>
xnoremap <silent><Leader>cs :call NERDComment("x", "Sexy")<CR>

nnoremap <silent><Leader>ct :call NERDComment("n", "Toggle")<CR>
xnoremap <silent><Leader>ct :call NERDComment("x", "Toggle")<CR>

" this does not work on ftypes that does not support multipart delimiters
nnoremap <silent><Leader>cm :call NERDComment("n", "Minimal")<CR>
xnoremap <silent><Leader>cm :call NERDComment("x", "Minimal")<CR>
" }}}

" vim-better-whitespace {{{
let g:better_whitespace_enabled     = 1
let g:strip_only_modified_lines     = 1
let g:strip_whitespace_on_save      = 1
let g:strip_whitespace_confirm      = 0
let g:show_spaces_that_precede_tabs = 1
let g:better_whitespace_filetypes_blacklist= ['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']
" }}}

" lessspace {{{
let g:lessspace_enabled = 0
let g:lessspace_whitelist = ['c', 'cxx', 'cpp', 'python', 'vim']
" let g:lessspace_normal = 0
" }}}

" wstrip {{{
let g:wstrip_auto = 1
" }}}

" vim-expand-region {{{
map <C-l> <Plug>(expand_region_expand)
map <C-h> <Plug>(expand_region_shrink)
" }}}

" auto-pairs {{{
let g:AutoPairsFlyMode            = 1
let g:AutoPairsMultilineClose     = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
" }}}

" vim-endwize {{{
inoremap <silent><CR> <CR><C-r>=endwize#crend()<CR>

let g:endwize_add_info_filetypes = [ 'vim', 'sh', 'zsh', 'c', 'cpp']
let g:endwize_add_verbose_info_filetypes = [ 'c', 'cpp' ]
" }}}

" vim-highlightedundo {{{
let g:highlightedundo#highlight_mode            = 2
let g:highlightedundo#highlight_duration_delete = 200
let g:highlightedundo#highlight_duration_add    = 250
" nmap u     <Plug>(highlightedundo-undo)
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

" vim-argumentative {{{
let g:argumentative_no_mappings=1

" custom mappings
" nmap [a <Plug>Argumentative_Prev
" nmap ]a <Plug>Argumentative_Next
" xmap [a <Plug>Argumentative_XPrev
" xmap ]a <Plug>Argumentative_XNext
nmap <a <Plug>Argumentative_MoveLeft
nmap >a <Plug>Argumentative_MoveRight
xmap ia <Plug>Argumentative_InnerTextObject
xmap aa <Plug>Argumentative_OuterTextObject
omap ia <Plug>Argumentative_OpPendingInnerTextObject
omap aa <Plug>Argumentative_OpPendingOuterTextObject
" }}}

" vim-easy-align {{{
let g:easy_align_bypass_fold = 1
nmap ga     <Plug>(EasyAlign)
xmap ga     <Plug>(EasyAlign)
xmap <M-BS>   <plug>(LiveEasyAlign)
let g:easy_align_interactive_modes = ['l', 'r']
let g:easy_align_bang_interactive_modes = ['c', 'r']
let g:easy_align_ignore_groups = ['Comment', 'String']
" }}}


" vim-visual-increment {{{
set nrformats=alpha,octal,hex
" }}}

" oscyank {{{
noremap <leader>y :Oscyank<CR>
" }}}

" vim-table-mode {{{
let g:table_mode_corner_corner='+'
" }}}

" Cmd2 {{{
if !has('nvim')
    let g:Cmd2_cursor_blink = 0

    nmap : :<F6>
    nmap / /<F6>
    nmap ? ?<F6>
    xmap : :<F6>
    " xmap / /<F6>
    xmap ? ?<F6>
    cmap <F6> <Plug>(Cmd2Suggest)

    let g:Cmd2_options = {
                \ '_complete_ignorecase'      : 1,
                \ '_complete_uniq_ignorecase' : 0,
                \ '_quicksearch_ignorecase'   : 1,
                \ '_complete_start_pattern'   : '\<\(\[agls]\:\)\?\(\k\*\[_\-#]\)\?',
                \ '_complete_fuzzy'           : 1,
                \ '_suggest_render'           : 'Cmd2#render#New().WithInsertCursor().WithAirlineMenu()',
                \ '_complete_string_pattern'  : '\v\k(\k|\.)*',
                \ '_complete_loading_text'    : '...',
                \ 'menu_hl'                   : 'airline_x',
                \ 'menu_selected_hl'          : 'WildMenu',
                \ 'menu_separator_hl'         : 'airline_x',
                \ 'menu_next'                 : '⇛',
                \ 'menu_previous'             : '⇚',
                \ }

    function! s:Peekaboo()
        call peekaboo#peek(1, 'ctrl-r',  0)
    endfunction

    let g:Cmd2_cmd_mappings = {
                \ 'Peekaboo'        : {'command': function('s:Peekaboo'), 'type': 'function'},
                \ 'iw'              : {'command': 'iw', 'type': 'text', 'flags': 'Cpv'},
                \ 'ap'              : {'command': 'ap', 'type': 'line', 'flags': 'pv'},
                \ '^'               : {'command': '^', 'type': 'normal!', 'flags': 'r'},
                \ 's'               : {'command': 's/###/###/g', 'type': 'snippet'},
                \ 'S'               : {'command': 'Cmd2#functions#CopySearch', 'type': 'function'},
                \ 'b'               : {'command': 'Cmd2#functions#Back', 'type': 'function', 'flags': 'r'},
                \ 'e'               : {'command': 'Cmd2#functions#End', 'type': 'function', 'flags': 'r'},
                \ 'CF'              : {'command': function('Cmd2#ext#complete#Main'), 'type': 'function'},
                \ 'CB'              : {'command': function('Cmd2#ext#complete#Main'), 'type': 'function'},
                \ 'w'               : {'command': 'Cmd2#functions#Cword', 'type': 'function', 'flags': 'Cr'},
                \ '\<Plug>Cmd2Tab'  : {'command': "Cmd2#functions#TabForward", 'type': 'function', 'flags': 'C'},
                \ '\<Plug>Cmd2STab' : {'command': "Cmd2#functions#TabBackward", 'type': 'function', 'flags': 'C'},
                \ '\<Tab>'          : {'command': "\<Plug>Cmd2Tab", 'type': 'remap', 'flags': 'C'},
                \ '\<S-Tab>'        : {'command': "\<Plug>Cmd2STab", 'type': 'remap', 'flags': 'C'},
                \ }
    cmap <C-L> <Plug>Cmd2
    " cmap <expr> <C-N> Cmd2#ext#complete#InContext() ? "\<Plug>Cmd2CF" : "\<Tab>"
    " cmap <expr> <C-P> Cmd2#ext#complete#InContext() ? "\<Plug>Cmd2CB" : "\<S-Tab>"
    cmap <C-R> <Plug>(Cmd2)Peekaboo

    set wildcharm=<Tab>
endif
" }}}

" wilder {{{
if has('nvim')
    call wilder#enable_cmdline_enter()
    cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
    cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"
    set wildcharm=<Tab>

    let s:status_hl = wilder#make_hl('WilderStatus', 'WildStatus')
    let s:mode_hl   = wilder#make_hl('WilderMode', 'WildMode')
    let s:index_hl  = wilder#make_hl('WilderIndex', 'airline_z')
    let s:sep_hl    = wilder#make_hl('WilderSep', 'WilderSeparator')

    call wilder#set_option('pipeline', [
                \   wilder#branch(
                \     [
                \       wilder#check({_, x -> empty(x)}),
                \       wilder#history(10),
                \     ],
                \     wilder#cmdline_pipeline(),
                \     [
                \       wilder#python_fuzzy_delimiter(),
                \       wilder#python_search({'engine': 're'}),
                \       wilder#result_output_escape('^$,*~[]/\'),
                \     ],
                \   ),
                \ ])

    call wilder#set_option('renderer', wilder#statusline_renderer({
                \ 'separator':' • ',
                \ 'separator_hl': s:sep_hl,
                \ 'hl': s:status_hl,
                \ 'left': [
                \    {'value': [{-> getcmdtype() ==# ':' ? ' Kommand ' : ' Suche '}, wilder#spinner()], 'hl': s:mode_hl},
                \    wilder#separator('', s:mode_hl, s:status_hl, 'left'), ' ',
                \ ],
                \ 'right': [
                \    ' ', wilder#separator('', s:index_hl, s:status_hl, 'right'),
                \    wilder#index({'hl': s:index_hl}),
                \ ],
                \ }))

    " Enable cmdline completion (for Neovim only)
    call wilder#set_option('modes', ['/', '?', ':'])
endif
" }}}

" vim-matchup {{{
let b:matchup_matchparen_enabled = 0
" }}}

" vim-submode {{{
let g:submode_always_show_submode = 1
let g:submode_keyseqs_to_leave    = ['<Esc>']
let g:submode_timeout             = 0

" Submode for Gitgutter plugin -> navigate next/prev hunk using j/k keys
call submode#enter_with('git-gutter', 'n', 'r', '<leader>gn', '<Plug>GitGutterNextHunk')
call submode#enter_with('git-gutter', 'n', 'r', '<leader>gp', '<Plug>GitGutterPrevHunk')
call submode#leave_with('git-gutter', 'n', '', '<Esc>')
call submode#map('git-gutter', 'n', 'r', 'j', '<Plug>GitGutterNextHunk')
call submode#map('git-gutter', 'n', 'r', 'k', '<Plug>GitGutterPrevHunk')
call submode#map('git-gutter', 'n', 'r', '.', '.')

" Submode for undo/redo with g-/+ -> use -/= to undo and redo
call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
call submode#leave_with('undo/redo', 'n', '', '<Esc>')
call submode#map('undo/redo', 'n', '', '-', 'g-')
call submode#map('undo/redo', 'n', '', '=', 'g+')

" Submode for textmanip plugin(visual mode) for moving line/region with h/j/k/l
call submode#enter_with('textmanip', 'x', 'r', '<M-j>', '<Plug>(textmanip-move-down)')
call submode#enter_with('textmanip', 'x', 'r', '<M-k>', '<Plug>(textmanip-move-up)')
call submode#enter_with('textmanip', 'x', 'r', '<M-h>', '<Plug>(textmanip-move-left)')
call submode#enter_with('textmanip', 'x', 'r', '<M-l>', '<Plug>(textmanip-move-right)')
call submode#leave_with('textmanip', 'x', '', '<Esc>')
call submode#map('textmanip', 'x', 'r', 'j', '<Plug>(textmanip-move-down)')
call submode#map('textmanip', 'x', 'r', 'k', '<Plug>(textmanip-move-up)')
call submode#map('textmanip', 'x', 'r', 'h', '<Plug>(textmanip-move-left)')
call submode#map('textmanip', 'x', 'r', 'l', '<Plug>(textmanip-move-right)')

" Submode for switching buffers. Use h/l to navigate between neighboring buffers
" call submode#enter_with('buf-nav', 'n', 'r', '<leader>h', '<Plug>AirlineSelectPrevTab')
" call submode#enter_with('buf-nav', 'n', 'r', '<leader>l', '<Plug>AirlineSelectNextTab')
" call submode#leave_with('buf-nav', 'n', '', '<Esc>')
" call submode#map('buf-nav', 'n', 'r', 'h', '<Plug>AirlineSelectPrevTab')
" call submode#map('buf-nav', 'n', 'r', 'l', '<Plug>AirlineSelectNextTab')

" Submode for navigating marks. Use j/k to navigate between marks
call submode#enter_with('marks', 'n', 'r', '<leader>mn', ']`')
call submode#enter_with('marks', 'n', 'r', '<leader>mp', '[`')
call submode#leave_with('marks', 'n', '', '<Esc>')
call submode#map('marks', 'n', 'r', 'j', ']`')
call submode#map('marks', 'n', 'r', 'k', '[`')
"}}}

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

" vim-textobj-parameter {{{
let g:vim_textobj_parameter_mapping = 'a'
" }}}

" vim-peekaboo {{{
let g:peekaboo_window='vert bo 60new'
" }}}

" Misc useful functions {{{
" bracketed-paste settings - supports only ViM for now
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

" nnoremap <silent><leader>tl :call ToggleList("Location List", 'l')<CR>
" nnoremap <silent><leader>tq :call ToggleList("Quickfix List", 'c')<CR>

" }}}

" Misc macros {{{
" Print syntax highlight group for the word under cursor in command area
nnoremap <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}

" Use guicolors in terminal (we need to place this here as it is easy to disable!)
if has("termguicolors")
    set termguicolors
else
    echom "24Bit colors are not supported in this ViM!"
endif

if has('nvim')
    " Set cursor color based on mode. Though this is limited compared to cursor
    " mode, this setting does not break locationlist/preview window title issue
    " with airline plugin.
    " Only neovim support for now!
    highlight nCursor guifg=#e0e0e0 guibg=#e0e0e0 gui=bold cterm=bold
    highlight iCursor guifg=#ff5555 guibg=#ff5555 gui=bold cterm=bold
    highlight vCursor guifg=#1bb1e7 guibg=#1bb1e7 gui=bold cterm=bold
    highlight rCursor guifg=#d65b84 guibg=#d65b84 gui=bold cterm=bold
    highlight oCursor guifg=#00ff00 guibg=#00ff00 gui=bold cterm=bold
    set guicursor=n:block-nCursor-blinkon0,i-ci:ver20-iCursor-blinkon0,v-ve:block-vCursor-blinkon0,o:hor30-oCursor-blinkon0,r-cr:block-rCursor-blinkon0
    autocmd VimLeave * set guicursor=a:block-NCursor-blinkon0
endif

" Autoload vimrc on save
" autocmd BufWritePost .vimrc source %

" End of File
