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

let s:gui01             = "#303030"
let s:gui02             = "#505050"
let s:gui03             = "#ffb86c"
let s:gui04             = "#bd93f9"
let s:gui05             = "#c71585"
let s:gui06             = "#f08080"
let s:gui07             = "#208860"
let s:gui09             = "#aa9e76"
let s:gui08             = "#999989"
let s:gui10             = "#f4a460"
let s:guiWhite          = "#cccccc"
let s:guiBlack          = "#000000"
let s:guiCFG            = "#a0a0a0"
let s:guiChangedColor   = "#282828"

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
let s:N1 = [ s:guiBlack , s:gui08 , s:ctermWhite , s:cterm07 ]
let s:N2 = [ s:gui10    , s:gui02 , s:cterm11 , s:cterm02 ]
let s:N3 = [ s:guiCFG , s:gui01 , s:cterm09 , s:cterm01 , 'italic']

" Insert mode
let s:I1 = [ s:guiWhite , s:gui07 , s:ctermBlack , s:cterm08 ]
let s:I2 = [ s:gui10    , s:gui02 , s:cterm11 , s:cterm02 ]
let s:I3 = [ s:guiCFG , s:gui01 , s:cterm09 , s:cterm01 ]

" Visual mode
let s:V1 = [ s:guiBlack , s:gui06 , s:ctermBlack , s:cterm06 ]
let s:V2 = [ s:gui10    , s:gui02 , s:cterm11, s:cterm02 ]
let s:V3 = [ s:guiCFG , s:gui01 , s:cterm09, s:cterm01 ]

" Replace mode
let s:R1 = [ s:guiWhite , s:gui05 , s:ctermWhite, s:cterm05 ]
let s:R2 = [ s:gui10    , s:gui02 , s:cterm11, s:cterm02 ]
let s:R3 = [ s:guiCFG , s:gui01 , s:cterm09, s:cterm01 ]

" File changed
let s:changed = [ s:guiCFG , s:guiChangedColor , s:ctermChangedColor , s:cterm01 ]

let g:airline#themes#darkmode#palette = {}
let g:airline#themes#darkmode#palette.normal  = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#darkmode#palette.insert  = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#darkmode#palette.visual  = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#darkmode#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

" Inactive mode
let s:IN1 = [ s:gui04 , s:guiWhite , s:cterm04 , s:ctermWhite ]
let s:IN2 = [ s:gui04 , s:gui01 , s:cterm04  , s:cterm01 ]
let s:IA  = [ s:IN1[1] , s:IN2[1] , s:IN1[3] , s:IN2[3] , '' ]
let g:airline#themes#darkmode#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

" Warning info
let s:WARNING = [ s:guiBlack, s:gui03, s:ctermBlack, s:cterm03 ]
let s:ERROR = [ s:guiWhite, s:gui05, s:ctermWhite, s:cterm05 ]

let g:airline#themes#darkmode#palette.normal.airline_warning  = s:WARNING
let g:airline#themes#darkmode#palette.insert.airline_warning  = s:WARNING
let g:airline#themes#darkmode#palette.visual.airline_warning  = s:WARNING
let g:airline#themes#darkmode#palette.replace.airline_warning = s:WARNING

let g:airline#themes#darkmode#palette.normal.airline_error  = s:ERROR
let g:airline#themes#darkmode#palette.insert.airline_error  = s:ERROR
let g:airline#themes#darkmode#palette.visual.airline_error  = s:ERROR
let g:airline#themes#darkmode#palette.replace.airline_error = s:ERROR

" File modified and not saved
let g:airline#themes#darkmode#palette.normal_modified  = airline#themes#generate_color_map(s:N1, s:N2, s:changed)
let g:airline#themes#darkmode#palette.insert_modified  = airline#themes#generate_color_map(s:I1, s:I2, s:changed)
let g:airline#themes#darkmode#palette.replace_modified = airline#themes#generate_color_map(s:R1, s:R2, s:changed)
let g:airline#themes#darkmode#palette.visual_modified  = airline#themes#generate_color_map(s:V1, s:V2, s:changed)

let g:airline#themes#darkmode#palette.tabline = {
	\ 'airline_tab'     : ['#eeeeee' , '#2e2e2e' , 253 , 60  , 'none'  ],
	\ 'airline_tabsel'  : ['#eeeeee' , '#228b22' , 0   , 66  , 'italic'],
	\ 'airline_tabfill' : ['#eeeeee' , '#2e2e2e' , 188 , 235 , 'none'  ],
	\ 'airline_tabmod'  : ['#000000' , '#cc0070' ,  15 , 89  , 'none'  ],
	\ 'airline_tabhid'  : ['#909090' , '#2e2e2e' , 103 , 235 , 'none'  ],
  \ 'airline_tabtype' : ['#eeeeee' , '#b32425' , 253 , 125 , 'none'  ],
  \ }

" Change colors during different modes
" Adjust colors in darktheme.vim
:augroup modeToggle
:autocmd!
autocmd Insertleave   * hi CursorLineNr ctermfg=0	ctermbg=137 cterm=NONE guifg=#eeeeee	guibg=#a0522d 	gui=NONE
autocmd InsertEnter   * hi CursorLineNr ctermfg=0	ctermbg=66  cterm=NONE guifg=#eeeeee	guibg=#228b22 	gui=NONE

" :autocmd Insertleave   * hi TabLineSel  ctermfg=253  	ctermbg=25 cterm=italic
" :autocmd InsertEnter   * hi TabLineSel  ctermfg=253 	ctermbg=22 cterm=italic
:augroup END

" CtrlP
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif

let s:CP1 = [ s:guiWhite , s:gui01 , s:cterm09 , s:cterm01 ]
let s:CP2 = [ s:guiWhite , s:gui02 , s:cterm11 , s:cterm02 ]

let s:CP3 = [ s:guiBlack , s:gui09 , s:ctermBlack , s:cterm10, 'italic' ]
let g:airline#themes#darkmode#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(s:CP1, s:CP2, s:CP3)

" End of File
