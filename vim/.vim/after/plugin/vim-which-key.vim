" Copyright (C) 2018  Ratheesh <ratheeshreddy@gmail.com>
" Author: Ratheesh S
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

let g:which_key_map =  {}

let g:which_key_map.f = {
            \ 'name' : '+Files',
            \ 'b'    : 'Open Buffers'    ,
            \ 'r'    : 'Open Recent Files',
            \ }

let g:which_key_map.g = {
            \ 'name' : '+GitGutter',
            \ 'u'    : 'Undo Hunk'    ,
            \ 'a'    : 'Stage Hunk',
            \ 'n'    : 'Next Hunk',
            \ 'p'    : 'Previous Hunk',
            \ 'P'    : 'Preview Hunk',
            \ }

let g:which_key_map.a = {
            \ 'name': '+Align',
            \ ',': 'Align by Comma',
            \ ':': 'Align by Colon',
            \ '=': 'Align by Equal',
            \ '|': 'Align Table',
            \ }

let g:which_key_map.1   = 'Select Buffer 1'
let g:which_key_map.2   = 'Select Buffer 2'
let g:which_key_map.3   = 'Select Buffer 3'
let g:which_key_map.4   = 'Select Buffer 4'
let g:which_key_map.5   = 'Select Buffer 5'
let g:which_key_map.6   = 'Select Buffer 6'
let g:which_key_map.7   = 'Select Buffer 7'
let g:which_key_map.8   = 'Select Buffer 8'
let g:which_key_map.9   = 'Select Buffer 9'
let g:which_key_map.h   = 'Select Prev Buffer'
let g:which_key_map.l   = 'Select Next Buffer'
let g:which_key_map.u   = 'Toggle Gundo Layout'
let g:which_key_map.j   = 'Jump to Location'
let g:which_key_map.w   = 'Save Current Buffer'
let g:which_key_map.x   = 'Save All and Exit Vim'
" let g:which_key_map.y   = 'Yank from Remote machine'
" let g:which_key_map.e   = 'Cycle Next Element'
" let g:which_key_map.r   = 'Cycle Prev Element'
" let g:which_key_map.y.m = 'Copy All Matched Lines'
" let g:which_key_map.y.i = 'Copy All non-matched Lines'


call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

" End of File
