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

syn match cOperator     "<<\|>>\|&&\|||\|++\|--\|->"
syn match cOperator     "[.!~*&%<>^|=,+-]"
syn match cOperator     "/[^/*=]"me=e-1
syn match cOperator     "/$"
syn match cOperator     "&&\|||"
syn match cOperator     "[][]"

" data types
syn keyword     c89Type u8 u16 u32 u64 __u8 __u16 __u32 __u64 __le16 __le32 __le64
            \ __be16 __be32 __be64 uint8_t uint16_t uint32_t uint64_t SINT8 UINT8 SINT16
            \ UINT16 SINT32 UINT32 SINT64 UINT64 FLT DBL BOOL bool
syn cluster     cType             contains=c89Type


syn match cUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cType,cDelimiter,cDefine
syn match cUserFunctionPointer "(\s*\*\s*\h\w*\s*)\(\s\|\n\)*(" contains=cDelimiter,cOperator

" default syntax highlighting
hi def link cUserFunction cFunction
hi def link cUserFunctionPointer cFunction

hi link         cOperator Operator
hi link         cDefineMacro cInclude
hi link         c89Type cType

" End of File
