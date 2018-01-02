" Copyright (C) 2017  Ratheesh <ratheeshreddy@gmail.com>
" Author: Ratheesh S
"
" C filetype extensions
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

syn match cDefineMacro  display '#define\s'

" C math operators
" syn match       cMathOperator     display "[-+\*/%=]"
" C pointer operators - address of and dereference are context sensitive
syn match       cPointerOperator  display "->\|\."

" C logical   operators - boolean results
syn match       cLogicalOperator  display "[!<>]=\="
syn match       cLogicalOperator  display "=="

" C bit operators
syn match       cBinaryOperator   display "\(&\||\|\^\|<<\|>>\)=\="
syn match       cBinaryOperator   display "\~"
syn match       cBinaryOperatorError display "\~="

" More C logical operators - highlight in preference to binary
syn match       cLogicalOperator  display "&&\|||"
syn match       cLogicalOperatorError display "\(&&\|||\)="

syn cluster     cOperator         add=cPointerOperator,cLogicalOperator,cBinaryOperator,cLogicalOperatorError,cBinaryOperatorError

" data types
syn keyword     c89Type           u8 u16 u32 uint8_t uint16_t uint32_t SINT8 UINT8 SINT16 UINT16 SINT32 UINT32 FLT DBL BOOL bool
syn cluster     cType             contains=c89Type

" default syntax highlighting
hi link         cDefineMacro cInclude
hi link         c89Type cType

" End of File
