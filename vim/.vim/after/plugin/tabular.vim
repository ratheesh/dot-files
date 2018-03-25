" after/plugin/tabular.vim - Custom patterns for Tabular

if !exists(":Tabularize")
  finish
endif

AddTabularPattern! rocket /=>
AddTabularPattern! colon  /:\zs /l0
AddTabularPattern! comma  /,\zs /l0

AddTabularPipeline! table /\|/
      \ map(a:lines, 'substitute(v:val, ''|\s*-\+\s*\ze|'', ''|'', ''g'')') |
      \ tabular#TabularizeStrings(a:lines, '|', 'l1') |
      \ map(a:lines, 'substitute(v:val, ''|\zs \+\ze|'', ''\=repeat("-", strlen(submatch(0)))'', ''g'')')

" Shortcuts for Tabular plug-in
nnoremap <silent><Leader>a=     :Tabularize /=<CR>
xnoremap <silent><Leader>a=     :Tabularize /=<CR>
nnoremap <silent><Leader>a:     :Tabularize colon<CR>
xnoremap <silent><Leader>a:     :Tabularize colon<CR>
nnoremap <silent><Leader>a,     :Tabularize comma<CR>
xnoremap <silent><Leader>a,     :Tabularize comma<CR>
nnoremap <silent><Leader>a<Bar> :Tabularize table<CR>
xnoremap <silent><Leader>a<Bar> :Tabularize table<CR>
nnoremap <Leader>aa             :Tabularize /
xnoremap <Leader>aa             :Tabularize /
nnoremap <silent><Leader>aw     :Tabularize multiple_spaces<CR>
xnoremap <silent><Leader>aw     :Tabularize multiple_spaces<CR>
nnoremap <silent><Leader>ar     :Tabularize rocket<CR>
xnoremap <silent><Leader>ar     :Tabularize rocket<CR>
nnoremap <silent><Leader>as     :Tabularize assignment<CR>
xnoremap <silent><Leader>as     :Tabularize assignment<CR>
nnoremap <silent><Leader>a\     :Tabularize /\\$<CR>
xnoremap <silent><Leader>a\     :Tabularize /\\$<CR>

" c comment starting delimiter
nnoremap <silent><Leader>ac     :Tabularize /\/\*<CR>
xnoremap <silent><Leader>ac     :Tabularize /\/\*<CR>
" c comment ending delimiter
nnoremap <silent><Leader>acc    :Tabularize /\*\/<CR>
xnoremap <silent><Leader>acc    :Tabularize /\*\/<CR>

" End of File
