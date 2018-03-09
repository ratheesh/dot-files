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

" gitcommit filetype localization

setlocal expandtab " Expand tabs in git commit mode
execute "set colorcolumn=" . join(range(73,335), ',')
setlocal scrolloff=0
setlocal spell
call setpos('.', [0, 1, 1, 0]) " set cursor position to starting on gitcommit buffers

autocmd BufNewFile,BufRead .stgit* set filetype=gitcommit

" End of File