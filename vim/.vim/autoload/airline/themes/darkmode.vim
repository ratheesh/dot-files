" Darkmode vim-airline theme
"
" Based on Dracula vim-airline theme
"
" Copyright 2017, All rights reserved
"
" Code licensed under the MIT license
" http://zenorocha.mit-license.org
"
" @author Ratheesh <ratheeshreddy@gmail.com>
" @author Extrante <extrante@gmail.com>
" @author Zeno Rocha <hi@zenorocha.com>

" Color palette

let s:gui01             = "#2c2c2c"
let s:gui02             = "#484848"
let s:gui03             = "#f5be85"
let s:gui04             = "#bd93f9"
let s:gui05             = "#fa2c77"
let s:gui06             = "#ebcb85"
let s:gui07             = "#00b56f"
let s:gui08             = "#a0a0a0"
let s:gui09             = "#00796b"
let s:gui10             = "#f4a460"
let s:guinormal         = "#6f42c1"
let s:guiWhite          = "#eeeeee"
let s:guiBlack          = "#000000"
let s:guiCFG            = "#a0a0a0"
let s:guiChangedColor   = "#2c2c2c"

let s:cterm01           = "235"
let s:cterm02           = "238"
let s:cterm03           = "215"
let s:cterm04           = "141"
let s:cterm05           = "162"
let s:cterm06           = "132"
let s:cterm07           = "24"
let s:cterm08           = "65"
let s:cterm09           = "103"
let s:cterm10           = "132"
let s:cterm11           = "180"
let s:cterm12           = "60"
let s:ctermWhite        = "252"
let s:ctermBlack        = "16"
let s:ctermChangedColor = "60"

" Normal mode
let s:N1 = [ s:guiBlack , s:gui08 , s:ctermWhite  , s:cterm07 ]
let s:N2 = [ s:gui10    , s:gui02 , s:cterm11     , s:cterm02 ]
let s:N3 = [ s:guiCFG   , s:gui01 , s:cterm09     , s:cterm01 ]

" Insert mode
let s:I1 = [ s:guiBlack , s:gui07 , s:ctermBlack  , s:cterm08 ]
let s:I2 = [ s:gui10    , s:gui02 , s:cterm11     , s:cterm02 ]
let s:I3 = [ s:guiCFG   , s:gui01 , s:cterm09     , s:cterm01 ]

" Visual mode
let s:V1 = [ s:guiBlack , s:gui06 , s:ctermBlack , s:cterm06 ]
let s:V2 = [ s:gui10    , s:gui02 , s:cterm11    , s:cterm02 ]
let s:V3 = [ s:guiCFG   , s:gui01 , s:cterm09    , s:cterm01 ]

" Replace mode
let s:R1 = [ s:guiWhite , s:gui05 , s:ctermWhite , s:cterm05 ]
let s:R2 = [ s:gui10    , s:gui02 , s:cterm11    , s:cterm02 ]
let s:R3 = [ s:guiCFG   , s:gui01 , s:cterm09    , s:cterm01 ]

" File changed
let s:changed = [ s:guiCFG , s:guiChangedColor , s:ctermChangedColor , s:cterm01 ]

" Active mode
let g:airline#themes#darkmode#palette = {}
let g:airline#themes#darkmode#palette.normal  = {
            \ 'airline_a': [s:guiWhite , s:guinormal , s:ctermBlack , s:cterm08],
            \ 'airline_b': [s:gui10    , s:gui02     , s:ctermBlack , s:cterm08],
            \ 'airline_c': [s:guiCFG   , s:gui01     , s:ctermWhite , s:cterm07 , 'italic'] ,
            \ 'airline_x': [s:guiCFG   , s:gui01     , s:ctermWhite , s:cterm07],
            \ 'airline_y': [s:gui10    , s:gui02     , s:ctermBlack , s:cterm08],
            \ 'airline_z': [s:guiBlack , s:gui08     , s:ctermWhite , s:cterm07], }
let g:airline#themes#darkmode#palette.insert  = {
            \ 'airline_a': [s:guiBlack , s:gui07 , s:ctermBlack , s:cterm08],
            \ 'airline_b': [s:gui10    , s:gui02 , s:ctermBlack , s:cterm08],
            \ 'airline_c': [s:guiCFG   , s:gui01 , s:ctermWhite , s:cterm07, 'italic'],
            \ 'airline_x': [s:guiCFG   , s:gui01 , s:ctermWhite , s:cterm07],
            \ 'airline_y': [s:gui10    , s:gui02 , s:ctermBlack , s:cterm08],
            \ 'airline_z': [s:guiBlack , s:gui08 , s:ctermWhite , s:cterm07], }
let g:airline#themes#darkmode#palette.visual  = {
            \ 'airline_a': [s:guiBlack , s:gui06 , s:ctermBlack , s:cterm08],
            \ 'airline_b': [s:gui10    , s:gui02 , s:ctermBlack , s:cterm08],
            \ 'airline_c': [s:guiCFG   , s:gui01 , s:ctermWhite , s:cterm07, 'italic'],
            \ 'airline_x': [s:guiCFG   , s:gui01 , s:ctermWhite , s:cterm07],
            \ 'airline_y': [s:gui10    , s:gui02 , s:ctermBlack , s:cterm08],
            \ 'airline_z': [s:guiBlack , s:gui08 , s:ctermWhite , s:cterm07], }
let g:airline#themes#darkmode#palette.replace = {
            \ 'airline_a': [s:guiBlack , s:gui05 , s:ctermBlack , s:cterm08],
            \ 'airline_b': [s:gui10    , s:gui02 , s:ctermBlack , s:cterm08],
            \ 'airline_c': [s:guiCFG   , s:gui01 , s:ctermWhite , s:cterm07, 'italic'],
            \ 'airline_x': [s:guiCFG   , s:gui01 , s:ctermWhite , s:cterm07],
            \ 'airline_y': [s:gui10    , s:gui02 , s:ctermBlack , s:cterm08],
            \ 'airline_z': [s:guiBlack , s:gui08 , s:ctermWhite , s:cterm07], }

" Inactive mode
let s:IN1 = [ s:gui04  , s:guiWhite , s:cterm04 , s:ctermWhite ]
let s:IN2 = [ s:gui04  , s:gui01    , s:cterm04 , s:cterm01 ]
let s:IA  = [ s:IN1[1] , s:IN2[1]   , s:IN1[3]  , s:IN2[3]       , '' ]
let g:airline#themes#darkmode#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

" Warning info
let s:WARNING = [ s:guiBlack, s:gui03, s:ctermBlack, s:cterm03 ]
let s:ERROR   = [ s:guiBlack, s:gui05, s:ctermWhite, s:cterm05 ]

let g:airline#themes#darkmode#palette.normal.airline_warning  = s:WARNING
let g:airline#themes#darkmode#palette.insert.airline_warning  = s:WARNING
let g:airline#themes#darkmode#palette.visual.airline_warning  = s:WARNING
let g:airline#themes#darkmode#palette.replace.airline_warning = s:WARNING

" Error info
let g:airline#themes#darkmode#palette.normal.airline_error  = s:ERROR
let g:airline#themes#darkmode#palette.insert.airline_error  = s:ERROR
let g:airline#themes#darkmode#palette.visual.airline_error  = s:ERROR
let g:airline#themes#darkmode#palette.replace.airline_error = s:ERROR

" File modified and not saved
let g:airline#themes#darkmode#palette.normal_modified  = {
            \ 'airline_a': [s:guiWhite , s:guinormal , s:ctermBlack , s:cterm08],
            \ 'airline_b': [s:gui10    , s:gui02     , s:ctermBlack , s:cterm08],
            \ 'airline_c': [s:guiCFG   , s:gui01     , s:ctermWhite , s:cterm07, 'italic'],
            \ 'airline_x': [s:guiCFG   , s:gui01     , s:ctermWhite , s:cterm07],
            \ 'airline_y': [s:gui10    , s:gui02     , s:ctermBlack , s:cterm08],
            \ 'airline_z': [s:guiBlack , s:gui08     , s:ctermWhite , s:cterm07], }
let g:airline#themes#darkmode#palette.insert_modified  = {
            \ 'airline_a': [s:guiBlack , s:gui07 , s:ctermBlack , s:cterm08],
            \ 'airline_b': [s:gui10    , s:gui02 , s:ctermBlack , s:cterm08],
            \ 'airline_c': [s:guiCFG   , s:gui01 , s:ctermWhite , s:cterm07, 'italic'],
            \ 'airline_x': [s:guiCFG   , s:gui01 , s:ctermWhite , s:cterm07],
            \ 'airline_y': [s:gui10    , s:gui02 , s:ctermBlack , s:cterm08],
            \ 'airline_z': [s:guiBlack , s:gui08 , s:ctermWhite , s:cterm07], }
let g:airline#themes#darkmode#palette.visual_modified  = {
            \ 'airline_a': [s:guiBlack , s:gui06 , s:ctermBlack , s:cterm08],
            \ 'airline_b': [s:gui10    , s:gui02 , s:ctermBlack , s:cterm08],
            \ 'airline_c': [s:guiCFG   , s:gui01 , s:ctermWhite , s:cterm07, 'italic'],
            \ 'airline_x': [s:guiCFG   , s:gui01 , s:ctermWhite , s:cterm07],
            \ 'airline_y': [s:gui10    , s:gui02 , s:ctermBlack , s:cterm08],
            \ 'airline_z': [s:guiBlack , s:gui08 , s:ctermWhite , s:cterm07], }
let g:airline#themes#darkmode#palette.replace_modified = {
            \ 'airline_a': [s:guiBlack , s:gui05 , s:ctermBlack , s:cterm08],
            \ 'airline_b': [s:gui10    , s:gui02 , s:ctermBlack , s:cterm08],
            \ 'airline_c': [s:guiCFG   , s:gui01 , s:ctermWhite , s:cterm07, 'italic'],
            \ 'airline_x': [s:guiCFG   , s:gui01 , s:ctermWhite , s:cterm07],
            \ 'airline_y': [s:gui10    , s:gui02 , s:ctermBlack , s:cterm08],
            \ 'airline_z': [s:guiBlack , s:gui08 , s:ctermWhite , s:cterm07], }

let g:airline#themes#darkmode#palette.normal_modified.airline_warning  = s:WARNING
let g:airline#themes#darkmode#palette.insert_modified.airline_warning  = s:WARNING
let g:airline#themes#darkmode#palette.visual_modified.airline_warning  = s:WARNING
let g:airline#themes#darkmode#palette.replace_modified.airline_warning = s:WARNING

let g:airline#themes#darkmode#palette.normal_modified.airline_error  = s:ERROR
let g:airline#themes#darkmode#palette.insert_modified.airline_error  = s:ERROR
let g:airline#themes#darkmode#palette.visual_modified.airline_error  = s:ERROR
let g:airline#themes#darkmode#palette.replace_modified.airline_error = s:ERROR

let g:airline#themes#darkmode#palette.tabline = {
            \ 'airline_tab'     : [s:guiBlack, '#909090' , 253 , 60  , 'none'  ],
            \ 'airline_tabsel'  : [s:guiWhite, '#0177b5' , 0   , 66  , 'italic'],
            \ 'airline_tabfill' : [s:guiWhite, '#203438' , 188 , 235 , 'none'  ],
            \ 'airline_tabmod'  : [s:guiWhite, '#2d8d77' ,  15 , 89  , 'none'  ],
            \ 'airline_tabhid'  : ['#a0a0a0' , '#203438' , 103 , 235 , 'none'  ],
            \ 'airline_tabtype' : [s:guiWhite, '#b32425' , 253 , 125 , 'none'  ],
            \ }

" Change colors during different modes
:augroup modeToggle
" Adjust colors CursorLineNr in darktheme.vim accordingly
:autocmd!
autocmd Insertleave   * hi CursorLineNr ctermfg=0   ctermbg=137 cterm=NONE guifg=#eeeeee    guibg=#a3495b   gui=NONE
autocmd InsertEnter   * hi CursorLineNr ctermfg=0   ctermbg=66  cterm=NONE guifg=#eeeeee    guibg=#00796b   gui=NONE
:augroup END

" CtrlP customization
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif

let s:CP1 = [ s:guiWhite , s:gui01 , s:cterm09    , s:cterm01 ]
let s:CP2 = [ s:guiWhite , s:gui02 , s:cterm11    , s:cterm02 ]
let s:CP3 = [ s:guiWhite , s:gui09 , s:ctermBlack , s:cterm10   , 'italic' ]
let g:airline#themes#darkmode#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(s:CP1, s:CP2, s:CP3)

" End of File
