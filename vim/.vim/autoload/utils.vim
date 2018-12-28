" Copyright (c) 2018 Ratheesh <ratheeshreddy@gmail.com>
" Author: Ratheesh S
"
" Local functions that are not big enough to be a separate plugin
"
" Permission is hereby granted, free of charge, to any person obtaining a copy of
" this software and associated documentation files (the "Software"), to deal in
" the Software without restriction, including without limitation the rights to
" use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
" the Software, and to permit persons to whom the Software is furnished to do so,
" subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
" FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
" COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
" IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
" CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

" Return git root folder name. This is to mimic projectile plugin in emacs
function! utils#gitroot()
    let g:gitroot = get(g:, 'gitroot', '')
    let l:path = system("git rev-parse --show-toplevel")
    if v:shell_error
        let g:gitroot=''
        return ''
    endif
    let l:path = substitute(l:path, '\n\+$', '', '')
    let l:directory = split(l:path,'/')
    let g:gitroot=l:directory[-1]
    " let l:gitroot = join(['[',l:gitroot,']'], '')
    " echom g:gitroot
    return g:gitroot
endfunction

" Condense string to specified character limit - can be used to limit path
" length
function! utils#CondensePath(path, maxlen)
    let l:path = a:path
    let l:len = (a:maxlen - 3)
    if strlen(a:path) > l:len
        let l:path = join(['...', l:path[strlen(a:path)-l:len:]], '')
    endif
    " echom 'condensed path: ' . l:path
    return l:path
endfunction

" test function - used for testing vimscript functionality
function! utils#testfunc()
    let l:str=''
    let l:val = empty(l:str)? "empty" : "not empty"
    echom l:val
endfunction
" End of File
