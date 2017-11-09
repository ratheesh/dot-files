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
set nocompatible               " be iMproved
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

Plug 'mhinz/vim-startify'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
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
Plug 'thiderman/ctrlp-project'
Plug 'ivalkeen/vim-ctrlp-tjump'
" Plug 'thiderman/ctrlp-project'
" Plug 'sgur/ctrlp-extensions.vim'
" Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'jasoncodes/ctrlp-modified.vim'
" Plug 'DavidEGx/ctrlp-smarttabs'
" Plug 'JazzCore/ctrlp-cmatcher'
Plug 'FelikZ/ctrlp-py-matcher'
" Plug 'lokikl/vim-ctrlp-ag'
Plug 'ivan-cukic/vim-ctrlp-cscope'
" Plug 'pelodelfuego/vim-swoop'
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'yggdroot/leaderf'
" Plug 'gcavallanti/vim-noscrollbar'
Plug 'wikitopian/hardmode' " Make life under ViM little difficult!
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'easymotion/vim-easymotion'
Plug 'edkolev/promptline.vim'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'Yggdroot/indentLine'
Plug 'thaerkh/vim-indentguides'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
" Plug 'unblevable/quick-scope'
" Plug 'rhysd/clever-f.vim'
Plug 'ratheesh/vim-extended-ft'
Plug 'WolfgangMehner/c-support'
Plug 'vim-scripts/AutoAlign'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-scripts/YankRing.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'antoyo/vim-licenses'
Plug 'kshenoy/vim-signature'
" Plug 'MattesGroeger/vim-bookmarks'
Plug 'mattn/ctrlp-mark'
Plug 'shinnya/ctrlp-jumplist'
Plug 'kien/rainbow_parentheses.vim'
" Plug 'tpope/vim-characterize'
Plug 'adelarsq/vim-matchit'
Plug 'vitalk/vim-shebang'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/taglist.vim'
Plug 'ervandew/supertab'
Plug 'vim-scripts/OmniCppComplete'
Plug 'rking/ag.vim'
Plug 'sjl/vitality.vim'
" Plug 'pelodelfuego/vim-swoop'
" Plug 'python-mode/python-mode'
Plug 'fatih/vim-go' , { 'do': ':GoInstallBinaries' }
" Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'ntpeters/vim-airline-colornum'
" Plug 'Shougo/neocomplete.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug '~/.vim/local/c_std'

call plug#end()
"}}}

" Vim vanilla settings {{{
filetype plugin indent on
set shortmess+=I
" set number
set number relativenumber
set numberwidth=1
set tabstop=8
set showmatch
set matchtime=1
set showcmd
" set colorcolumn=81
execute "set colorcolumn=" . join(range(81,335), ',')
" set columns=80
set ruler
set nofoldenable    " disable folding
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu
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
" set cursorcolumn
if exists('+breakindent')
	set breakindent showbreak=\ +
endif
set hidden   " See http://items.sjbach.com/319/configuring-vim-right
set wmh=0    " Windows need not have height
set foldmethod=marker
set lazyredraw
set linebreak
" set copyindent
set gcr=a:blinkon0              " Disable cursor blink
set clipboard=unnamed           " Share * register w/ unnamed (system copy/paste support)
set encoding=utf-8
set scrolloff=3 " Keep 3 lines below and above the cursor
set laststatus=2
if !has('gui_running')
set t_Co=256  " Support for 256 colors
endif
set noshowmode
set fillchars="vert:|,fold:-"
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

" Skip the splash screen
set shortmess+=I
set novb
set ttyfast
set formatoptions+=1
set lbr
" set iskeyword-=_

" Double slash -> Case insensitive search
" map // /\c
" map ?? ?\c

" let python_highlight_all=1

let mapleader = "\<Space>"
"}}}

" General Config {{{
" hooks
" Relative linenumbers disabled in insertmode
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

au BufNewFile,BufRead .bashrc*,bashrc,bash.bashrc,.bash_aliases,.bash_profile*,.bash_logout*,*.bash,*.ebuild set filetype=sh

" keybindings
" disable arrow key navigation to break bad habit
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>

" nmap <Leader><Leader> :
imap jj <Esc>
nnoremap ' `
nnoremap ` '
nnoremap <Leader>so 	:source $MYVIMRC<CR>
nnoremap <Leader>w 	:w<CR>
nnoremap <Leader>x 	:x<CR>
nnoremap <Leader>q 	:q<CR>
nnoremap <Leader>nq 	:q!<CR>

" nnoremap <Leader>j :
nmap <Leader><Leader> V
map <F9>  	:bprev<cr>
map <F10> 	:bnext<cr>
nmap <Leader>bd :bdelete<CR>
nmap <Leader>\ 	:nohlsearch<CR>
nmap <Leader>bh :Startify<CR>
nmap <Leader>bb :b#<CR>
" Remember last buffers loaded and file position
set viminfo=%,<800,'10,/50,:100,h,f0,n~/.viminfo
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" }}}

" Theme {{{
syntax on
color darktheme
" }}}

" Tagbar {{{
nmap <F8> :TagbarToggle<CR>
nnoremap <leader>t :TagbarOpenAutoClose<CR>
" }}}

" Vim-airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme           = 'darkmode' " sane ones -> ubaryd sol wombat bubblegum
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline#extensions#whitespace#enabled  = 0
let g:airline_detect_spelllang               = 0
let g:airline_detect_modified                = 1
let g:airline_detect_paste                   = 1
let g:airline#extensions#syntastic#enabled   = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#branch#enabled      = 1

" let g:airline#extensions#syntastic#enabled = 0
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_splits = 1
" let g:airline#extensions#tabline#show_tab_nr = 1
" let g:airline#extensions#tabline#show_tab_type = 1
"
" let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tagbar#enabled     = 1
let g:airline#extensions#ale#enabled        = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#wordcount#enabled = 1

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
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
      	\ 	},
	\ 'enable': {
	\ 	'statusline': 1,
	\ 	'tabline': 1,
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
let g:licenses_authors_name           = 'Ratheesh <ratheeshreddy@gmail.com>'
let g:licenses_default_commands       = ['gplv2', 'mit']
" }}}

" vim-sneak{{{
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
let g:sneak#label  = 1
let g:sneak#s_next = 1
"}}}

" CtrlP {{{
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'undo', 'line',
	\ 'changes', 'mixed', 'cscope', 'jumplist', 'marks']

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
	let g:ctrlp_user_command = 'ag %s --hidden -l --nocolor -g ""'
else
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
endif

" let g:ctrlp_by_filename = 0
" let g:ctrlp_follow_symlinks = 0

" if executable('fzf')
	" nnoremap <Leader>ff :FZF<CR>
" endif

let g:ctrlp_match_window = 'min:1,max:10,results:100'
" let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" let g:ctrlp_match_current_file = 0

" let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd               = 'CtrlPBuffer'
let g:ctrlp_show_hidden       = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers      = ['.ctrlp']

nnoremap <Leader>fo :CtrlP<CR>
nnoremap <Leader>fb :CtrlPBuffer<CR>
nnoremap <Leader>fr :CtrlPMRU<CR>
nnoremap <Leader>ft :CtrlPBufTag<CR>
nnoremap <Leader>fT :CtrlPBufTagAll<CR>
nnoremap <Leader>fj :CtrlPJumpList<CR>
" nnoremap <Leader>fm :CtrlPMixed<CR>

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }
" }}}

" ctrlp-funky {{{
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_matchtype        = 'line'
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_nolim            = 1
" }}}

" ctrlp_bdelete {{{
call ctrlp_bdelete#init()
"}}}

" vim-ctrlp-tjump {{{
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
let g:ctrlp_tjump_only_silent = 1
" }}}

" ctrlp-extensions {{{
nnoremap <Leader>fy :CtrlPYankring<CR>
let g:ctrlp_yankring_limit           = 100
let g:ctrlp_yankring_highlight       = 1
let g:ctrlp_yankring_use_textchanged = 1
let g:ctrlp_yankring_minimum_chars   = 2
" }}}

" vim-swoop {{{
nmap <Leader>l :call Swoop()<CR>
vmap <Leader>l :call SwoopSelection()<CR>
let g:swoopIgnoreCase = 1
" let g:swoopAutoInsertMode = 0
" }}}

" vim-ctrlp-ag {{{
" nnoremap <c-f> :CtrlPag<cr>
" vnoremap <c-f> :CtrlPagVisual<cr>
nnoremap <leader>ca :CtrlPagLocate
nnoremap <leader>cp :CtrlPagPrevious<cr>
let g:ctrlp_ag_ignores = '--ignore .git
    \ --ignore "deps/*"
    \ --ignore "_build/*"
    \ --ignore "node_modules/*"'
" }}}

" supertab {{{
let g_SuperTabDefaultCompletionType="context"
"}}}

" vim-startify {{{
let g:startify_bookmarks = [ 	{'c': '~/.vimrc'},
			\	{'z': '~/.zshrc'},
			\	{'t': '~/.tmux.conf'}]
" }}}

" vim-gitgutter {{{
let g:gitgutter_override_sign_column_highlight = 0
if exists('&signcolumn')  " Vim 7.4.2201
	set signcolumn=yes
else
	let g:gitgutter_sign_column_always = 1
endif
autocmd FileType tagbar,nerdtree setlocal signcolumn=no

let g:gitgutter_sign_modified = '='

nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterRevertHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
nmap <Leader>hP <Plug>GitGutterPreviewHunk
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
let g:EasyMotion_do_mapping 	  = 0 " Disable default mappings
nmap <Leader>jj <Plug>(easymotion-s)
let g:EasyMotion_smartcase        = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout
"}}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

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
" ((((((((((((((((()))))))))))))))))
let g:rbpt_colorpairs = [
    \ [178,     'RoyalBlue3' 	],
    \ [162,    	'SeaGreen3' 	],
    \ [12,    	'DarkOrchid3' 	],
    \ [132,   	'firebrick3' 	],
    \ [93,    	'RoyalBlue3' 	],
    \ [208,     'SeaGreen3' 	],
    \ [126, 	'DarkOrchid3' 	],
    \ [94,      'firebrick3' 	],
    \ [198,     'RoyalBlue3' 	],
    \ [166,      'SeaGreen3' 	],
    \ [142, 	'DarkOrchid3' 	],
    \ [172,    	'firebrick3' 	],
    \ [162,   	'RoyalBlue3' 	],
    \ [28, 	'SeaGreen3' 	],
    \ [96,      'DarkOrchid3' 	],
    \ [172,      'firebrick3' 	],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter 	* RainbowParenthesesToggle
au Syntax   	* RainbowParenthesesLoadRound
au Syntax 	* RainbowParenthesesLoadSquare
au Syntax 	* RainbowParenthesesLoadBraces
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

" YankRing {{{
nmap <leader>y :YRShow<cr>
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
nmap <leader>mm  :BookmarkToggle<CR>
nmap <leader>mi  :BookmarkAnnotate<CR>
nmap <leader>mn  :BookmarkNext<CR>
nmap <leader>mp  :BookmarkPrev<CR>
nmap <leader>ma  :BookmarkShowAll<CR>
nmap <leader>mc  :BookmarkClear<CR>
nmap <leader>mx  :BookmarkClearAll<CR>
nmap <leader>mkk :BookmarkMoveUp<CR>
nmap <leader>mjj :BookmarkMoveDown<CR>
" }}}

" incsearch-fuzzy {{{
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
" }}}

" vim-easyalign {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}

map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" set listchars=tab:\|\
" set list
"End of File
