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
" 0author Zeno Rocha <hi@zenorocha.com>

set background=dark
scriptencoding utf-8
highlight clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "darktheme"

" syn match Braces display '[{}()\[\]]'
" syntax match Operator "[-+&|<>=!\/~:*%&^?]"

hi Normal       ctermfg=7       ctermbg=233     cterm=NONE              guifg=#cccccc   guibg=#2B303B   gui=NONE
hi ColorColumn  ctermfg=NONE    ctermbg=232     cterm=NONE              guifg=NONE      guibg=#101010   gui=NONE
hi SignColumn   ctermfg=246     ctermbg=233     cterm=bold              guifg=#909194   guibg=#201f23   gui=NONE
" hi Cursor       ctermfg=NONE    ctermbg=NONE    cterm=inverse,bold      guifg=NONE      guibg=NONE      gui=inverse,bold
hi Visual       ctermfg=NONE    ctermbg=237     cterm=NONE              guifg=NONE      guibg=#435068   gui=NONE
hi CursorLine   ctermfg=NONE    ctermbg=235     cterm=NONE              guifg=NONE      guibg=#053f6f   gui=NONE
hi CursorColumn ctermbg=234     ctermbg=NONE    cterm=NONE              guifg=NONE      guibg=#033246   gui=NONE
hi LineNr       ctermfg=60      ctermbg=235     cterm=NONE              guifg=#a0a0a0   guibg=#3a455e   gui=NONE
hi CursorLineNr ctermfg=0       ctermbg=131     cterm=NONE              guifg=#eeeeee   guibg=#96594E   gui=NONE
hi VertSplit    ctermfg=60      ctermbg=NONE    cterm=NONE              guifg=#64666d   guibg=NONE      gui=bold
hi MatchParen   ctermfg=126     ctermbg=NONE    cterm=underline,bold    guifg=#f92a5b   guibg=NONE      gui=bold,underline
hi ParenError   ctermfg=NONE    ctermbg=NONE    cterm=underline,bold
hi Braces       ctermfg=NONE    ctermbg=NONE    cterm=bold,underline
hi StatusLine   ctermfg=7       ctermbg=236     cterm=NONE              guifg=#f8f8f2   guibg=#383a4c   gui=NONE
hi StatusLineNC ctermfg=7       ctermbg=236     cterm=NONE              guifg=#f8f8f2   guibg=#64666d   gui=NONE
hi IncSearch    ctermfg=NONE    ctermbg=238     cterm=NONE              guifg=NONE      guibg=#3a455e   gui=NONE
hi Search       ctermfg=7       ctermbg=238     cterm=NONE              guifg=NONE      guibg=#3a455e   gui=NONE
hi ExtSearch    ctermfg=9       ctermbg=NONE    cterm=underline         guifg=#f92a5b   guibg=NONE      gui=bold,underline
hi Directory    ctermfg=141     ctermbg=NONE    cterm=NONE              guifg=#bd93f9   guibg=NONE      gui=NONE
hi Folded       ctermfg=61      ctermbg=235     cterm=NONE              guifg=#6272a4   guibg=#282a36   gui=NONE
hi FoldColumn   ctermfg=246     ctermbg=235     cterm=NONE              guifg=#909194   guibg=#343648   gui=NONE
hi Boolean      ctermfg=129     ctermbg=NONE    cterm=NONE              guifg=#bd93f9   guibg=NONE      gui=NONE
hi Comment      ctermfg=242     ctermbg=NONE    cterm=NONE              guifg=#909090   guibg=NONE      gui=italic
hi Conditional  ctermfg=25      ctermbg=NONE    cterm=NONE              guifg=#6494ed   guibg=NONE      gui=NONE
hi Constant     ctermfg=NONE    ctermbg=NONE    cterm=NONE              guifg=#5f9ea0   guibg=NONE      gui=NONE
hi Define       ctermfg=66      ctermbg=NONE    cterm=NONE              guifg=#ff79c6   guibg=NONE      gui=NONE
hi ErrorMsg     ctermfg=7       ctermbg=212     cterm=NONE              guifg=#fa2c77   guibg=#303030   gui=NONE
hi WarningMsg   ctermfg=162     ctermbg=212     cterm=NONE              guifg=#fccc82   guibg=#303030   gui=NONE
hi Float        ctermfg=141     ctermbg=NONE    cterm=NONE              guifg=#bd93f9   guibg=NONE      gui=NONE
hi Function     ctermfg=61      ctermbg=NONE    cterm=NONE              guifg=#50fa7b   guibg=NONE      gui=NONE
hi Identifier   ctermfg=246     ctermbg=NONE    cterm=NONE              guifg=#0097a7   guibg=NONE      gui=NONE
hi Keyword      ctermfg=126     ctermbg=NONE    cterm=NONE              guifg=#6272a4   guibg=NONE      gui=NONE
hi Label        ctermfg=132     ctermbg=NONE    cterm=NONE              guifg=#698bb8   guibg=NONE      gui=NONE
hi NonText      ctermfg=244     ctermbg=NONE    cterm=NONE              guifg=#525563   guibg=NONE      gui=NONE
hi Number       ctermfg=180     ctermbg=NONE    cterm=NONE              guifg=#eb4a9c   guibg=NONE      gui=NONE
hi Operator     ctermfg=62      ctermbg=NONE    cterm=bold              guifg=#7e8aa2   guibg=NONE      gui=bold
hi PreProc      ctermfg=31      ctermbg=NONE    cterm=NONE              guifg=#808080   guibg=NONE      gui=NONE
hi Special      ctermfg=65      ctermbg=NONE    cterm=NONE              guifg=#f08080   guibg=NONE      gui=NONE
hi SpecialKey   ctermfg=238     ctermbg=NONE    cterm=NONE              guifg=#424553   guibg=NONE      gui=NONE
" hi Conceal    ctermfg=238     ctermbg=NONE    cterm=NONE
hi Statement    ctermfg=66      ctermbg=NONE    cterm=NONE              guifg=#4682B4   guibg=NONE      gui=NONE
hi StorageClass ctermfg=54      ctermbg=NONE    cterm=NONE              guifg=#ad95d6   guibg=NONE      gui=NONE
hi String       ctermfg=60      ctermbg=NONE    cterm=NONE              guifg=#7a8a80   guibg=NONE      gui=NONE
hi Tag          ctermfg=212     ctermbg=NONE    cterm=NONE              guifg=#ff79c6   guibg=NONE      gui=NONE
hi Todo         ctermfg=61      ctermbg=NONE    cterm=inverse,bold      guifg=#6272a4   guibg=NONE      gui=inverse,bold
hi Title        ctermfg=7       ctermbg=NONE    cterm=bold              guifg=#f8f8f2   guibg=NONE      gui=bold
hi Type         ctermfg=126     ctermbg=NONE    cterm=NONE              guifg=#6494ed   guibg=NONE      gui=NONE
hi Underlined   ctermfg=NONE    ctermbg=NONE    cterm=underline         guifg=NONE      guibg=NONE      gui=underline
hi ModeMsg      ctermfg=NONE    ctermbg=NONE    cterm=underline         guifg=#dd808b   guibg=NONE      gui=NONE
hi WildMenu     ctermfg=NONE    ctermbg=NONE    cterm=NONE              guifg=#000000   guibg=#909090   gui=NONE
hi Whitespace   ctermfg=NONE    ctermbg=NONE    cterm=NONE              guifg=#505050   guibg=NONE      gui=NONE
hi NormalFloat  ctermfg=NONE    ctermbg=NONE    cterm=NONE              guifg=#e0e0e0   guibg=#314457   gui=NONE

" spelling {{{
hi SpellBad             ctermfg=NONE       ctermbg=NONE    cterm=underline guifg=NONE   guibg=NONE   gui=underline
hi SpellCap             ctermfg=NONE       ctermbg=NONE    cterm=underline guifg=NONE   guibg=NONE   gui=underline
hi SpellLocal           ctermfg=NONE       ctermbg=NONE    cterm=underline guifg=NONE   guibg=NONE   gui=underline
" }}}

" C/C++ {{{
hi c89Function          ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#46a6a2   guibg=NONE      gui=NONE
hi cCommentStart        ctermfg=243     ctermbg=NONE    cterm=NONE      guifg=#808080   guibg=NONE      gui=NONE
hi cConditional         ctermfg=172     ctermbg=NONE    cterm=NONE      guifg=#27b062   guibg=NONE      gui=NONE
hi cRepeat              ctermfg=95      ctermbg=NONE    cterm=NONE      guifg=#27b062   guibg=NONE      gui=NONE
hi cPPIncludeFile       ctermfg=60      ctermbg=NONE    cterm=NONE      guifg=#f1fa8c   guibg=NONE      gui=NONE
hi cOperator            ctermfg=62      ctermbg=NONE    cterm=NONE      guifg=#7e8aa2   guibg=NONE      gui=NONE
hi cInclude             ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#ad64c2   guibg=NONE      gui=NONE
hi cIncluded            ctermfg=172     ctermbg=NONE    cterm=NONE      guifg=#7f7fa7   guibg=NONE      gui=italic
hi cDefine              ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#5f9ea0   guibg=NONE      gui=NONE
hi cNumber              ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#eb4a9c   guibg=NONE      gui=NONE
hi cppNumber            ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#eb4a9c   guibg=NONE      gui=NONE
hi cCommentError        ctermfg=240     ctermbg=NONE    cterm=NONE      guifg=#cc0000   guibg=NONE      gui=NONE
hi cParenError          ctermfg=240     ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi cParen               ctermfg=240     ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi cGNUConstant         ctermfg=7       ctermbg=NONE    cterm=NONE      guifg=#bc8f8f   guibg=NONE      gui=NONE
hi cCharacter           ctermfg=7       ctermbg=NONE    cterm=NONE      guifg=#bc8f8f   guibg=NONE      gui=NONE
" hi cBinaryOperator      ctermfg=12      ctermbg=NONE    cterm=NONE      guifg=#f1fa8c     guibg=NONE      gui=NONE
" hi cMathOperator        ctermfg=132     ctermbg=NONE    cterm=NONE      guifg=#f1fa8c     guibg=NONE      gui=NONE
hi cLogicalOperator     ctermfg=93      ctermbg=NONE    cterm=NONE      guifg=#6089b7   guibg=NONE      gui=NONE
hi cPointerOperator     ctermfg=60      ctermbg=NONE    cterm=NONE      guifg=#6089b7   guibg=NONE      gui=NONE
hi cStorageClass        ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#a580ff   guibg=NONE      gui=NONE
hi cStructure           ctermfg=132     ctermbg=NONE    cterm=NONE      guifg=#ad5d60   guibg=NONE      gui=italic
hi cType                ctermfg=25      ctermbg=NONE    cterm=italic    guifg=#0088cc   guibg=NONE      gui=italic
hi cConstant            ctermfg=96      ctermbg=NONE    cterm=NONE      guifg=#ac547e   guibg=NONE      gui=italic
hi cFormat              ctermfg=96      ctermbg=NONE    cterm=NONE      guifg=#458b74   guibg=NONE      gui=NONE
hi cStatement           ctermfg=25      ctermbg=NONE    cterm=NONE      guifg=#bd74d2   guibg=NONE      gui=NONE
hi cUserFunction        ctermfg=7       ctermbg=233     cterm=NONE      guifg=#cccccc   guibg=NONE      gui=NONE
hi cFunctionTag         ctermfg=7       ctermbg=233     cterm=NONE      guifg=#ac547e   guibg=NONE      gui=NONE
hi cFloat               ctermfg=180     ctermbg=NONE    cterm=NONE      guifg=#f1fa8c   guibg=NONE      gui=NONE
hi cOctalZero           ctermfg=180     ctermbg=NONE    cterm=NONE      guifg=#f1fa8c   guibg=NONE      gui=NONE
hi c89Macro             ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#f1fa8c   guibg=NONE      gui=NONE
" hi cBlock               ctermfg=172     ctermbg=NONE    cterm=NONE    guifg=#bc8f8f     guibg=NONE      gui=NONE
hi cString              ctermfg=172     ctermbg=NONE    cterm=italic    guifg=#7a8a80   guibg=NONE      gui=italic
hi cCppOutWrapper       ctermfg=172     ctermbg=NONE    cterm=NONE      guifg=#008080   guibg=NONE      gui=NONE
hi cCppInWrapper        ctermfg=172     ctermbg=NONE    cterm=NONE      guifg=#008080   guibg=NONE      gui=NONE
" hi cAnsiFunction        ctermfg=172     ctermbg=NONE    cterm=NONE      guifg=#ebcb85   guibg=NONE      gui=NONE
" hi cCppOutIf2           ctermfg=172     ctermbg=NONE    cterm=NONE    guifg=#bc8f8f     guibg=NONE      gui=NONE
" }}}

" python {{{
hi pythonInclude        ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#59B7C5   guibg=NONE      gui=italic
hi pythonString         ctermfg=172     ctermbg=NONE    cterm=italic    guifg=#75828f   guibg=NONE      gui=italic
hi pythonFunction       ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#ac547e   guibg=NONE      gui=italic
hi pythonRepeat         ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#ac547e   guibg=NONE      gui=NONE
hi pythonConditional    ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#ac547e   guibg=NONE      gui=NONE
hi pythonBuiltinObj     ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#ac6bf1   guibg=NONE      gui=NONE
hi pythonSelf           ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#6f91e3   guibg=NONE      gui=italic
hi pythonClass          ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#50BA9A   guibg=NONE      gui=bold,italic
hi pythonDot            ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#00cd00   guibg=NONE      gui=NONE
hi pythonExtraOperator  ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#5fba7d   guibg=NONE      gui=NONE
hi pythonOperator       ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#ceab5a   guibg=NONE      gui=italic
hi pythonException      ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#cc9977   guibg=NONE      gui=italic
hi pythonParam          ctermfg=7       ctermbg=NONE    cterm=NONE      guifg=#cccccc   guibg=NONE      gui=NONE
hi pythonBuiltinFunc    ctermfg=7       ctermbg=NONE    cterm=NONE      guifg=#28b473   guibg=NONE      gui=italic
hi pythonBuiltin        ctermfg=7       ctermbg=NONE    cterm=NONE      guifg=#AC6BF1   guibg=NONE      gui=italic
hi pythonDottedName     ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#cc9977   guibg=NONE      gui=NONE
hi pythonDecorator      ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#cc9977   guibg=NONE      gui=NONE
hi pythonDecoratorName  ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#cc9977   guibg=NONE      gui=NONE
hi pythonStatement      ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#cc9977   guibg=NONE      gui=NONE
" }}}

" Golang {{{
hi goDeclaration    ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#47D68E  guibg=NONE      gui=NONE
hi goImport         ctermfg=7       ctermbg=233     cterm=NONE      guifg=#BC70A4  guibg=NONE      gui=italic
hi goTypeDecl       ctermfg=7       ctermbg=233     cterm=NONE      guifg=#BC70A4  guibg=NONE      gui=italic
hi goTypeName       ctermfg=7       ctermbg=233     cterm=NONE      guifg=#1BB1E7  guibg=NONE      gui=bold
hi goPackage        ctermfg=7       ctermbg=233     cterm=NONE      guifg=#EF4C9B  guibg=NONE      gui=NONE
hi goFunction       ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#af5f5f  guibg=NONE      gui=NONE
hi goFloats         ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#CC9977  guibg=NONE      gui=NONE
hi goSignedInts     ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#CC9977  guibg=NONE      gui=NONE
hi goUnsignedInts   ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#CC9977  guibg=NONE      gui=NONE
hi goComplexes      ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#CC9977  guibg=NONE      gui=NONE
hi goType           ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#CA7F85  guibg=NONE      gui=italic
hi goVar            ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#59B7C5  guibg=NONE      gui=italic
hi goVarDefs        ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#AC6BF1  guibg=NONE      gui=italic
hi goLabel          ctermfg=7       ctermbg=233     cterm=NONE      guifg=#BC70A4  guibg=NONE      gui=NONE
hi goConditional    ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#46a6a2  guibg=NONE      gui=NONE
hi goRepeat         ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#46a6a2  guibg=NONE      gui=NONE
hi goStatement      ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#CC9977  guibg=NONE      gui=NONE
" }}}

" gdb {{{
hi gdbFuncDef           ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#ac547e   guibg=NONE      gui=italic
hi gdbNumber            ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#ac6bf1   guibg=NONE      gui=NONE
hi gdbDocument          ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#909090   guibg=NONE      gui=NONE
" }}}

" Make {{{
hi makeIndent           ctermfg=172     ctermbg=NONE    cterm=NONE    guifg=#3285c7   guibg=NONE      gui=NONE
hi makeTarget           ctermfg=172     ctermbg=NONE    cterm=NONE    guifg=#bdb76b   guibg=NONE      gui=NONE
" }}}

" tmux {{{
hi tmuxOptions          ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#bc8f8f   guibg=NONE      gui=NONE
hi tmuxFlags            ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#27b062   guibg=NONE      gui=NONE
hi tmuxCommands         ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#6089b7   guibg=NONE      gui=NONE
hi tmuxBoolean          ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#909090   guibg=NONE      gui=NONE
hi tmuxFormatString     ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#3e8c75   guibg=NONE      gui=NONE
" }}}

" denite {{{
hi DeniteNormalHLLine   ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=#444c5c   gui=NONE
hi DenitePrompt         ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#27b062   guibg=NONE      gui=NONE
hi DeniteFloatWin       ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#e0e0e0   guibg=#000000   gui=NONE
hi deniteGrepPatterns   ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#BFA161   guibg=NONE      gui=NONE
hi deniteSource_grep    ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#c0c0c0   guibg=NONE      gui=NONE
hi deniteMatchedChar    ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#EE4C9B   guibg=NONE      gui=bold
" }}}

" line-number-interval {{{
hi HighlightedLineNr  ctermfg=60  ctermbg=235  cterm=NONE  guifg=#c0c0c0   guibg=#4a5a64   gui=NONE
hi link DimLineNr LineNr
" }}}

" fzf.vim {{{
hi FZFMain              ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#cccccc   guibg=#000000   gui=NONE
hi FZFPreview           ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#cccccc   guibg=#314457   gui=NONE
hi FZFHighlight         ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#cccccc   guibg=#df678f   gui=NONE
hi FZFCurrentLn         ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#cfd780   guibg=#242C44   gui=NONE
hi FZFGutter            ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#cccccc   guibg=#444c5c   gui=NONE
hi FZFHighlightCurLn    ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#1BC1E7   guibg=#343c4c   gui=bold
hi FZFBorder            ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#5DADEC   guibg=NONE      gui=bold
hi FZFPrompt            ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#d7005f   guibg=NONE      gui=NONE
hi FZFPointer           ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#af5fff   guibg=NONE      gui=NONE
hi FZFMarker            ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#1BC1E7   guibg=NONE      gui=NONE
hi FZFSpinner           ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#af5fff   guibg=NONE      gui=bold
hi FZFHeader            ctermfg=NONE    ctermbg=NONE    cterm=italic    guifg=#61afef   guibg=NONE      gui=NONE
hi FZFInfo              ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#e79498   guibg=NONE      gui=NONE
" }}}

" vim-clap {{{
hi ClapInput                    ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#00BEFF   guibg=#314457   gui=NONE
hi ClapDisplay                  ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#c0c0c0   guibg=#2a456e   gui=NONE
hi ClapPreview                  ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#909090   guibg=#2a456e   gui=NONE
hi ClapMatches                  ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#FF9933   guibg=NONE      gui=bold,underline,italic
hi ClapMatches1                 ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#FF9933   guibg=NONE      gui=NONE
hi ClapMatches2                 ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#00BEFF   guibg=NONE      gui=bold
hi ClapMatches4                 ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#FF9933   guibg=NONE      gui=bold
hi ClapMatches3                 ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#00BEFF   guibg=NONE      gui=bold
hi ClapMatches6                 ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#FF9933   guibg=NONE      gui=bold
hi ClapMatches5                 ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#00BEFF   guibg=NONE      gui=bold
hi ClapMatches7                 ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#FF9933   guibg=NONE      gui=bold
hi ClapMatches8                 ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#00BEFF   guibg=NONE      gui=bold
hi ClapFuzzyMatches1            ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#00BEFF   guibg=NONE      gui=bold
hi ClapFuzzyMatches2            ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#FF9933   guibg=NONE      gui=bold
hi ClapFuzzyMatches3            ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#00BEFF   guibg=NONE      gui=bold
hi ClapFuzzyMatches4            ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#FF9933   guibg=NONE      gui=bold
hi ClapFuzzyMatches5            ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#00BEFF   guibg=NONE      gui=bold
hi ClapFuzzyMatches6            ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#FF9933   guibg=NONE      gui=bold
hi ClapFuzzyMatches7            ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#00BEFF   guibg=NONE      gui=bold
hi ClapFuzzyMatches8            ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#FF9933   guibg=NONE      gui=bold
hi ClapFuzzyMatches9            ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#00BEFF   guibg=NONE      gui=bold
hi ClapFuzzyMatches10           ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#FF9933   guibg=NONE      gui=bold
hi ClapFuzzyMatches11           ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#00BEFF   guibg=NONE      gui=bold
hi ClapFuzzyMatches12           ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#FF9933   guibg=NONE      gui=bold
hi ClapSelected                 ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=NONE      guibg=NONE      gui=NONE
hi ClapCurrentSelected          ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#c0c0c0   guibg=#356088   gui=NONE
hi ClapCurrentSelection         ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#F7CAB8   guibg=#356088   gui=NONE
hi ClapSelectedSign             ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#DDCC77   guibg=NONE      gui=NONE
hi ClapCurrentSelectedSign      ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#2BBAEF   guibg=NONE      gui=NONE
hi ClapDefaultCurrentSelection  ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#c0c0c0   guibg=NONE      gui=NONE
hi ClapQuery                    ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#c0c0c0   guibg=NONE      gui=NONE
hi ClapSpinner                  ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#FF9933   guibg=#314457   gui=NONE

" clap grep
hi ClapFpath                ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#E79498   guibg=NONE   gui=NONE
hi ClapLinNr                ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#AC6BF1   guibg=NONE   gui=NONE
hi ClapColumn               ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#DDCC77   guibg=NONE   gui=NONE
hi ClapLinNrColumn          ctermfg=NONE    ctermbg=NONE    cterm=NONE   guifg=#2BBAEF   guibg=NONE   gui=NONE
" }}}

" tagbar {{{
hi TagbarScope      ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#AC6BF1   guibg=NONE      gui=NONE
hi TagbarHighlight  ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#47D68E   guibg=NONE      gui=bold
hi TagbarFoldIcon   ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#B6795B   guibg=NONE      gui=NONE
hi TagbarKind       ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#258FB8   guibg=NONE      gui=bold,italic
hi TagbarType       ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#BFA161   guibg=NONE      gui=italic
hi TagbarNestedKind ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#CD5061   guibg=NONE      gui=NONE
" }}}

" vim-better-whitespace {{{
hi ExtraWhitespace  ctermfg=NONE    ctermbg=NONE    cterm=NONE      guifg=#CD5061   guibg=NONE      gui=NONE
" }}}

" sh {{{
hi shVariable           ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#bc8f8f   guibg=NONE      gui=NONE
hi shFunction           ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#ac547e   guibg=NONE      gui=NONE
hi shDerefOpError       ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#bdb76b   guibg=NONE      gui=NONE
hi shDerefWordError     ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#bdb76b   guibg=NONE      gui=NONE
hi shLoop               ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#ac6bf1   guibg=NONE      gui=NONE
hi shConditional        ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#3285c7   guibg=NONE      gui=NONE
hi shExprRegion         ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#bdb76b   guibg=NONE      gui=NONE
hi shTestOpr            ctermfg=66      ctermbg=NONE    cterm=NONE      guifg=#5fba7d   guibg=NONE      gui=italic
" }}}

" doxygen {{{
hi doxygenBrief                 ctermfg=132     ctermbg=NONE    cterm=NONE    guifg=#808080   guibg=NONE      gui=NONE
hi doxygenBody                  ctermfg=132     ctermbg=NONE    cterm=NONE    guifg=#808080   guibg=NONE      gui=NONE
hi doxygenBOther                ctermfg=181     ctermbg=NONE    cterm=NONE    guifg=#808080   guibg=NONE      gui=NONE
hi doxygenParam                 ctermfg=181     ctermbg=NONE    cterm=NONE    guifg=#aa5500   guibg=NONE      gui=NONE
" hi doxygenStartSpecial        ctermfg=65      ctermbg=NONE    cterm=NONE    guifg=#808080   guibg=NONE      gui=NONE
hi doxygenParamName             ctermfg=65      ctermbg=NONE    cterm=NONE    guifg=#3e8c75   guibg=NONE      gui=NONE
hi doxygenSpecialMultilineDesc  ctermfg=6       ctermbg=NONE    cterm=NONE    guifg=#808080   guibg=NONE      gui=NONE
hi doxygenComment               ctermfg=6       ctermbg=NONE    cterm=NONE    guifg=#6272a4   guibg=NONE      gui=NONE
" }}}

" dts-mode {{{
hi dtsCellProperty      ctermfg=66      ctermbg=NONE    cterm=NONE
" }}}

" gitconfig {{{
hi gitconfigVariable    ctermfg=62      ctermbg=NONE    cterm=NONE    guifg=#a0a0a0  guibg=NONE   gui=NONE
hi gitconfigAssignment  ctermfg=7       ctermbg=NONE    cterm=NONE    guifg=#7a8a8a  guibg=NONE   gui=NONE
hi gitconfigBoolean     ctermfg=60      ctermbg=NONE    cterm=NONE    guifg=#008b8b  guibg=NONE   gui=NONE
hi gitconfigSection     ctermfg=60      ctermbg=NONE    cterm=NONE    guifg=#4682b4  guibg=NONE   gui=NONE
" }}}

" which-key {{{
hi WhichKey             ctermfg=62      ctermbg=NONE    cterm=NONE    guifg=#a580ff  guibg=NONE   gui=NONE
hi WhichKeySeperator    ctermfg=62      ctermbg=NONE    cterm=NONE    guifg=#ff5500  guibg=NONE   gui=NONE
hi WhichKeyGroup        ctermfg=62      ctermbg=NONE    cterm=NONE    guifg=#89b7b5  guibg=NONE   gui=NONE
hi WhichKeyDesc         ctermfg=62      ctermbg=NONE    cterm=NONE    guifg=#4682b4  guibg=NONE   gui=NONE
" }}}

" vim-matchup {{{
hi MatchWord          ctermfg=62      ctermbg=NONE    cterm=NONE    guifg=#fa2c77  guibg=NONE   gui=italic,underline
" }}}

" ShowMotion {{{
highlight SM_SmallMotionGroup ctermfg=NONE    ctermbg=NONE    cterm=bold,italic,underline guifg=NONE guibg=NONE    gui=bold,italic,underline
highlight SM_BigMotionGroup   ctermfg=NONE    ctermbg=NONE    cterm=bold,italic,underline guifg=NONE guibg=NONE    gui=bold,italic,underline
highlight SM_CharSearchGroup  ctermfg=NONE    ctermbg=NONE    cterm=bold,italic,underline guifg=NONE guibg=NONE    gui=bold,italic,underline
" }}}

" vim-sandwitch {{{
hi OperatorSandwichBuns       ctermfg=26     ctermbg=233   cterm=bold  guifg=#00bbff  guibg=NONE   gui=bold
hi OperatorSandwichAdd        ctermfg=26     ctermbg=233   cterm=bold  guifg=#47F0A2  guibg=NONE   gui=bold
hi OperatorSandwichChange     ctermfg=180    ctermbg=233   cterm=bold  guifg=#f7da68  guibg=NONE   gui=bold
hi OperatorSandwichDelete     ctermfg=196    ctermbg=233   cterm=bold  guifg=#fb091f  guibg=NONE   gui=bold
" }}}

" git-signify {{{
hi SignifySignAdd             ctermfg=26     ctermbg=233   cterm=bold  guifg=#27b062  guibg=#202020   gui=bold
hi SignifySignChange          ctermfg=180    ctermbg=233   cterm=bold  guifg=#f7ca88  guibg=#202020   gui=bold
hi SignifySignDelete          ctermfg=196    ctermbg=233   cterm=bold  guifg=#fb091f  guibg=#202020   gui=bold
hi SignifySignChangeDelete    ctermfg=94     ctermbg=233   cterm=bold  guifg=#ff5500  guibg=#202020   gui=bold
" }}}

" vim-anzu {{{
hi AnzuNormal               ctermfg=93      ctermbg=NONE    cterm=NONE    guifg=#f7ca88  guibg=NONE   gui=NONE
hi AnzuArrow                ctermfg=93      ctermbg=NONE    cterm=NONE    guifg=#fb091f  guibg=NONE   gui=bold
hi AnzuSearchObj            ctermfg=93      ctermbg=NONE    cterm=NONE    guifg=#a580ff  guibg=NONE   gui=bold,italic
hi AnzuSeparator            ctermfg=172     ctermbg=NONE    cterm=NONE    guifg=#00bbff  guibg=NONE   gui=bold
hi AnzuSearchCnt            ctermfg=32      ctermbg=NONE    cterm=NONE    guifg=#f399af  guibg=NONE   gui=NONE
hi AnzuSearchTotalCnt       ctermfg=32      ctermbg=NONE    cterm=NONE    guifg=#857073  guibg=NONE   gui=bold
hi AnzuParen                ctermfg=238     ctermbg=NONE    cterm=NONE    guifg=#a3495b  guibg=NONE   gui=bold
" }}}

" ale {{{
" hi AleError                 ctermfg=198    ctermbg=NONE    cterm=NONE      guifg=#f92a5b      guibg=NONE   gui=italic
" hi AleWarning               ctermfg=5      ctermbg=NONE    cterm=NONE      guifg=#5f9ea0      guibg=NONE   gui=italic
" }}}

" echodoc {{{
hi EchoDocFunc       ctermfg=93   ctermbg=NONE    cterm=NONE    guifg=#8C3149  guibg=NONE       gui=NONE
hi EchoDocParam      ctermfg=93   ctermbg=NONE    cterm=NONE    guifg=#0056B9  guibg=NONE       gui=bold,italic
hi EchoDocFloat      ctermfg=93   ctermbg=NONE    cterm=NONE    guifg=#000000  guibg=#EFE7D4    gui=NONE
hi EchoDocTrailing   ctermfg=93   ctermbg=NONE    cterm=NONE    guifg=#CE4CAB  guibg=NONE       gui=NONE
" }}}

" git-gutter {{{
hi GitGutterAdd             ctermfg=26  ctermbg=233 cterm=bold guifg=#27b062 guibg=#202020 gui=bold
hi GitGutterChange          ctermfg=180 ctermbg=233 cterm=bold guifg=#f7ca88 guibg=#202020 gui=bold
hi GitGutterDelete          ctermfg=196 ctermbg=233 cterm=bold guifg=#fb091f guibg=#202020 gui=bold
hi GitGutterAddLineNr       ctermfg=94  ctermbg=233 cterm=bold guifg=NONE    guibg=#3E8C75 gui=bold
hi GitGutterChangeLineNr    ctermfg=94  ctermbg=233 cterm=bold guifg=NONE    guibg=#7A8A80 gui=bold
hi GitGutterDeleteLineNr    ctermfg=94  ctermbg=233 cterm=bold guifg=NONE    guibg=#7B3513 gui=bold
" }}}

" Braceless {{{
hi  BracelessIndent     ctermfg=NONE     ctermbg=237    cterm=NONE      guifg=NONE      guibg=#505050   gui=NONE
" }}}

" wstrip {{{
hi  WStripTrailing     ctermfg=9     ctermbg=NONE    cterm=underline      guifg=NONE      guibg=#155078   gui=underline
" }}}

" CtrlP {{{
hi CtrlPMatch           ctermfg=6       ctermbg=NONE    cterm=NONE  guifg=#F46E6A  guibg=NONE      gui=bold
hi CtrlPPrtText         ctermfg=60      ctermbg=NONE    cterm=NONE  guifg=#1d8d77  guibg=NONE      gui=NONE
hi CtrlPLinePre         ctermfg=172     ctermbg=NONE    cterm=NONE  guifg=#27b062  guibg=NONE      gui=NONE
hi CtrlPPrtBase         ctermfg=172     ctermbg=NONE    cterm=bold  guifg=#ad5d60  guibg=NONE      gui=bold
hi CtrlPPrtCursor       ctermfg=172     ctermbg=NONE    cterm=bold  guifg=#e0e0e0  guibg=#000000   gui=bold

hi CtrlPBufferInd       ctermfg=162     ctermbg=NONE    cterm=NONE    guifg=#c76d83  guibg=NONE   gui=NONE
hi CtrlPBufferNr        ctermfg=65      ctermbg=NONE    cterm=NONE    guifg=#ac6600  guibg=NONE   gui=NONE
hi CtrlPBufferVis       ctermfg=7       ctermbg=NONE    cterm=NONE    guifg=#cccccc  guibg=NONE   gui=NONE
hi CtrlPBufferCur       ctermfg=7       ctermbg=NONE    cterm=NONE    guifg=#008b8b  guibg=NONE   gui=NONE
hi CtrlPBufferHid       ctermfg=7       ctermbg=NONE    cterm=NONE    guifg=#6272a4  guibg=NONE   gui=NONE
hi CtrlPBufferPath      ctermfg=7       ctermbg=NONE    cterm=NONE    guifg=#909090  guibg=NONE   gui=NONE
" }}}

" showpairs {{{
" hi ShowPairsHL   ctermfg=27  ctermbg=NONE    cterm=underline,bold    guifg=#ff0080   guibg=#ff0080 gui=bold,underline
hi ShowPairsHLp  ctermfg=27  ctermbg=NONE    cterm=underline,bold    guifg=#008fff   guibg=NONE gui=bold,underline
hi ShowPairsHL   ctermfg=27  ctermbg=NONE    cterm=underline,bold    guifg=#008fff   guibg=NONE gui=bold,underline
" }}}

" Menu selection {{{
hi Pmenu                ctermfg=7       ctermbg=237     cterm=NONE guifg=#c0c0c0  guibg=#415467 gui=NONE
hi PmenuSel             ctermfg=0       ctermbg=137     cterm=NONE guifg=#000000  guibg=#79A7A5 gui=NONE
hi PmenuSbar            ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=#000000  guibg=#414349 gui=NONE
hi PmenuThumb           ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=#000000  guibg=#8C7F70 gui=NONE
"}}}

" GitCommit {{{
hi gitcommitcomment             ctermfg=240     ctermbg=none    cterm=none     guifg=#686868 guibg=NONE    gui=NONE
hi gitcommitoverflow            ctermfg=162     ctermbg=237     cterm=NONE     guifg=#db080b guibg=#404040 gui=NONE
hi gitcommitsummary             ctermfg=7       ctermbg=none    cterm=none     guifg=#eeeeee guibg=NONE    gui=NONE
hi gitcommitbranch              ctermfg=180     ctermbg=none    cterm=none     guifg=#f7cab8 guibg=NONE    gui=NONE
hi gitcommitblank               ctermfg=9       ctermbg=237     cterm=NONE     guifg=#db080b guibg=#404040 gui=NONE
hi gitcommitheader              ctermfg=246     ctermbg=none    cterm=none     guifg=#808080 guibg=NONE    gui=NONE
hi gitcommitdiff                ctermfg=245     ctermbg=none    cterm=none     guifg=#c0c0c0 guibg=NONE    gui=NONE
hi gitcommitselectedfile        ctermfg=66      ctermbg=none    cterm=none     guifg=#3e8c75 guibg=NONE    gui=NONE
hi gitcommitselectedtype        ctermfg=25      ctermbg=none    cterm=NONE     guifg=#689d61 guibg=NONE    gui=NONE
hi gitcommitdiscardedfile       ctermfg=60      ctermbg=none    cterm=none     guifg=#8f575a guibg=NONE    gui=NONE
hi gitcommitdiscardedtype       ctermfg=95      ctermbg=none    cterm=NONE     guifg=#7a8a80 guibg=NONE    gui=NONE
hi gitcommitPatchLabel          ctermfg=132     ctermbg=NONE    cterm=NONE     guifg=#bdb76b guibg=NONE    gui=NONE
hi gitcommitEmailAddr           ctermfg=65      ctermbg=NONE    cterm=NONE     guifg=#5f9ea0 guibg=NONE    gui=NONE
hi gitcommitSignedAuthor        ctermfg=25      ctermbg=NONE    cterm=NONE     guifg=#367bf0 guibg=NONE    gui=NONE
hi gitcommitAuthor              ctermfg=24      ctermbg=NONE    cterm=NONE     guifg=#7a8a80 guibg=NONE    gui=NONE
" }}}

" Diff {{{
hi diffAdded            ctermfg=28      ctermbg=NONE    cterm=NONE      guifg=#32cd32 guibg=NONE     gui=NONE
hi diffRemoved          ctermfg=161     ctermbg=NONE    cterm=NONE      guifg=#cc241d guibg=NONE     gui=NONE
hi diffChanged          ctermfg=65      ctermbg=NONE    cterm=NONE      guifg=#cccccc guibg=NONE     gui=NONE
hi diffText             ctermfg=7       ctermbg=NONE    cterm=NONE      guifg=#cccccc guibg=NONE     gui=NONE
hi diffNewFile          ctermfg=95      ctermbg=NONE    cterm=NONE      guifg=#fb4934 guibg=NONE     gui=NONE
hi diffFile             ctermfg=95      ctermbg=NONE    cterm=NONE      guifg=#3cbc71 guibg=NONE     gui=NONE
hi diffLine             ctermfg=142     ctermbg=NONE    cterm=NONE      guifg=#f4a460 guibg=NONE     gui=NONE
hi diffIndexLine        ctermfg=127     ctermbg=NONE    cterm=NONE      guifg=#cd5c5c guibg=NONE     gui=NONE
hi diffSubname          ctermfg=67      ctermbg=NONE    cterm=NONE      guifg=#a0a0a0 guibg=NONE     gui=NONE

" Highlight undo customization
hi DiffAdd               ctermfg=28   ctermbg=NONE   cterm=NONE    guifg=#3cbc71  guibg=#383838 gui=NONE
hi DiffDelete            ctermfg=180  ctermbg=237    cterm=NONE    guifg=#fb091f  guibg=#383838 gui=NONE
hi DiffChange            ctermfg=180  ctermbg=237    cterm=NONE    guifg=#909090  guibg=#383838 gui=NONE
hi HighlightedyankRegion ctermfg=NONE ctermbg=NONE   cterm=NONE    guifg=#bdb76b  guibg=#383838 gui=NONE
"}}}

"easymotion {{{
hi EasyMotionMoveHLDefault    ctermfg=180 ctermbg=237   cterm=NONE guifg=#cd5c5c  guibg=NONE gui=NONE
hi EasyMotionIncSearchDefault ctermfg=180 ctermbg=237   cterm=NONE guifg=#cd5c5c  guibg=NONE gui=NONE
"}}}

" peekaboo {{{
hi peekabooTitle        ctermfg=180 ctermbg=237   cterm=NONE guifg=#00afdb  guibg=NONE    gui=bold,italic
hi peekabooTitleColon   ctermfg=180 ctermbg=237   cterm=NONE guifg=#808080  guibg=NONE    gui=bold
hi peekabooReg          ctermfg=180 ctermbg=237   cterm=NONE guifg=#fa2c77  guibg=NONE    gui=NONE
hi peekabooRegColon     ctermfg=180 ctermbg=237   cterm=NONE guifg=#808080  guibg=NONE    gui=bold
hi peekabooSelected     ctermfg=180 ctermbg=237   cterm=NONE guifg=#f4a460  guibg=#4c5870 gui=NONE
" }}}

" Startify {{{
hi StartifyNumber       ctermfg=60      ctermbg=NONE    cterm=NONE      guifg=#BF0075   guibg=NONE    gui=NONE
hi StartifySelect       ctermfg=NONE    ctermbg=235     cterm=NONE      guifg=NONE      guibg=#303030 gui=NONE
hi StartifyBracket      ctermfg=25      ctermbg=NONE    cterm=NONE      guifg=#cc9977   guibg=NONE    gui=NONE
hi StartifySpecial      ctermfg=132     ctermbg=NONE    cterm=NONE      guifg=#cd5c5c   guibg=NONE    gui=NONE
hi StartifyPath         ctermfg=96      ctermbg=NONE    cterm=NONE      guifg=#64648a   guibg=NONE    gui=NONE
hi StartifyFile         ctermfg=60      ctermbg=NONE    cterm=NONE      guifg=#1d8d77   guibg=NONE    gui=NONE
hi StartifySlash        ctermfg=103     ctermbg=NONE    cterm=bold      guifg=#897588   guibg=NONE    gui=NONE
hi StartifyHeader       ctermfg=60      ctermbg=NONE    cterm=NONE      guifg=#bb3e79   guibg=NONE    gui=NONE
hi StartifySection      ctermfg=142     ctermbg=NONE    cterm=NONE      guifg=#00afdb   guibg=NONE    gui=italic
hi StartifyFooter       ctermfg=6       ctermbg=NONE    cterm=NONE      guifg=#a0a0a0   guibg=NONE    gui=NONE
" }}}

" Ruby {{{
hi rubyClass                    ctermfg=212     ctermbg=NONE    cterm=NONE guifg=#ff79c6    guibg=NONE  gui=NONE
hi rubyFunction                 ctermfg=84      ctermbg=NONE    cterm=NONE guifg=#50fa7b    guibg=NONE  gui=NONE
hi rubyInterpolationDelimiter   ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=NONE       guibg=NONE  gui=NONE
hi rubySymbol                   ctermfg=141     ctermbg=NONE    cterm=NONE guifg=#bd93f9    guibg=NONE  gui=NONE
hi rubyConstant                 ctermfg=81      ctermbg=NONE    cterm=NONE guifg=#66d9ef    guibg=NONE  gui=NONE
hi rubyStringDelimiter          ctermfg=228     ctermbg=NONE    cterm=NONE guifg=#f1fa8c    guibg=NONE  gui=NONE
hi rubyBlockParameter           ctermfg=215     ctermbg=NONE    cterm=NONE guifg=#ffb86c    guibg=NONE  gui=NONE
hi rubyInstanceVariable         ctermfg=203     ctermbg=NONE    cterm=NONE guifg=#ffb86c    guibg=NONE  gui=NONE
hi rubyInclude                  ctermfg=212     ctermbg=NONE    cterm=NONE guifg=#ff79c6    guibg=NONE  gui=NONE
hi rubyGlobalVariable           ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=NONE       guibg=NONE  gui=NONE
hi rubyRegexp                   ctermfg=228     ctermbg=NONE    cterm=NONE guifg=#f1fa8c    guibg=NONE  gui=NONE
hi rubyRegexpDelimiter          ctermfg=228     ctermbg=NONE    cterm=NONE guifg=#f1fa8c    guibg=NONE  gui=NONE
hi rubyEscape                   ctermfg=141     ctermbg=NONE    cterm=NONE guifg=#bd93f9    guibg=NONE  gui=NONE
hi rubyControl                  ctermfg=212     ctermbg=NONE    cterm=NONE guifg=#ff79c6    guibg=NONE  gui=NONE
hi rubyClassVariable            ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=NONE       guibg=NONE  gui=NONE
hi rubyOperator                 ctermfg=212     ctermbg=NONE    cterm=NONE guifg=#ff79c6    guibg=NONE  gui=NONE
hi rubyException                ctermfg=212     ctermbg=NONE    cterm=NONE guifg=#ff79c6    guibg=NONE  gui=NONE
hi rubyPseudoVariable           ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=NONE       guibg=NONE  gui=NONE
hi rubyRailsUserClass           ctermfg=81      ctermbg=NONE    cterm=NONE guifg=#66d9ef    guibg=NONE  gui=NONE
hi rubyRailsARAssociationMethod ctermfg=117     ctermbg=NONE    cterm=NONE guifg=#8be9fd    guibg=NONE  gui=NONE
hi rubyRailsARMethod            ctermfg=117     ctermbg=NONE    cterm=NONE guifg=#8be9fd    guibg=NONE  gui=NONE
hi rubyRailsRenderMethod        ctermfg=117     ctermbg=NONE    cterm=NONE guifg=#8be9fd    guibg=NONE  gui=NONE
hi rubyRailsMethod              ctermfg=117     ctermbg=NONE    cterm=NONE guifg=#8be9fd    guibg=NONE  gui=NONE
"}}}

" eRuby {{{
hi erubyDelimiter       ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=NONE       guibg=NONE gui=NONE
hi erubyComment         ctermfg=61      ctermbg=NONE    cterm=NONE guifg=#6272a4    guibg=NONE gui=NONE
hi erubyRailsMethod     ctermfg=117     ctermbg=NONE    cterm=NONE guifg=#8be9fd    guibg=NONE gui=NONE
"}}}

" HTML {{{
hi htmlTag              ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=NONE       guibg=NONE gui=NONE
hi htmlEndTag           ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=NONE       guibg=NONE gui=NONE
hi htmlTagName          ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=#ff79c6    guibg=NONE gui=NONE
hi htmlArg              ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=#50fa7b    guibg=NONE gui=NONE
hi htmlSpecialChar      ctermfg=141     ctermbg=NONE    cterm=NONE guifg=#bd93f9    guibg=NONE gui=NONE
"}}}

" XML {{{
hi xmlTagName           ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=#bd93f9    guibg=NONE gui=NONE
hi xmlEndTag            ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=#bd93f9    guibg=NONE gui=NONE
" }}}

" Wilder {{{
hi WildMode             ctermfg=1     ctermbg=NONE    cterm=NONE guifg=#e0e0e0    guibg=#8F575A gui=italic
hi WildStatus           ctermfg=1     ctermbg=NONE    cterm=NONE guifg=#988C99    guibg=#153C63 gui=NONE
hi WilderSeparator      ctermfg=1     ctermbg=NONE    cterm=NONE guifg=#FA2C77    guibg=#153C63 gui=NONE
" }}}

" Java Script {{{
hi javaScriptFunction      ctermfg=117  ctermbg=NONE cterm=NONE
hi javaScriptRailsFunction ctermfg=117  ctermbg=NONE cterm=NONE
hi javaScriptBraces        ctermfg=NONE ctermbg=NONE cterm=NONE
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
hi TabLine              ctermfg=248     ctermbg=235     cterm=NONE      guifg=#666666   guibg=#282a36 gui=NONE
hi TabLineFill          ctermfg=246     ctermbg=235     cterm=NONE      guifg=#333333   guibg=#282a36 gui=NONE
hi TabLineSel           ctermfg=15      ctermbg=24      cterm=NONE      guifg=#eeeeee   guibg=#282a36 gui=NONE
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
hi vimVar               ctermfg=NONE    ctermbg=NONE    cterm=NONE guifg=#cccccc  guibg=NONE gui=NONE
hi vimHilight           ctermfg=132     ctermbg=NONE    cterm=NONE guifg=NONE     guibg=NONE gui=NONE
hi vimHiCterm           ctermfg=132     ctermbg=NONE    cterm=NONE guifg=NONE     guibg=NONE gui=NONE
hi vimHiGui             ctermfg=132     ctermbg=NONE    cterm=NONE guifg=#cccccc  guibg=NONE gui=NONE
hi vimLet               ctermfg=24      ctermbg=NONE    cterm=NONE guifg=#1b77e9  guibg=NONE gui=NONE
hi vimMap               ctermfg=24      ctermbg=NONE    cterm=NONE guifg=#5f9ea0  guibg=NONE gui=NONE
hi vimAutoCmd           ctermfg=12      ctermbg=NONE    cterm=NONE guifg=#1b77e9  guibg=NONE gui=NONE
hi vimMapModKey         ctermfg=132     ctermbg=NONE    cterm=NONE guifg=NONE     guibg=NONE gui=NONE
hi vimNotation          ctermfg=132     ctermbg=NONE    cterm=NONE guifg=NONE     guibg=NONE gui=NONE
hi vimCtrlChar          ctermfg=132     ctermbg=NONE    cterm=NONE guifg=#404040  guibg=NONE gui=NONE
hi vimIsCommand         ctermfg=132     ctermbg=NONE    cterm=NONE guifg=#bb3e79  guibg=NONE gui=NONE
hi vimFuncName          ctermfg=132     ctermbg=NONE    cterm=NONE guifg=#75828f  guibg=NONE gui=NONE
hi vimUserFunc          ctermfg=132     ctermbg=NONE    cterm=NONE guifg=#75828f  guibg=NONE gui=NONE
" }}}

" Markdown: {{{
hi markdownH1                 ctermfg=141     ctermbg=NONE    cterm=bold cterm=bold guifg=#bd93f9 guibg=NONE gui=bold
hi markdownH2                 ctermfg=141     ctermbg=NONE    cterm=bold cterm=bold guifg=#bd93f9 guibg=NONE gui=bold
hi markdownH3                 ctermfg=212     ctermbg=NONE    cterm=bold cterm=bold guifg=#bd93f9 guibg=NONE gui=bold
hi markdownH4                 ctermfg=212     ctermbg=NONE    cterm=bold cterm=bold guifg=#bd93f9 guibg=NONE gui=bold
hi markdownH5                 ctermfg=212     ctermbg=NONE    cterm=NONE cterm=NONE guifg=#ff79c6 guibg=NONE gui=NONE
hi markdownH6                 ctermfg=212     ctermbg=NONE    cterm=NONE cterm=NONE guifg=#ff79c6 guibg=NONE gui=NONE

hi markdownCode               ctermfg=228     ctermbg=NONE    cterm=NONE guifg=#f1fa8c guibg=NONE gui=NONE
hi markdownCodeBlock          ctermfg=228     ctermbg=NONE    cterm=NONE guifg=#f1fa8c guibg=NONE gui=NONE
hi markdownCodeDelimiter      ctermfg=228     ctermbg=NONE    cterm=NONE guifg=#f1fa8c guibg=NONE gui=NONE

hi markdownBlockquote         ctermfg=84      ctermbg=NONE    cterm=NONE guifg=#50fa7b guibg=NONE gui=NONE
hi markdownListMarker         ctermfg=84      ctermbg=NONE    cterm=NONE guifg=#50fa7b guibg=NONE gui=NONE
hi markdownOrderedListMarker  ctermfg=84      ctermbg=NONE    cterm=NONE guifg=#50fa7b guibg=NONE gui=NONE
hi markdownRule               ctermfg=84      ctermbg=NONE    cterm=NONE guifg=#50fa7b guibg=NONE gui=NONE
hi markdownHeadingRule        ctermfg=84      ctermbg=NONE    cterm=NONE guifg=#50fa7b guibg=NONE gui=NONE

hi markdownUrlDelimiter       ctermfg=215     ctermbg=NONE    cterm=NONE guifg=#ffb86c guibg=NONE gui=NONE
hi markdownLinkDelimiter      ctermfg=215     ctermbg=NONE    cterm=NONE guifg=#ffb86c guibg=NONE gui=NONE
hi markdownLinkTextDelimiter  ctermfg=215     ctermbg=NONE    cterm=NONE guifg=#ffb86c guibg=NONE gui=NONE

hi markdownHeadingDelimiter   ctermfg=117     ctermbg=NONE    cterm=bold guifg=#8be9fd guibg=NONE gui=bold
hi markdownUrl                ctermfg=141     ctermbg=NONE    cterm=NONE guifg=#bd93f9 guibg=NONE gui=NONE
hi markdownUrlTitleDelimiter  ctermfg=84      ctermbg=NONE    cterm=NONE guifg=#50fa7b guibg=NONE gui=NONE
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
