" Dark Theme v0.1
"
" Based on https://github.com/zenorocha/dracula-theme
"
" Copyright 2017, All rights reserved
"
" Code licensed under the MIT license
" http://zenorocha.mit-license.org
"
" @author Ratheesh <ratheeshreddy@gmail.com> <@ratheeshreddy>
" @author Trevor Heins <@heinst>
" @author Éverton Ribeiro <nuxlli@gmail.com>
" @author Zeno Rocha <hi@zenorocha.com>

set background=dark
scriptencoding utf-8
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "darktheme"

" syn match Braces display '[{}()\[\]]'
" syntax match Operator "[-+&|<>=!\/~:*%&^?]"

hi Normal       ctermfg=7       ctermbg=233     cterm=NONE							guifg=#cccccc 	guibg=#1a1a1a 	gui=NONE
hi ColorColumn  ctermfg=NONE    ctermbg=232     cterm=NONE							guifg=NONE 	    guibg=#303030 	gui=NONE
hi SignColumn   ctermfg=246     ctermbg=233     cterm=bold							guifg=#909194 	guibg=#1a1c1e 	gui=NONE
hi Cursor       ctermfg=NONE    ctermbg=NONE    cterm=inverse,bold			guifg=NONE 	    guibg=NONE      gui=inverse,bold
hi Visual       ctermfg=NONE    ctermbg=237     cterm=NONE							guifg=NONE      guibg=#44475a 	gui=NONE
hi CursorLine   ctermbg=234                     cterm=NONE							guifg=NONE      guibg=#24272a 	gui=NONE
hi CursorColumn ctermbg=234                     cterm=NONE							guifg=NONE      guibg=#44475a 	gui=NONE
hi LineNr       ctermfg=60      ctermbg=235     cterm=NONE							guifg=#747474 	guibg=#282a36 	gui=NONE
hi CursorLineNr ctermfg=0       ctermbg=137     cterm=NONE							guifg=#eeeeee 	guibg=#a0522d 	gui=NONE
hi VertSplit    ctermfg=60      ctermbg=NONE    cterm=NONE							guifg=#64666d 	guibg=#64666d 	gui=bold
hi MatchParen   ctermfg=126     ctermbg=NONE    cterm=underline,bold		guifg=#cc0000 	guibg=NONE 		  gui=underline
hi ParenError   ctermfg=196     ctermbg=NONE    cterm=underline,bold
hi Braces       ctermfg=NONE    ctermbg=NONE    cterm=bold,underline
hi StatusLine   ctermfg=7       ctermbg=236     cterm=bold							guifg=#f8f8f2 	guibg=#64666d 	gui=bold
hi StatusLineNC ctermfg=7       ctermbg=236     cterm=NONE							guifg=#f8f8f2 	guibg=#64666d 	gui=NONE
hi IncSearch    ctermfg=NONE    ctermbg=238     cterm=NONE							guifg=NONE      guibg=#44454a 	gui=NONE
hi Search       ctermfg=7       ctermbg=238     cterm=NONE							guifg=NONE      guibg=#44454a 	gui=NONE
hi ExtSearch    ctermfg=9       ctermbg=NONE    cterm=italic,underline	guifg=#f92a5b   guibg=NONE      gui=italic,underline
hi Directory    ctermfg=141     ctermbg=NONE    cterm=NONE							guifg=#bd93f9 	guibg=NONE      gui=NONE
hi Folded       ctermfg=61      ctermbg=235     cterm=NONE							guifg=#6272a4 	guibg=#282a36 	gui=NONE
hi FoldColmun   ctermfg=246     ctermbg=235     cterm=NONE							guifg=#909194 	guibg=#44475a 	gui=NONE
hi Boolean      ctermfg=129     ctermbg=NONE    cterm=NONE							guifg=#bd93f9 	guibg=NONE      gui=NONE
hi Character    ctermfg=64      ctermbg=NONE    cterm=NONE							guifg=#bd93f9 	guibg=NONE      gui=NONE
hi Comment      ctermfg=242     ctermbg=NONE    cterm=italic						guifg=#808080 	guibg=NONE      gui=italic
hi Conditional  ctermfg=25      ctermbg=NONE    cterm=italic						guifg=#6494ed 	guibg=NONE      gui=NONE
hi Constant     ctermfg=NONE    ctermbg=NONE    cterm=NONE							guifg=#5f9ea0		guibg=NONE      gui=NONE
hi Define       ctermfg=66      ctermbg=NONE    cterm=NONE							guifg=#ff79c6 	guibg=NONE      gui=NONE
hi ErrorMsg     ctermfg=7       ctermbg=212     cterm=NONE							guifg=#cc0000 	guibg=#303030 	gui=NONE
hi WarningMsg   ctermfg=162     ctermbg=212     cterm=NONE							guifg=#cccc00 	guibg=#303030 	gui=NONE
hi Float        ctermfg=141     ctermbg=NONE    cterm=NONE							guifg=#bd93f9 	guibg=NONE      gui=NONE
hi Function     ctermfg=61      ctermbg=NONE    cterm=NONE							guifg=#50fa7b 	guibg=NONE      gui=NONE
hi Identifier   ctermfg=246     ctermbg=NONE    cterm=NONE							guifg=#8be9fd 	guibg=NONE      gui=italic
hi Keyword      ctermfg=126     ctermbg=NONE    cterm=italic						guifg=#6272a4 	guibg=NONE      gui=NONE
hi Label        ctermfg=132     ctermbg=NONE    cterm=NONE							guifg=#8f575a 	guibg=NONE      gui=NONE
hi NonText      ctermfg=244     ctermbg=NONE    cterm=NONE							guifg=#525563 	guibg=NONE      gui=NONE
hi Number       ctermfg=180     ctermbg=NONE    cterm=NONE							guifg=#eb4a9c 	guibg=NONE      gui=NONE
hi Operator     ctermfg=62      ctermbg=NONE    cterm=bold							guifg=#909194 	guibg=NONE      gui=bold
hi PreProc      ctermfg=31      ctermbg=NONE    cterm=NONE							guifg=#808080 	guibg=NONE      gui=NONE
hi Special      ctermfg=65      ctermbg=NONE    cterm=NONE							guifg=#f08080 	guibg=NONE      gui=NONE
" hi SpecialKey         ctermfg=238     ctermbg=NONE    cterm=NONE 	guifg=#	 525563 	guibg=NONE 	gui=NONE
" hi Conceal    ctermfg=238     ctermbg=NONE    cterm=NONE
hi Statement    ctermfg=66      ctermbg=NONE    cterm=NONE							guifg=#4682B4 	guibg=NONE      gui=NONE
hi StorageClass ctermfg=54      ctermbg=NONE    cterm=NONE							guifg=#ad95d6 	guibg=NONE      gui=italic
hi String       ctermfg=60      ctermbg=NONE    cterm=italic						guifg=#808080 	guibg=NONE      gui=italic
hi Tag          ctermfg=212     ctermbg=NONE    cterm=NONE							guifg=#ff79c6 	guibg=NONE      gui=NONE
hi Todo         ctermfg=61      ctermbg=NONE    cterm=inverse,bold			guifg=#6272a4 	guibg=NONE      gui=inverse,bold
hi Title        ctermfg=7       ctermbg=NONE    cterm=bold							guifg=#f8f8f2 	guibg=NONE      gui=bold
" hi level11      ctermfg=60      ctermbg=NONE    cterm=NONE
" hi level12      ctermfg=5       ctermbg=NONE    cterm=NONE
" hi level13      ctermfg=25      ctermbg=NONE    cterm=NONE
" hi level14      ctermfg=125     ctermbg=NONE    cterm=NONE
" hi level15      ctermfg=25      ctermbg=NONE    cterm=NONE
" hi level16      ctermfg=7       ctermbg=NONE    cterm=NONE
hi Type         ctermfg=126     ctermbg=NONE    cterm=italic            guifg=#6494ed 	guibg=NONE      gui=italic
hi Underlined   ctermfg=NONE    ctermbg=NONE    cterm=underline         guifg=NONE	    guibg=NONE      gui=underline

" spelling {{{
hi SpellBad             ctermfg=NONE       ctermbg=NONE    cterm=underline guifg=NONE   guibg=NONE   gui=underline
hi SpellCap             ctermfg=NONE       ctermbg=NONE    cterm=underline guifg=NONE   guibg=NONE   gui=underline
" }}}

" C/C++ {{{
hi cCommentStart        ctermfg=243     ctermbg=NONE    cterm=bold      guifg=#6272a4 	guibg=NONE      gui=italic
hi c89Function          ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#6494ed 	guibg=NONE      gui=NONE
hi cConditional         ctermfg=172     ctermbg=NONE    cterm=italic    guifg=#1d8d77 	guibg=NONE      gui=italic
hi cRepeat              ctermfg=95      ctermbg=NONE    cterm=italic    guifg=#1d8d77	  guibg=NONE      gui=italic
hi cPPIncludeFile       ctermfg=60      ctermbg=NONE    cterm=italic    guifg=#f1fa8c 	guibg=NONE      gui=NONE
hi cOperator            ctermfg=62      ctermbg=NONE    cterm=NONE      guifg=#3e8c75 	guibg=NONE      gui=NONE
hi cInclude             ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#5f9ea0 	guibg=NONE      gui=NONE
hi cDefine              ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#5f9ea0 	guibg=NONE      gui=NONE
hi cNumber              ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#f4c670 	guibg=NONE      gui=NONE
hi cCommentError        ctermfg=240     ctermbg=NONE    cterm=italic    guifg=#cc0000 	guibg=NONE      gui=NONE
hi cGNUConstant         ctermfg=7       ctermbg=NONE    cterm=NONE      guifg=#bc8f8f 	guibg=NONE      gui=NONE
hi cCharacter           ctermfg=7       ctermbg=NONE    cterm=NONE      guifg=#bc8f8f 	guibg=NONE      gui=NONE
hi cBinaryOperator      ctermfg=12      ctermbg=NONE    cterm=NONE      guifg=#f1fa8c 	guibg=NONE      gui=NONE
hi cMathOperator        ctermfg=132     ctermbg=NONE    cterm=NONE      guifg=#f1fa8c 	guibg=NONE      gui=NONE
hi cLogicalOperator     ctermfg=93      ctermbg=NONE    cterm=NONE      guifg=#aa5500 	guibg=NONE      gui=NONE
hi cPointerOperator     ctermfg=60      ctermbg=NONE    cterm=bold      guifg=#aa5500 	guibg=NONE      gui=NONE
hi cStorageClass        ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#00786c 	guibg=NONE      gui=NONE
hi cStructure           ctermfg=132     ctermbg=NONE    cterm=italic    guifg=#d56476 	guibg=NONE      gui=NONE
hi cType                ctermfg=25      ctermbg=NONE    cterm=italic    guifg=#3285c7 	guibg=NONE      gui=NONE
hi cConstant            ctermfg=96      ctermbg=NONE    cterm=NONE      guifg=#9c547e 	guibg=NONE      gui=NONE
hi cStatement           ctermfg=25      ctermbg=NONE    cterm=NONE      guifg=#6089b7 	guibg=NONE      gui=NONE
hi cFloat               ctermfg=180     ctermbg=NONE    cterm=NONE      guifg=#f1fa8c 	guibg=NONE      gui=NONE
hi cOctalZero           ctermfg=180     ctermbg=NONE    cterm=NONE      guifg=#f1fa8c 	guibg=NONE      gui=NONE
hi c89Macro             ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#f1fa8c 	guibg=NONE      gui=NONE
hi cBlock               ctermfg=172     ctermbg=NONE    cterm=italic    guifg=#bc8f8f 	guibg=NONE      gui=NONE
hi cString              ctermfg=172     ctermbg=NONE    cterm=italic    guifg=#808080 	guibg=NONE      gui=italic
hi cCppOutIf            ctermfg=172     ctermbg=NONE    cterm=italic    guifg=#bc8f8f 	guibg=NONE      gui=NONE
hi cCppOutIf2           ctermfg=172     ctermbg=NONE    cterm=italic    guifg=#bc8f8f 	guibg=NONE      gui=NONE
hi cCppOutIf            ctermfg=172     ctermbg=NONE    cterm=italic    guifg=#bc8f8f 	guibg=#808080   gui=NONE
" }}}

" doxygen {{{
hi doxygenBrief                 ctermfg=132     ctermbg=NONE    cterm=italic    guifg=#808080 	guibg=NONE      gui=italic
hi doxygenBody                  ctermfg=132     ctermbg=NONE    cterm=italic    guifg=#808080 	guibg=NONE      gui=italic
hi doxygenBOther                ctermfg=181     ctermbg=NONE    cterm=italic    guifg=#808080 	guibg=NONE      gui=italic
hi doxygenParam                 ctermfg=181     ctermbg=NONE    cterm=italic    guifg=#aa5500 	guibg=NONE      gui=italic
" hi doxygenStartSpecial        ctermfg=65      ctermbg=NONE    cterm=italic    guifg=#808080 	guibg=NONE      gui=italic
hi doxygenParamName             ctermfg=65      ctermbg=NONE    cterm=italic    guifg=#3e8c75 	guibg=NONE      gui=italic
hi doxygenSpecialMultilineDesc  ctermfg=6       ctermbg=NONE    cterm=italic    guifg=#808080 	guibg=NONE      gui=italic
hi doxygenComment               ctermfg=6       ctermbg=NONE    cterm=italic    guifg=#6272a4 	guibg=NONE      gui=italic
" }}}

" dts-mode {{{
hi dtsCellProperty      ctermfg=66      ctermbg=NONE    cterm=NONE
" }}}

" gitconfig {{{
hi gitconfigVariable    ctermfg=62      ctermbg=NONE    cterm=NONE    guifg=#a0a0a0  guibg=NONE   gui=NONE
hi gitconfigAssignment  ctermfg=7       ctermbg=NONE    cterm=NONE    guifg=#7a8a8a  guibg=NONE   gui=NONE
hi gitconfigBoolean     ctermfg=60      ctermbg=NONE    cterm=italic  guifg=#008b8b  guibg=NONE   gui=NONE
hi gitconfigSection     ctermfg=60      ctermbg=NONE    cterm=italic  guifg=#4682b4  guibg=NONE   gui=NONE

" }}}

" git-gutter {{{
hi GitGutterAdd         ctermfg=26      ctermbg=233     cterm=bold  guifg=#27b062  guibg=#1a1c1e   gui=NONE
hi GitGutterChange      ctermfg=180     ctermbg=233     cterm=bold  guifg=#f7ca88  guibg=#1a1c1e   gui=NONE
hi GitGutterDelete      ctermfg=196     ctermbg=233     cterm=bold  guifg=#fb091f  guibg=#1a1c1e   gui=NONE
hi GitGutterChangeDelete ctermfg=94     ctermbg=233     cterm=bold  guifg=#ff5500  guibg=#1a1c1e   gui=NONE
" }}}

" CtrlP {{{
hi CtrlPMatch           ctermfg=6       ctermbg=NONE    cterm=bold  guifg=#ffcc33  guibg=NONE   gui=bold
hi CtrlPPrtText         ctermfg=60      ctermbg=NONE    cterm=NONE  guifg=#1d8d77  guibg=NONE   gui=NONE
hi CtrlPLinePre         ctermfg=172     ctermbg=NONE    cterm=NONE  guifg=#27b062  guibg=NONE   gui=NONE
hi CtrlPPrtBase         ctermfg=172     ctermbg=NONE    cterm=bold  guifg=#a42171  guibg=NONE   gui=bold
hi CtrlPPrtCursor       ctermfg=172     ctermbg=NONE    cterm=bold  guifg=#303030  guibg=NONE   gui=bold

hi CtrlPBufferInd       ctermfg=162     ctermbg=NONE    cterm=NONE    guifg=#c76d83  guibg=NONE   gui=NONE
hi CtrlPBufferNr        ctermfg=65      ctermbg=NONE    cterm=NONE    guifg=#ac6600  guibg=NONE   gui=NONE
hi CtrlPBufferVis       ctermfg=7       ctermbg=NONE    cterm=NONE    guifg=#cccccc  guibg=NONE   gui=NONE
hi CtrlPBufferCur       ctermfg=7       ctermbg=NONE    cterm=NONE    guifg=#008b8b  guibg=NONE   gui=NONE
hi CtrlPBufferHid       ctermfg=7       ctermbg=NONE    cterm=NONE    guifg=#6272a4  guibg=NONE   gui=NONE
hi CtrlPBufferPath      ctermfg=7       ctermbg=NONE    cterm=italic  guifg=#909090  guibg=NONE   gui=italic
" }}}

" Menu selection {{{
hi Pmenu                ctermfg=7       ctermbg=237     cterm=NONE guifg=NONE     guibg=#404040 gui=NONE
hi PmenuSel             ctermfg=0       ctermbg=137     cterm=NONE guifg=#eeeeee  guibg=#42587f gui=NONE
hi PmenuSbar            ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=#000000  guibg=#606060 gui=NONE
hi PmenuThumb           ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=#000000  guibg=#ae6171 gui=NONE
"}}}

" GitCommit {{{
hi gitcommitcomment             ctermfg=240     ctermbg=none    cterm=none     guifg=#505050 guibg=NONE    gui=NONE
hi gitcommitoverflow            ctermfg=162     ctermbg=237     cterm=italic   guifg=#db080b guibg=#404040 gui=italic
hi gitcommitsummary             ctermfg=7       ctermbg=none    cterm=none     guifg=#eeeeee guibg=NONE    gui=NONE
hi gitcommitbranch              ctermfg=180     ctermbg=none    cterm=none     guifg=#f7cab8 guibg=NONE    gui=NONE
hi gitcommitblank               ctermfg=9       ctermbg=237     cterm=italic   guifg=#db080b guibg=#404040 gui=italic
hi gitcommitheader              ctermfg=246     ctermbg=none    cterm=none     guifg=#808080 guibg=NONE    gui=NONE
hi gitcommitdiff                ctermfg=245     ctermbg=none    cterm=none     guifg=#c0c0c0 guibg=NONE    gui=NONE
hi gitcommitselectedfile        ctermfg=66      ctermbg=none    cterm=none     guifg=#3e8c75 guibg=NONE    gui=NONE
hi gitcommitselectedtype        ctermfg=25      ctermbg=none    cterm=italic   guifg=#689d61 guibg=NONE    gui=italic
hi gitcommitdiscardedfile       ctermfg=60      ctermbg=none    cterm=none     guifg=#8f575a guibg=NONE    gui=NONE
hi gitcommitdiscardedtype       ctermfg=95      ctermbg=none    cterm=italic   guifg=#7a8a80 guibg=NONE    gui=italic
hi gitcommitPatchLabel          ctermfg=132     ctermbg=NONE    cterm=italic   guifg=#bdb76b guibg=NONE    gui=italic
hi gitcommitEmailAddr           ctermfg=65      ctermbg=NONE    cterm=italic   guifg=#5f9ea0 guibg=NONE    gui=italic
hi gitcommitSignedAuthor        ctermfg=25      ctermbg=NONE    cterm=NONE     guifg=#367bf0 guibg=NONE    gui=NONE
hi gitcommitAuthor              ctermfg=24      ctermbg=NONE    cterm=NONE     guifg=#7a8a80 guibg=NONE    gui=NONE
" }}}

" Diff {{{
hi diffAdded            ctermfg=28      ctermbg=NONE    cterm=NONE      guifg=#32cd32 guibg=NONE  gui=bold
hi diffRemoved          ctermfg=161     ctermbg=NONE    cterm=NONE      guifg=#cc241d guibg=NONE  gui=NONE
hi diffChanged          ctermfg=65      ctermbg=NONE    cterm=NONE      guifg=#cccccc guibg=NONE  gui=NONE
hi diffText             ctermfg=7       ctermbg=NONE    cterm=NONE      guifg=#cccccc guibg=NONE  gui=bold
hi diffNewFile          ctermfg=95      ctermbg=NONE    cterm=italic    guifg=#fb4934 guibg=NONE  gui=bold
hi diffFile             ctermfg=95      ctermbg=NONE    cterm=italic    guifg=#3cbc71 guibg=NONE  gui=bold
hi diffLine             ctermfg=142     ctermbg=NONE    cterm=italic    guifg=#f4a460 guibg=NONE  gui=NONE
hi diffIndexLine        ctermfg=127     ctermbg=NONE    cterm=italic    guifg=#cd5c5c guibg=NONE  gui=NONE
hi diffSubname          ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#a0a0a0 guibg=NONE  gui=bold
"}}}

" Startify {{{
hi StartifyNumber       ctermfg=60      ctermbg=NONE    cterm=NONE      guifg=#606060 guibg=NONE    gui=NONE
hi StartifySelect       ctermfg=NONE    ctermbg=235     cterm=NONE      guifg=NONE    guibg=#303030 gui=NONE
hi StartifyBracket      ctermfg=25      ctermbg=NONE    cterm=NONE      guifg=#367bf0 guibg=NONE    gui=NONE
hi StartifySpecial      ctermfg=132     ctermbg=NONE    cterm=NONE      guifg=#cd5c5c guibg=NONE    gui=NONE
hi StartifyPath         ctermfg=96      ctermbg=NONE    cterm=NONE      guifg=#64648a guibg=NONE    gui=NONE
hi StartifyFile         ctermfg=60      ctermbg=NONE    cterm=italic    guifg=#1d8d77 guibg=NONE    gui=NONE
hi StartifySlash        ctermfg=103     ctermbg=NONE    cterm=bold      guifg=#897588 guibg=NONE    gui=NONE
hi StartifyHeader       ctermfg=60      ctermbg=NONE    cterm=NONE      guifg=#268bd2 guibg=NONE    gui=NONE
hi StartifySection      ctermfg=142     ctermbg=NONE    cterm=NONE      guifg=#bb3e79  guibg=NONE    gui=NONE
hi StartifyFooter       ctermfg=6       ctermbg=NONE    cterm=NONE      guifg=#a0a0a0 guibg=NONE    gui=NONE
" }}}

" Ruby {{{
hi rubyClass                    ctermfg=212     ctermbg=NONE    cterm=NONE guifg=#ff79c6 	guibg=NONE gui=NONE
hi rubyFunction                 ctermfg=84      ctermbg=NONE    cterm=NONE guifg=#50fa7b 	guibg=NONE gui=NONE
hi rubyInterpolationDelimiter   ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=NONE 		guibg=NONE gui=NONE
hi rubySymbol                   ctermfg=141     ctermbg=NONE    cterm=NONE guifg=#bd93f9 	guibg=NONE gui=NONE
hi rubyConstant                 ctermfg=81      ctermbg=NONE    cterm=NONE guifg=#66d9ef 	guibg=NONE gui=italic
hi rubyStringDelimiter          ctermfg=228     ctermbg=NONE    cterm=NONE guifg=#f1fa8c 	guibg=NONE gui=NONE
hi rubyBlockParameter           ctermfg=215     ctermbg=NONE    cterm=NONE guifg=#ffb86c 	guibg=NONE gui=italic
hi rubyInstanceVariable         ctermfg=203     ctermbg=NONE    cterm=NONE guifg=#ffb86c 	guibg=NONE gui=NONE
hi rubyInclude                  ctermfg=212     ctermbg=NONE    cterm=NONE guifg=#ff79c6 	guibg=NONE gui=NONE
hi rubyGlobalVariable           ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=NONE 		guibg=NONE gui=NONE
hi rubyRegexp                   ctermfg=228     ctermbg=NONE    cterm=NONE guifg=#f1fa8c 	guibg=NONE gui=NONE
hi rubyRegexpDelimiter          ctermfg=228     ctermbg=NONE    cterm=NONE guifg=#f1fa8c 	guibg=NONE gui=NONE
hi rubyEscape                   ctermfg=141     ctermbg=NONE    cterm=NONE guifg=#bd93f9 	guibg=NONE gui=NONE
hi rubyControl                  ctermfg=212     ctermbg=NONE    cterm=NONE guifg=#ff79c6 	guibg=NONE gui=NONE
hi rubyClassVariable            ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=NONE 		guibg=NONE gui=NONE
hi rubyOperator                 ctermfg=212     ctermbg=NONE    cterm=NONE guifg=#ff79c6 	guibg=NONE gui=NONE
hi rubyException                ctermfg=212     ctermbg=NONE    cterm=NONE guifg=#ff79c6 	guibg=NONE gui=NONE
hi rubyPseudoVariable           ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=NONE 		guibg=NONE gui=NONE
hi rubyRailsUserClass           ctermfg=81      ctermbg=NONE    cterm=NONE guifg=#66d9ef 	guibg=NONE gui=italic
hi rubyRailsARAssociationMethod ctermfg=117     ctermbg=NONE    cterm=NONE guifg=#8be9fd 	guibg=NONE gui=NONE
hi rubyRailsARMethod            ctermfg=117     ctermbg=NONE    cterm=NONE guifg=#8be9fd 	guibg=NONE gui=NONE
hi rubyRailsRenderMethod        ctermfg=117     ctermbg=NONE    cterm=NONE guifg=#8be9fd 	guibg=NONE gui=NONE
hi rubyRailsMethod              ctermfg=117     ctermbg=NONE    cterm=NONE guifg=#8be9fd 	guibg=NONE gui=NONE
"}}}

" eRuby {{{
hi erubyDelimiter       ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=NONE 		guibg=NONE gui=NONE
hi erubyComment         ctermfg=61      ctermbg=NONE    cterm=NONE guifg=#6272a4	guibg=NONE gui=NONE
hi erubyRailsMethod     ctermfg=117     ctermbg=NONE    cterm=NONE guifg=#8be9fd 	guibg=NONE gui=NONE
"}}}

" HTML {{{
hi htmlTag              ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=NONE 		guibg=NONE gui=NONE
hi htmlEndTag           ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=NONE 		guibg=NONE gui=NONE
hi htmlTagName          ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=#ff79c6 	guibg=NONE gui=NONE
hi htmlArg              ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=#50fa7b 	guibg=NONE gui=NONE
hi htmlSpecialChar      ctermfg=141     ctermbg=NONE    cterm=NONE guifg=#bd93f9 	guibg=NONE gui=NONE
"}}}

" Java Script {{{
hi javaScriptFunction   ctermfg=117     ctermbg=NONE    cterm=NONE
hi javaScriptRailsFunction ctermfg=117  ctermbg=NONE    cterm=NONE
hi javaScriptBraces     ctermfg=NONE    ctermbg=NONE    cterm=NONE
"}}}

" Yaml {{{
hi yamlKey              ctermfg=212     ctermbg=NONE    cterm=NONE
hi yamlAnchor           ctermfg=NONE    ctermbg=NONE    cterm=NONE
hi yamlAlias            ctermfg=NONE    ctermbg=NONE    cterm=NONE
hi yamlDocumentHeader   ctermfg=228     ctermbg=NONE    cterm=NONE
"}}}

" CSS {{{
hi cssURL               ctermfg=215     ctermbg=NONE    cterm=NONE
hi cssFunctionName      ctermfg=117     ctermbg=NONE    cterm=NONE
hi cssColor             ctermfg=141     ctermbg=NONE    cterm=NONE
hi cssPseudoClassId     ctermfg=84      ctermbg=NONE    cterm=NONE
hi cssClassName         ctermfg=84      ctermbg=NONE    cterm=NONE
hi cssValueLength       ctermfg=141     ctermbg=NONE    cterm=NONE
hi cssCommonAttr        ctermfg=81      ctermbg=NONE    cterm=NONE
hi cssBraces            ctermfg=NONE    ctermbg=NONE    cterm=NONE
"}}}

" TabLine {{{
hi TabLine              ctermfg=248     ctermbg=235     cterm=NONE 		guifg=#666666 	guibg=#282a36 gui=none
hi TabLineFill          ctermfg=246     ctermbg=235     cterm=NONE 		guifg=#333333 	guibg=#282a36 gui=none
hi TabLineSel           ctermfg=15      ctermbg=24      cterm=italic 	guifg=WHITE 	  guibg=#282a36 gui=none
"}}}

" Elixir {{{
hi elixirAtom                   ctermfg=81      ctermbg=NONE    cterm=NONE
hi elixirModuleDeclaration      ctermfg=81      ctermbg=NONE    cterm=NONE
hi elixirAlias                  ctermfg=81      ctermbg=NONE    cterm=NONE
hi elixirInterpolationDelimiter ctermfg=84      ctermbg=NONE    cterm=NONE
hi elixirStringDelimiter        ctermfg=228     ctermbg=NONE    cterm=NONE
"}}}

" Vim Script {{{
hi vimGroupName         ctermfg=67      ctermbg=NONE    cterm=NONE guifg=NONE     guibg=NONE gui=NONE
hi vimGroup             ctermfg=67      ctermbg=NONE    cterm=NONE guifg=NONE     guibg=NONE gui=NONE
hi vimOption            ctermfg=68      ctermbg=NONE    cterm=NONE guifg=NONE     guibg=NONE gui=NONE
hi vimHiCtermFgBg       ctermfg=132     ctermbg=NONE    cterm=NONE guifg=#cccccc  guibg=NONE gui=NONE
hi vimHiGuiFgBg         ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=#cccccc  guibg=NONE gui=NONE
hi vimVar               ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=NONE     guibg=NONE gui=NONE
hi vimHilight           ctermfg=132     ctermbg=NONE    cterm=NONE guifg=NONE     guibg=NONE gui=NONE
hi vimHiCterm           ctermfg=132     ctermbg=NONE    cterm=NONE guifg=NONE     guibg=NONE gui=NONE
hi vimHiGui             ctermfg=132     ctermbg=NONE    cterm=NONE guifg=#cccccc  guibg=NONE gui=NONE
hi vimLet               ctermfg=24      ctermbg=NONE    cterm=NONE guifg=#1b77e9  guibg=NONE gui=NONE
hi vimMap               ctermfg=24      ctermbg=NONE    cterm=NONE guifg=#5f9ea0  guibg=NONE gui=NONE
hi vimAutoCmd           ctermfg=12      ctermbg=NONE    cterm=NONE guifg=#1b77e9  guibg=NONE gui=NONE
hi vimMapModKey         ctermfg=132     ctermbg=NONE    cterm=NONE guifg=NONE     guibg=NONE gui=NONE
hi vimNotation          ctermfg=132     ctermbg=NONE    cterm=NONE guifg=NONE     guibg=NONE gui=NONE
hi vimCtrlChar          ctermfg=132     ctermbg=NONE    cterm=NONE guifg=#404040	guibg=NONE gui=NONE
" }}}

" Markdown: {{{
hi markdownH1                 ctermfg=141     ctermbg=NONE    cterm=bold
hi markdownH2                 ctermfg=141     ctermbg=NONE    cterm=bold
hi markdownH3                 ctermfg=212     ctermbg=NONE    cterm=bold
hi markdownH4                 ctermfg=212     ctermbg=NONE    cterm=bold
hi markdownH5                 ctermfg=212     ctermbg=NONE    cterm=NONE
hi markdownH6                 ctermfg=212     ctermbg=NONE    cterm=NONE

hi markdownCode               ctermfg=228     ctermbg=NONE    cterm=NONE
hi markdownCodeBlock          ctermfg=228     ctermbg=NONE    cterm=NONE
hi markdownCodeDelimiter      ctermfg=228     ctermbg=NONE    cterm=NONE

hi markdownBlockquote         ctermfg=84      ctermbg=NONE    cterm=NONE
hi markdownListMarker         ctermfg=84      ctermbg=NONE    cterm=NONE
hi markdownOrderedListMarker  ctermfg=84      ctermbg=NONE    cterm=NONE
hi markdownRule               ctermfg=84      ctermbg=NONE    cterm=NONE
hi markdownHeadingRule        ctermfg=84      ctermbg=NONE    cterm=NONE

hi markdownUrlDelimiter       ctermfg=215     ctermbg=NONE    cterm=NONE
hi markdownLinkDelimiter      ctermfg=215     ctermbg=NONE    cterm=NONE
hi markdownLinkTextDelimiter  ctermfg=215     ctermbg=NONE    cterm=NONE

hi markdownHeadingDelimiter   ctermfg=117     ctermbg=NONE    cterm=bold
hi markdownUrl                ctermfg=141     ctermbg=NONE    cterm=NONE
hi markdownUrlTitleDelimiter  ctermfg=84      ctermbg=NONE    cterm=NONE
" }}}


"
"cygwin has an annoying behavior where it resets background to light
"regardless of what is set above, so we force it yet again
"
"add these to get cygwin shell working when used to ssh into a centos6 vm
"this requires your TERM=xterm-256color in the guest vm
"- one way to do this is to append to /home/vagrant/.bash_profile ala:
"      TERM=xterm-256color
"      export $TERM

execute "set background=dark"
"-------------------
