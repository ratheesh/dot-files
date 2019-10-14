" Copyright (C) 2017  Ratheesh <ratheeshreddy@gmail.com>
" Author: Ratheesh S
"
" Extension to c filetype plugin
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

setlocal tabstop=8
setlocal shiftwidth=8
setlocal softtabstop=8
" setlocal textwidth=80
setlocal noexpandtab
setlocal cindent
setlocal smarttab
setlocal autoindent
execute "set colorcolumn=" . join(range(81,335), ',')

let c_ansi_typedefs           = 1
let c_ansi_constants          = 1
" let c_comment_strings         = 1
let c_conditional_is_operator = 1
let c_gnu                     = 1
let c_no_curly_error          = 1
let c_space_errors            = 1
let c_syntax_for_h            = 1

" set emacs style of indenting lines
setlocal cinkeys=0{,0},:,0#,!^F,o,O,e

" set customized c-indentation
" Taken from https://github.com/halostatue/vim-config/blob/master/vimfiles/macros/c-style.vim
" with few modifications
setlocal cinoptions  =
" setlocal cinoptions=:0,l1,t0,g0,(0
setlocal cinoptions=
setlocal cinoptions+=>s     " Normal indent by shiftwidth
setlocal cinoptions+=e0     " modify indent ±0 when /{$/
setlocal cinoptions+=n0     " modify indent ±0 for braceless control block
setlocal cinoptions+=f0     " first brace in column 0
setlocal cinoptions+={0     " modify opening brace indent by ±0
setlocal cinoptions+=}0     " modify closing brace indent by ±0
setlocal cinoptions+=^0     " modify indent inside braces by ±0
setlocal cinoptions+=:      " case labels are <sw> from switch()
setlocal cinoptions+==s     " modify case statement indent by ±0
setlocal cinoptions+=ls     " align statements relative to case label
setlocal cinoptions+=b0     " align break with statements, not case label
setlocal cinoptions+=g0     " scope declarations align with braces
setlocal cinoptions+=hs     " statements after scope statements are indented <sw>
setlocal cinoptions+=ps     " K&R parameters are indented <sw>
setlocal cinoptions+=t0     " return type declarations are indented <sw>
setlocal cinoptions+=is     " indent C++ base classes and cinits <sw>
setlocal cinoptions+=+s     " indent continuation lines <sw>
setlocal cinoptions+=c3     " indent comment lines +3 after comment opener.
setlocal cinoptions+=C0     " Comments behave correctly
setlocal cinoptions+=/0     " Indent comments <sw> extra
setlocal cinoptions+=(0     " Indent continuation in unclosed parens 2<sw>
setlocal cinoptions+=u0     " Same as above, one level deeper, add <sw>
setlocal cinoptions+=U0     " Ignore (/u if parens is first non-ws char.
setlocal cinoptions+=w1     " Line up with first unclosed paren.
setlocal cinoptions+=W0     " Unclosed paren change.
setlocal cinoptions+=m0     " Parens line up properly
setlocal cinoptions+=M0     " Parens line up properly
setlocal cinoptions+=j1     " Anonymous classes are indented correctly.
setlocal cinoptions+=)20    " Unclosed parens up to 20 lines away
setlocal cinoptions+=*30    " Unclosed comments up to 30 lines away

" setlocal foldcolumn=1
setlocal foldmethod=syntax

" End of File
