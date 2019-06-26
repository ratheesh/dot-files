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

" Return project root folder name. This is to mimic projectile plugin in emacs
function! utils#getprojectname() abort
    let l:path = s:projroot_guess()
    if !len(l:path)
        let g:gitroot=''
        return g:gitroot
    endif
    let l:path = substitute(l:path, '\n\+$', '', '')
    let l:path = fnamemodify(l:path, ":~")
    let l:directory = split(l:path,'/')
    let g:gitroot=l:directory[-1]
    " let l:gitroot = join(['[',l:gitroot,']'], '')
    " echom g:gitroot
    return g:gitroot
endfunction

function! utils#projectpath() abort
    let l:path = s:projroot_guess()
    if !len(l:path)
        return ''
    else
        return l:path
    endif
endfunction

" This function is adapted from https://github.com/dbakker/vim-projectroot
" projectroot#guess([file]): guesses and returns the project root
function! s:projroot_guess(...) abort
    let projroot = s:projroot_get(a:0?a:1:'')
    " echom 'ProjectRoot: '. projroot
    if len(projroot)
        return projroot
    else
        return ''
    endif
    " Not found: return parent directory of current file / file itself.
    " let fullfile = s:getfullname(a:0 ? a:1 : '')
    " return !isdirectory(fullfile) ? fnamemodify(fullfile, ':h') : fullfile
endfunction

function! s:projroot_get(...) abort
    let l:rootmarkers = ['.git', '.hg', '.svn', '.bzr']
    let fullfile = s:getfullname(a:0 ? a:1 : '')
    if exists('b:projectroot')
        if stridx(fullfile, fnamemodify(b:projectroot, ':p'))==0
            return b:projectroot
        endif
    endif
    if fullfile =~ '^fugitive:/'
        if exists('b:git_dir')
            return fnamemodify(b:git_dir, ':h')
        endif
        return '' " skip any fugitive buffers early
    endif
    for marker in l:rootmarkers
        let pivot=fullfile
        while 1
            let prev=pivot
            let pivot=fnamemodify(pivot, ':h')
            let fn = pivot.(pivot == '/' ? '' : '/').marker
            " echom 'file: '. fn
            if filereadable(fn) || isdirectory(fn)
                return pivot
            endif
            if pivot==prev
                break
            endif
        endwhile
    endfor
    return ''
endfunction

function! s:getfullname(f) abort
    let f = a:f
    let f = f=~"'." ? s:getmarkfile(f[1]) : f
    let f = len(f) ? f : expand('%')
    return fnamemodify(f, ':p')
endfunction

function! s:getmarkfile(mark)
    try
        redir => m
        sil exe ':marks' a:mark
        redir END
        let f = split(split(m,'\n')[-1])[-1]
        return filereadable(f) ? f : ''
    catch
        return ''
    endtry
endfunction

" Return git root folder name. This is to mimic projectile plugin in emacs
function! utils#gitroot() abort
    let g:gitroot = get(g:, 'gitroot', '')
    let l:path = system("git rev-parse --show-toplevel")
    if v:shell_error
        let g:gitroot=''
        return g:gitroot
    endif
    let l:path = substitute(l:path, '\n\+$', '', '')
    let l:path = fnamemodify(l:path, ":~")
    let l:directory = split(l:path,'/')
    let g:gitroot=l:directory[-1]
    " let l:gitroot = join(['[',l:gitroot,']'], '')
    " echom g:gitroot
    return g:gitroot
endfunction

" Condense string to specified character limit - can be used to limit path
" length
function! utils#CondensePath(path, maxlen) abort
    let l:path = a:path
    if strlen(a:path) > a:maxlen
        let l:len = (a:maxlen - 3)
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

" Command to clear contents of all registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" End of File
