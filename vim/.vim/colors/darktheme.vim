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

" syntax match Operator "[-+&|<>=!\/~:*%&^?]"
" syn match Braces display '[{}()\[\]]'

hi Normal       ctermfg=7       ctermbg=233     cterm=NONE
hi ColorColumn  ctermfg=NONE    ctermbg=232     cterm=NONE
hi SignColumn   ctermfg=246     ctermbg=233     cterm=bold
hi Cursor       ctermfg=NONE    ctermbg=NONE    cterm=inverse,bold
hi Visual       ctermfg=NONE    ctermbg=237     cterm=NONE
hi CursorLine   ctermbg=235                     cterm=NONE
hi CursorColumn ctermbg=234                     cterm=NONE
hi LineNr       ctermfg=60      ctermbg=235     cterm=NONE
hi CursorLineNr ctermfg=251     ctermbg=89      cterm=NONE
hi VertSplit    ctermfg=60      ctermbg=NONE    cterm=NONE
hi MatchParen   ctermfg=126     ctermbg=NONE    cterm=underline,bold
hi ParenError   ctermfg=196     ctermbg=NONE    cterm=underline,bold
hi Braces       ctermfg=NONE    ctermbg=NONE    cterm=bold,underline
hi StatusLine   ctermfg=7       ctermbg=236     cterm=bold
hi StatusLineNC ctermfg=7       ctermbg=236     cterm=NONE
hi IncSearch    ctermfg=NONE    ctermbg=238     cterm=NONE
hi Search       ctermfg=7       ctermbg=238     cterm=NONE
hi ExtSearch    ctermfg=9       ctermbg=NONE    cterm=italic,underline
hi Directory    ctermfg=141     ctermbg=NONE    cterm=NONE
hi Folded       ctermfg=61      ctermbg=235     cterm=NONE
hi FoldColmun   ctermfg=246     ctermbg=235     cterm=NONE
hi Boolean      ctermfg=129     ctermbg=NONE    cterm=NONE
hi Character    ctermfg=64      ctermbg=NONE    cterm=NONE
hi Comment      ctermfg=242     ctermbg=NONE    cterm=italic
hi Conditional  ctermfg=25      ctermbg=NONE    cterm=italic
hi Constant     ctermfg=NONE    ctermbg=NONE    cterm=NONE
hi Define       ctermfg=66      ctermbg=NONE    cterm=NONE
hi ErrorMsg     ctermfg=7       ctermbg=212     cterm=NONE
hi WarningMsg   ctermfg=162     ctermbg=212     cterm=NONE
hi Float        ctermfg=141     ctermbg=NONE    cterm=NONE
hi Function     ctermfg=61      ctermbg=NONE    cterm=NONE
hi Identifier   ctermfg=246     ctermbg=NONE    cterm=NONE
hi Keyword      ctermfg=126     ctermbg=NONE    cterm=italic
hi Label        ctermfg=132     ctermbg=NONE    cterm=NONE
hi NonText      ctermfg=244     ctermbg=NONE    cterm=NONE
hi Number       ctermfg=180     ctermbg=NONE    cterm=NONE
hi Operator     ctermfg=62      ctermbg=NONE    cterm=bold
hi PreProc      ctermfg=31      ctermbg=NONE    cterm=NONE
hi Special      ctermfg=65      ctermbg=NONE    cterm=NONE
" hi SpecialKey         ctermfg=238     ctermbg=NONE    cterm=NONE
" hi Conceal    ctermfg=238     ctermbg=NONE    cterm=NONE
hi Statement    ctermfg=66      ctermbg=NONE    cterm=NONE
hi StorageClass ctermfg=54      ctermbg=NONE    cterm=NONE
hi String       ctermfg=60      ctermbg=NONE    cterm=italic
hi Tag          ctermfg=212     ctermbg=NONE    cterm=NONE
hi Title        ctermfg=7       ctermbg=NONE    cterm=bold
hi Todo         ctermfg=61      ctermbg=NONE    cterm=inverse,bold
hi level11      ctermfg=60      ctermbg=NONE    cterm=NONE
hi level12      ctermfg=5       ctermbg=NONE    cterm=NONE
hi level13      ctermfg=25      ctermbg=NONE    cterm=NONE
hi level14      ctermfg=125     ctermbg=NONE    cterm=NONE
hi level15      ctermfg=25      ctermbg=NONE    cterm=NONE
hi level16      ctermfg=7       ctermbg=NONE    cterm=NONE
hi Type         ctermfg=126     ctermbg=NONE    cterm=italic
hi Underlined   ctermfg=NONE    ctermbg=NONE    cterm=underline

" spelling {{{
hi SpellBad     ctermbg=NONE    cterm=underline
hi SpellCap     ctermbg=NONE    cterm=underline
hi SpellLocal   ctermbg=NONE    cterm=underline
hi SpellRare    ctermbg=NONE    cterm=underline
" }}}

" C/C++ {{{
hi c89Function          ctermfg=67      ctermbg=NONE    cterm=NONE
hi cCommentDelim        ctermfg=243     ctermbg=NONE    cterm=bold
hi cRepeat              ctermfg=95      ctermbg=NONE    cterm=NONE
hi cPPIncludeFile       ctermfg=60      ctermbg=NONE    cterm=NONE
hi cPPOperator          ctermfg=62      ctermbg=NONE    cterm=NONE
hi cInclude             ctermfg=66      ctermbg=NONE    cterm=NONE
hi cCommentError        ctermfg=240     ctermbg=NONE    cterm=italic
hi cGNUConstant         ctermfg=7       ctermbg=NONE    cterm=NONE
hi cCharacter           ctermfg=7       ctermbg=NONE    cterm=NONE
hi cBinaryOperator      ctermfg=12      ctermbg=NONE    cterm=NONE
hi cMathOperator        ctermfg=132     ctermbg=NONE    cterm=NONE
hi cLogicalOperator     ctermfg=93      ctermbg=NONE    cterm=NONE
hi cPointerOperator     ctermfg=60      ctermbg=NONE    cterm=bold
hi cStorageClass        ctermfg=66      ctermbg=NONE    cterm=NONE
hi cGNUStorageClass     ctermfg=66      ctermbg=NONE    cterm=NONE
hi cStructure           ctermfg=132     ctermbg=NONE    cterm=NONE
hi cType                ctermfg=25      ctermbg=NONE    cterm=italic
hi cConstant            ctermfg=96      ctermbg=NONE    cterm=NONE
hi cFloat               ctermfg=180     ctermbg=NONE    cterm=NONE
hi cOctalZero           ctermfg=180     ctermbg=NONE    cterm=NONE
hi c89Macro             ctermfg=66      ctermbg=NONE    cterm=NONE
" hi cBlock             ctermfg=172     ctermbg=NONE    cterm=italic
" }}}

" doxygen {{{
hi doxygenBrief         ctermfg=132     ctermbg=NONE    cterm=NONE
hi doxygenBOther        ctermfg=181     ctermbg=NONE    cterm=NONE
" hi doxygenStartSpecial        ctermfg=65      ctermbg=NONE    cterm=NONE
hi doxygenParam         ctermfg=181     ctermbg=NONE    cterm=NONE
hi doxygenParamName     ctermfg=65      ctermbg=NONE    cterm=italic
hi doxygenSpecialMultilineDesc  ctermfg=6       ctermbg=NONE    cterm=italic

" }}}

" dts-mode {{{
hi dtsCellProperty      ctermfg=66      ctermbg=NONE    cterm=NONE
" }}}

" gitconfig {{{
hi gitconfigVariable    ctermfg=62      ctermbg=NONE    cterm=NONE
hi gitconfigAssignment  ctermfg=7       ctermbg=NONE    cterm=NONE
hi gitconfigBoolean     ctermfg=60      ctermbg=NONE    cterm=italic

" }}}

" git-gutter {{{
hi GitGutterAdd         ctermfg=26      ctermbg=233     cterm=bold
hi GitGutterChange      ctermfg=180     ctermbg=233     cterm=bold
hi GitGutterDelete      ctermfg=196     ctermbg=233     cterm=bold
hi GitGutterChangeDelete ctermfg=94     ctermbg=233     cterm=bold
" }}}

" CtrlP {{{
hi CtrlPMatch           ctermfg=6       ctermbg=NONE    cterm=NONE
hi CtrlPPrtText         ctermfg=60      ctermbg=NONE    cterm=NONE
hi CtrlPLinePre         ctermfg=172     ctermbg=NONE    cterm=bold
" }}}

" Menu selection {{{
hi Pmenu                ctermfg=7       ctermbg=237     cterm=NONE
hi PmenuSel             ctermfg=253     ctermbg=24      cterm=NONE
hi PmenuSbar            ctermfg=NONE    ctermbg=NONE    cterm=NONE
hi PmenuThumb           ctermfg=NONE    ctermbg=NONE    cterm=NONE
"}}}

" GitCommit {{{
hi gitcommitComment             ctermfg=240     ctermbg=NONE    cterm=NONE
hi gitcommitOverflow            ctermfg=162     ctermbg=237     cterm=italic
hi gitcommitSummary             ctermfg=7       ctermbg=NONE    cterm=NONE
hi gitcommitBranch              ctermfg=180     ctermbg=NONE    cterm=NONE
hi gitcommitBlank               ctermfg=9       ctermbg=237     cterm=italic
hi gitcommitHeader              ctermfg=246     ctermbg=NONE    cterm=NONE
hi gitcommitDiff                ctermfg=245     ctermbg=NONE    cterm=NONE
hi gitcommitSelectedFile        ctermfg=66      ctermbg=NONE    cterm=NONE
hi gitcommitSelectedType        ctermfg=25      ctermbg=NONE    cterm=italic
hi gitcommitDiscardedFile       ctermfg=60      ctermbg=NONE    cterm=NONE
hi gitcommitDiscardedType       ctermfg=95      ctermbg=NONE    cterm=italic
" }}}

" Diff {{{
hi diffAdded            ctermfg=28      ctermbg=NONE    cterm=NONE
hi diffRemoved          ctermfg=161     ctermbg=NONE    cterm=NONE
hi diffChanged          ctermfg=65      ctermbg=NONE    cterm=NONE
hi diffText             ctermfg=7       ctermbg=NONE    cterm=NONE
hi diffFile             ctermfg=95      ctermbg=NONE    cterm=italic
hi diffLine             ctermfg=142     ctermbg=NONE    cterm=italic
hi diffIndexLine        ctermfg=127     ctermbg=NONE    cterm=italic
hi diffSubname          ctermfg=67      ctermbg=NONE    cterm=NONE
"}}}

" Startify {{{
hi StartifyNumber       ctermfg=60      ctermbg=NONE    cterm=NONE
hi StartifySelect       ctermfg=NONE    ctermbg=235     cterm=NONE
hi StartifyBracket      ctermfg=25      ctermbg=NONE    cterm=NONE
hi StartifySpecial      ctermfg=132     ctermbg=NONE    cterm=NONE
hi StartifyPath         ctermfg=7       ctermbg=NONE    cterm=NONE
hi StartifyFile         ctermfg=60      ctermbg=NONE    cterm=italic
hi StartifySlash        ctermfg=126     ctermbg=NONE    cterm=bold
hi StartifyHeader       ctermfg=60      ctermbg=NONE    cterm=NONE
hi StartifySection      ctermfg=142     ctermbg=NONE    cterm=bold
hi StartifyFooter       ctermfg=6       ctermbg=NONE    cterm=NONE
" }}}

" Ruby {{{
hi rubyClass                    ctermfg=212     ctermbg=NONE    cterm=NONE
hi rubyFunction                 ctermfg=84      ctermbg=NONE    cterm=NONE
hi rubyInterpolationDelimiter   ctermfg=NONE    ctermbg=NONE    cterm=NONE
hi rubySymbol                   ctermfg=141     ctermbg=NONE    cterm=NONE
hi rubyConstant                 ctermfg=81      ctermbg=NONE    cterm=NONE
hi rubyStringDelimiter          ctermfg=228     ctermbg=NONE    cterm=NONE
hi rubyBlockParameter           ctermfg=215     ctermbg=NONE    cterm=NONE
hi rubyInstanceVariable         ctermfg=203     ctermbg=NONE    cterm=NONE
hi rubyInclude                  ctermfg=212     ctermbg=NONE    cterm=NONE
hi rubyGlobalVariable           ctermfg=NONE    ctermbg=NONE    cterm=NONE
hi rubyRegexp                   ctermfg=228     ctermbg=NONE    cterm=NONE
hi rubyRegexpDelimiter          ctermfg=228     ctermbg=NONE    cterm=NONE
hi rubyEscape                   ctermfg=141     ctermbg=NONE    cterm=NONE
hi rubyControl                  ctermfg=212     ctermbg=NONE    cterm=NONE
hi rubyClassVariable            ctermfg=NONE    ctermbg=NONE    cterm=NONE
hi rubyOperator                 ctermfg=212     ctermbg=NONE    cterm=NONE
hi rubyException                ctermfg=212     ctermbg=NONE    cterm=NONE
hi rubyPseudoVariable           ctermfg=NONE    ctermbg=NONE    cterm=NONE
hi rubyRailsUserClass           ctermfg=81      ctermbg=NONE    cterm=NONE
hi rubyRailsARAssociationMethod ctermfg=117     ctermbg=NONE    cterm=NONE
hi rubyRailsARMethod            ctermfg=117     ctermbg=NONE    cterm=NONE
hi rubyRailsRenderMethod        ctermfg=117     ctermbg=NONE    cterm=NONE
hi rubyRailsMethod              ctermfg=117     ctermbg=NONE    cterm=NONE
"}}}

" eRuby {{{
hi erubyDelimiter       ctermfg=NONE    ctermbg=NONE    cterm=NONE
hi erubyComment         ctermfg=61      ctermbg=NONE    cterm=NONE
hi erubyRailsMethod     ctermfg=117     ctermbg=NONE    cterm=NONE
"}}}

" HTML {{{
hi htmlTag              ctermfg=NONE    ctermbg=NONE    cterm=NONE
hi htmlEndTag           ctermfg=NONE    ctermbg=NONE    cterm=NONE
hi htmlTagName          ctermfg=NONE    ctermbg=NONE    cterm=NONE
hi htmlArg              ctermfg=NONE    ctermbg=NONE    cterm=NONE
hi htmlSpecialChar      ctermfg=141     ctermbg=NONE    cterm=NONE
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
hi TabLine              ctermfg=248     ctermbg=235     cterm=NONE
hi TabLineFill          ctermfg=246     ctermbg=235     cterm=NONE
hi TabLineSel           ctermfg=15      ctermbg=24      cterm=italic
"}}}

" Elixir {{{
hi elixirAtom                   ctermfg=81      ctermbg=NONE    cterm=NONE
hi elixirModuleDeclaration      ctermfg=81      ctermbg=NONE    cterm=NONE
hi elixirAlias                  ctermfg=81      ctermbg=NONE    cterm=NONE
hi elixirInterpolationDelimiter ctermfg=84      ctermbg=NONE    cterm=NONE
hi elixirStringDelimiter        ctermfg=228     ctermbg=NONE    cterm=NONE
"}}}

" Vim Script {{{
hi vimGroupName         ctermfg=67      ctermbg=NONE    cterm=NONE
hi vimGroup             ctermfg=67      ctermbg=NONE    cterm=NONE
hi vimOption            ctermfg=68      ctermbg=NONE    cterm=NONE
hi vimHiCtermFgBg       ctermfg=132     ctermbg=NONE    cterm=NONE
hi vimHiGuiFgBg         ctermfg=NONE    ctermbg=NONE    cterm=NONE
hi vimHilight           ctermfg=132     ctermbg=NONE    cterm=NONE
hi vimHiCterm           ctermfg=132     ctermbg=NONE    cterm=NONE
hi vimLet               ctermfg=24      ctermbg=NONE    cterm=NONE
" hi vimHighlight               ctermfg=12      ctermbg=NONE    cterm=NONE
hi vimAutoCmd           ctermfg=12      ctermbg=NONE    cterm=NONE
hi vimMapModKey         ctermfg=132     ctermbg=NONE    cterm=NONE
hi vimNotation          ctermfg=132     ctermbg=NONE    cterm=NONE
" }}}

" Markdown: {{{
hi markdownH1           ctermfg=141     ctermbg=NONE    cterm=bold
hi markdownH2           ctermfg=141     ctermbg=NONE    cterm=bold
hi markdownH3           ctermfg=212     ctermbg=NONE    cterm=bold
hi markdownH4           ctermfg=212     ctermbg=NONE    cterm=bold
hi markdownH5           ctermfg=212     ctermbg=NONE    cterm=NONE
hi markdownH6           ctermfg=212     ctermbg=NONE    cterm=NONE

hi markdownCode         ctermfg=228     ctermbg=NONE    cterm=NONE
hi markdownCodeBlock    ctermfg=228     ctermbg=NONE    cterm=NONE
hi markdownCodeDelimiter ctermfg=228    ctermbg=NONE    cterm=NONE

hi markdownBlockquote   ctermfg=84      ctermbg=NONE    cterm=NONE
hi markdownListMarker   ctermfg=84      ctermbg=NONE    cterm=NONE
hi markdownOrderedListMarker ctermfg=84 ctermbg=NONE    cterm=NONE
hi markdownRule         ctermfg=84      ctermbg=NONE    cterm=NONE
hi markdownHeadingRule  ctermfg=84      ctermbg=NONE    cterm=NONE

hi markdownUrlDelimiter ctermfg=215     ctermbg=NONE    cterm=NONE
hi markdownLinkDelimiter ctermfg=215    ctermbg=NONE    cterm=NONE
hi markdownLinkTextDelimiter ctermfg=215 ctermbg=NONE   cterm=NONE

hi markdownHeadingDelimiter ctermfg=117 ctermbg=NONE    cterm=bold
hi markdownUrl          ctermfg=141     ctermbg=NONE    cterm=NONE
hi markdownUrlTitleDelimiter ctermfg=84 ctermbg=NONE    cterm=NONE
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
