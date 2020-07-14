" Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
" Copyright (C) 2016-present Sven Greb <development@svengreb.de>

" Project: Nord Vim
" Repository: https://github.com/arcticicestudio/nord-vim
" License: MIT

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "nord"
let s:nord_vim_version="0.15.0"
set background=dark

let s:nord0_gui = "#2E3440"
let s:nord1_gui = "#3B4252"
let s:nord2_gui = "#434C5E"
let s:nord3_gui = "#4C566A"
let s:nord3_gui_bright = "#616E88"
let s:nord4_gui = "#D8DEE9"
let s:nord5_gui = "#E5E9F0"
let s:nord6_gui = "#ECEFF4"
let s:nord7_gui = "#8FBCBB"
let s:nord8_gui = "#88C0D0"
let s:nord9_gui = "#81A1C1"
let s:nord10_gui = "#5E81AC"
let s:nord11_gui = "#BF616A"
let s:nord12_gui = "#D08770"
let s:nord13_gui = "#EBCB8B"
let s:nord14_gui = "#A3BE8C"
let s:nord15_gui = "#B48EAD"

let s:nord1_term = "0"
let s:nord3_term = "8"
let s:nord5_term = "7"
let s:nord6_term = "15"
let s:nord7_term = "14"
let s:nord8_term = "6"
let s:nord9_term = "4"
let s:nord10_term = "12"
let s:nord11_term = "1"
let s:nord12_term = "11"
let s:nord13_term = "3"
let s:nord14_term = "2"
let s:nord15_term = "5"

let s:nord3_gui_brightened = [
  \ s:nord3_gui,
  \ "#4e586d",
  \ "#505b70",
  \ "#525d73",
  \ "#556076",
  \ "#576279",
  \ "#59647c",
  \ "#5b677f",
  \ "#5d6982",
  \ "#5f6c85",
  \ "#616e88",
  \ "#63718b",
  \ "#66738e",
  \ "#687591",
  \ "#6a7894",
  \ "#6d7a96",
  \ "#6f7d98",
  \ "#72809a",
  \ "#75829c",
  \ "#78859e",
  \ "#7b88a1",
\ ]

if !exists("g:nord_bold")
  let g:nord_bold = 1
endif

let s:bold = "bold,"
if g:nord_bold == 0
  let s:bold = ""
endif

if !exists("g:nord_italic")
  if has("gui_running") || $TERM_ITALICS == "true"
    let g:nord_italic = 1
  else
    let g:nord_italic = 0
  endif
endif

let s:italic = "italic,"
if g:nord_italic == 0
  let s:italic = ""
endif

let s:underline = "underline,"
if ! get(g:, "nord_underline", 1)
  let s:underline = "NONE,"
endif

let s:italicize_comments = ""
if exists("g:nord_italic_comments")
  if g:nord_italic_comments == 1
    let s:italicize_comments = s:italic
  endif
endif

if !exists('g:nord_uniform_status_lines')
  let g:nord_uniform_status_lines = 0
endif

function! s:logWarning(msg)
  echohl WarningMsg
  echomsg 'nord: warning: ' . a:msg
  echohl None
endfunction

if exists("g:nord_comment_brightness")
  call s:logWarning('Variable g:nord_comment_brightness has been deprecated and will be removed in version 1.0.0!' .
                   \' The comment color brightness has been increased by 10% by default.' .
                   \' Please see https://github.com/arcticicestudio/nord-vim/issues/145 for more details.')
  let g:nord_comment_brightness = 10
endif

if !exists("g:nord_uniform_diff_background")
  let g:nord_uniform_diff_background = 0
endif

if !exists("g:nord_cursor_line_number_background")
  let g:nord_cursor_line_number_background = 0
endif

if !exists("g:nord_bold_vertical_split_line")
  let g:nord_bold_vertical_split_line = 0
endif

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", "", "", s:bold, "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", s:underline, "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:nord1_gui, "NONE", s:nord1_term, "", "")
call s:hi("Cursor", s:nord0_gui, s:nord4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
call s:hi("TSError", s:nord4_gui, s:nord11_gui, "", s:nord11_term, "", "")
call s:hi("iCursor", s:nord0_gui, s:nord4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:nord3_gui, "NONE", s:nord3_term, "NONE", "", "")
call s:hi("MatchParen", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "", "")
call s:hi("NonText", s:nord2_gui, "", s:nord3_term, "", "", "")
call s:hi("Normal", s:nord4_gui, s:nord0_gui, "NONE", "NONE", "", "")
call s:hi("PMenu", s:nord4_gui, s:nord2_gui, "NONE", s:nord1_term, "NONE", "")
call s:hi("PmenuSbar", s:nord4_gui, s:nord2_gui, "NONE", s:nord1_term, "", "")
call s:hi("PMenuSel", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "", "")
call s:hi("PmenuThumb", s:nord8_gui, s:nord3_gui, "NONE", s:nord3_term, "", "")
call s:hi("SpecialKey", s:nord3_gui, "", s:nord3_term, "", "", "")
call s:hi("SpellBad", s:nord11_gui, s:nord0_gui, s:nord11_term, "NONE", "undercurl", s:nord11_gui)
call s:hi("SpellCap", s:nord13_gui, s:nord0_gui, s:nord13_term, "NONE", "undercurl", s:nord13_gui)
call s:hi("SpellLocal", s:nord5_gui, s:nord0_gui, s:nord5_term, "NONE", "undercurl", s:nord5_gui)
call s:hi("SpellRare", s:nord6_gui, s:nord0_gui, s:nord6_term, "NONE", "undercurl", s:nord6_gui)
call s:hi("Visual", "", s:nord2_gui, "", s:nord1_term, "", "")
call s:hi("VisualNOS", "", s:nord2_gui, "", s:nord1_term, "", "")
"+- Neovim Support -+
call s:hi("healthError", s:nord11_gui, s:nord1_gui, s:nord11_term, s:nord1_term, "", "")
call s:hi("healthSuccess", s:nord14_gui, s:nord1_gui, s:nord14_term, s:nord1_term, "", "")
call s:hi("healthWarning", s:nord13_gui, s:nord1_gui, s:nord13_term, s:nord1_term, "", "")
call s:hi("TermCursorNC", "", s:nord1_gui, "", s:nord1_term, "", "")

"+- Vim 8 Terminal Colors -+
if has('terminal')
  let g:terminal_ansi_colors = [s:nord1_gui, s:nord11_gui, s:nord14_gui, s:nord13_gui, s:nord9_gui, s:nord15_gui, s:nord8_gui, s:nord5_gui, s:nord3_gui, s:nord11_gui, s:nord14_gui, s:nord13_gui, s:nord9_gui, s:nord15_gui, s:nord7_gui, s:nord6_gui]
endif

"+- Neovim Terminal Colors -+
if has('nvim')
  let g:terminal_color_0 = s:nord1_gui
  let g:terminal_color_1 = s:nord11_gui
  let g:terminal_color_2 = s:nord14_gui
  let g:terminal_color_3 = s:nord13_gui
  let g:terminal_color_4 = s:nord9_gui
  let g:terminal_color_5 = s:nord15_gui
  let g:terminal_color_6 = s:nord8_gui
  let g:terminal_color_7 = s:nord5_gui
  let g:terminal_color_8 = s:nord3_gui
  let g:terminal_color_9 = s:nord11_gui
  let g:terminal_color_10 = s:nord14_gui
  let g:terminal_color_11 = s:nord13_gui
  let g:terminal_color_12 = s:nord9_gui
  let g:terminal_color_13 = s:nord15_gui
  let g:terminal_color_14 = s:nord7_gui
  let g:terminal_color_15 = s:nord6_gui
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:nord1_gui, "NONE", s:nord1_term, "", "")
if g:nord_cursor_line_number_background == 0
  call s:hi("CursorLineNr", s:nord4_gui, "", "NONE", "", "NONE", "")
else
  call s:hi("CursorLineNr", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
endif
call s:hi("Folded", s:nord3_gui, s:nord1_gui, s:nord3_term, s:nord1_term, s:bold, "")
call s:hi("FoldColumn", s:nord3_gui, s:nord0_gui, s:nord3_term, "NONE", "", "")
call s:hi("SignColumn", s:nord1_gui, s:nord0_gui, s:nord1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:nord8_gui, "", s:nord8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:nord1_gui, "", s:nord1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:nord4_gui, s:nord11_gui, "NONE", s:nord11_term, "", "")
call s:hi("ModeMsg", s:nord4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("Question", s:nord4_gui, "", "NONE", "", "", "")
if g:nord_uniform_status_lines == 0
  call s:hi("StatusLine", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
  call s:hi("StatusLineNC", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
  call s:hi("StatusLineTerm", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
else
  call s:hi("StatusLine", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
  call s:hi("StatusLineNC", s:nord4_gui, s:nord3_gui, "NONE", s:nord3_term, "NONE", "")
  call s:hi("StatusLineTerm", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:nord4_gui, s:nord3_gui, "NONE", s:nord3_term, "NONE", "")
endif
call s:hi("WarningMsg", s:nord0_gui, s:nord13_gui, s:nord1_term, s:nord13_term, "", "")
call s:hi("WildMenu", s:nord8_gui, s:nord1_gui, s:nord8_term, s:nord1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:nord6_gui, s:nord10_gui, s:nord6_term, s:nord10_term, s:underline, "")
call s:hi("Search", s:nord1_gui, s:nord8_gui, s:nord1_term, s:nord8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
call s:hi("TabLineFill", s:nord4_gui, s:nord1_gui, "NONE", s:nord1_term, "NONE", "")
call s:hi("TabLineSel", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:nord4_gui, "", "NONE", "", "NONE", "")

if g:nord_bold_vertical_split_line == 0
  call s:hi("VertSplit", s:nord2_gui, s:nord0_gui, s:nord3_term, "NONE", "NONE", "")
else
  call s:hi("VertSplit", s:nord2_gui, s:nord1_gui, s:nord3_term, s:nord1_term, "NONE", "")
endif

"+----------------------+
"+ Language Base Groups +
"+----------------------+

call s:hi("TSConditional", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("TSPunctDelimiter", s:nord6_gui, "", s:nord6_term, "", "", "")
call s:hi("TSException", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("TSFunction", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("TSKeyword", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("TSLabel", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("TSOperator", s:nord9_gui, "", s:nord9_term, "", "NONE", "")
call s:hi("TSIdentifier", s:nord4_gui, "", "NONE", "", "NONE", "")
call s:hi("TSRepeat", s:nord9_gui, "", s:nord9_term, "", "", "")
" Constants
call s:hi("TSConstant", s:nord4_gui, "", "NONE", "", "", "")
call s:hi("TSConstBuiltin", s:nord4_gui, "", "NONE", "", "", "")
call s:hi("TSConstMacro", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("TSString", s:nord14_gui, "", s:nord14_term, "", "", "")
call s:hi("TSStringRegex", s:nord14_gui, "", s:nord14_term, "", "", "")
call s:hi("TSStringEscape", s:nord14_gui, "", s:nord14_term, "", "", "")
call s:hi("TSNumber", s:nord15_gui, "", s:nord15_term, "", "", "")
call s:hi("TSBoolean", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("TSCharacter", s:nord14_gui, "", s:nord14_term, "", "", "")
call s:hi("TSFloat", s:nord15_gui, "", s:nord15_term, "", "", "")
" Comment
call s:hi("Comment", s:nord3_gui_bright, "", s:nord3_term, "", s:italicize_comments, "")
call s:hi("TSStructure", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("TSType", s:nord9_gui, "", s:nord9_term, "", "NONE", "")
call s:hi("TSTypeBuiltin", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("TSInclude", s:nord9_gui, "", s:nord9_term, "", "", "")
hi! link TSPunctBracket TSPunctDelimiter
hi! link TSPunctSpecial TSPunctDelimiter
hi! link TSFuncBuiltin TSFunction
hi! link TSFuncMacro   TSFunction
hi! link TSMethod TSIdentifier
hi! link TSProperty TSIdentifier
hi! link TSField Normal
hi! link TSConstructor TSIdentifier
"+-----------+
"+ Languages +
"+-----------+
call s:hi("asciidocAttributeEntry", s:nord10_gui, "", s:nord10_term, "", "", "")
call s:hi("asciidocAttributeList", s:nord10_gui, "", s:nord10_term, "", "", "")
call s:hi("asciidocAttributeRef", s:nord10_gui, "", s:nord10_term, "", "", "")
call s:hi("asciidocHLabel", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("asciidocListingBlock", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("asciidocMacroAttributes", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("asciidocOneLineTitle", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("asciidocPassthroughBlock", s:nord9_gui, "", s:nord9_term, "", "", "")
call s:hi("asciidocQuotedMonospaced", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("asciidocTriplePlusPassthrough", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link asciidocAdmonition TSKeyword
hi! link asciidocAttributeRef markdownH1
hi! link asciidocBackslash TSKeyword
hi! link asciidocMacro TSKeyword
hi! link asciidocQuotedBold Bold
hi! link asciidocQuotedEmphasized Italic
hi! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
hi! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
hi! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
hi! link asciidocURL markdownLinkText

call s:hi("awkCharClass", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("awkPatterns", s:nord9_gui, "", s:nord9_term, "", s:bold, "")
hi! link awkArrayElement TSIdentifier
hi! link awkBoolLogic TSKeyword
hi! link awkBrktRegExp TSCharacter
hi! link awkComma TSPunctDelimiter
hi! link awkExpression TSKeyword
hi! link awkFieldVars TSIdentifier
hi! link awkLineSkip TSKeyword
hi! link awkOperator TSOperator
hi! link awkRegExp TSCharacter
hi! link awkSearch TSKeyword
hi! link awkSemicolon TSPunctDelimiter
hi! link awkSpecialCharacter TSCharacter
hi! link awkSpecialPrintf TSCharacter
hi! link awkVariables TSIdentifier

call s:hi("dosiniHeader", s:nord8_gui, "", s:nord8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("dtExecKey", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("dtLocaleKey", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("dtNumericKey", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("dtTypeKey", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link dtDelim TSPunctDelimiter
hi! link dtLocaleValue TSKeyword
hi! link dtTypeValue TSKeyword

if g:nord_uniform_diff_background == 0
  call s:hi("DiffAdd", s:nord14_gui, s:nord0_gui, s:nord14_term, "NONE", "inverse", "")
  call s:hi("DiffChange", s:nord13_gui, s:nord0_gui, s:nord13_term, "NONE", "inverse", "")
  call s:hi("DiffDelete", s:nord11_gui, s:nord0_gui, s:nord11_term, "NONE", "inverse", "")
  call s:hi("DiffText", s:nord9_gui, s:nord0_gui, s:nord9_term, "NONE", "inverse", "")
else
  call s:hi("DiffAdd", s:nord14_gui, s:nord1_gui, s:nord14_term, s:nord1_term, "", "")
  call s:hi("DiffChange", s:nord13_gui, s:nord1_gui, s:nord13_term, s:nord1_term, "", "")
  call s:hi("DiffDelete", s:nord11_gui, s:nord1_gui, s:nord11_term, s:nord1_term, "", "")
  call s:hi("DiffText", s:nord9_gui, s:nord1_gui, s:nord9_term, s:nord1_term, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:nord7_gui, "", s:nord7_term, "", "", "")

call s:hi("goBuiltins", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link goConstants TSKeyword

call s:hi("helpBar", s:nord3_gui, "", s:nord3_term, "", "", "")
call s:hi("helpHyperTextJump", s:nord8_gui, "", s:nord8_term, "", s:underline, "")

call s:hi("htmlArg", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("htmlLink", s:nord4_gui, "", "", "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar TSCharacter
hi! link htmlTag TSKeyword
hi! link htmlTagN htmlTag

call s:hi("jsonTSKeyword", s:nord7_gui, "", s:nord7_term, "", "", "")

call s:hi("markdownBlockquote", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownCode", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownFootnote", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownId", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("markdownH1", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("markdownLinkText", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("markdownUrl", s:nord4_gui, "", "NONE", "", "NONE", "")
hi! link markdownBold Bold
hi! link markdownBoldDelimiter TSKeyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter TSKeyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter TSKeyword
hi! link markdownLinkDelimiter TSKeyword
hi! link markdownLinkTextDelimiter TSKeyword
hi! link markdownListMarker TSKeyword
hi! link markdownRule TSKeyword
hi! link markdownHeadingDelimiter TSKeyword

call s:hi("perlPackageDecl", s:nord7_gui, "", s:nord7_term, "", "", "")

call s:hi("podCmdText", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("podVerbatimLine", s:nord4_gui, "", "NONE", "", "", "")
hi! link podFormat TSKeyword

call s:hi("vimAugroup", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("vimMapRhs", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("vimNotation", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link vimFunc TSFunction
hi! link vimFunction TSFunction
hi! link vimUserFunc TSFunction

call s:hi("xmlAttrib", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("xmlCdataStart", s:nord3_gui_bright, "", s:nord3_term, "", s:bold, "")
call s:hi("xmlNamespace", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim TSKeyword
hi! link xmlTagName TSKeyword

call s:hi("yamlBlockMappingKey", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link yamlBool TSKeyword
hi! link yamlDocumentStart TSKeyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:nord13_gui, "", s:nord13_term, "", "", "")
call s:hi("ALEErrorSign" , s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("ALEWarning" , s:nord13_gui, "", s:nord13_term, "", "undercurl", "")
call s:hi("ALEError" , s:nord11_gui, "", s:nord11_term, "", "undercurl", "")

" Coc
" > neoclide/coc
call s:hi("CocWarningSign", s:nord13_gui, "", s:nord13_term, "", "", "")
call s:hi("CocErrorSign" , s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("CocInfoSign" , s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("CocHintSign" , s:nord10_gui, "", s:nord10_term, "", "", "")

" Nvim LSP
" > neovim/nvim-lsp
call s:hi("LSPDiagnosticsWarning", s:nord13_gui, "", s:nord13_term, "", "", "")
call s:hi("LSPDiagnosticsError" , s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("LSPDiagnosticsInformation" , s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("LSPDiagnosticsHint" , s:nord10_gui, "", s:nord10_term, "", "", "")

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:nord14_gui, "", s:nord14_term, "", "", "")
call s:hi("GitGutterChange", s:nord13_gui, "", s:nord13_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("GitGutterDelete", s:nord11_gui, "", s:nord11_term, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", s:nord14_gui, "", s:nord14_term, "", "", "")
call s:hi("SignifySignChange", s:nord13_gui, "", s:nord13_term, "", "", "")
call s:hi("SignifySignChangeDelete", s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("SignifySignDelete", s:nord11_gui, "", s:nord11_term, "", "", "")

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:nord11_gui, "", s:nord11_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:nord14_gui, "", s:nord14_term, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:nord4_gui, s:nord3_gui, "", s:nord3_term, "", "")
call s:hi("jediFat", s:nord8_gui, s:nord3_gui, s:nord8_term, s:nord3_term, s:underline.s:bold, "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:nord7_gui, "", s:nord7_term, "", "", "")
hi! link NERDTreeDirSlash TSKeyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch TSKeyword
hi! link CtrlPBufferHid Normal

" vim-clap
" > liuchengxu/vim-clap
call s:hi("ClapDir", s:nord4_gui, "", "", "", "", "")
call s:hi("ClapDisplay", s:nord4_gui, s:nord1_gui, "", s:nord1_term, "", "")
call s:hi("ClapFile", s:nord4_gui, "", "", "NONE", "", "")
call s:hi("ClapMatches", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("ClapNoMatchesFound", s:nord13_gui, "", s:nord13_term, "", "", "")
call s:hi("ClapSelected", s:nord7_gui, "", s:nord7_term, "", s:bold, "")
call s:hi("ClapSelectedSign", s:nord9_gui, "", s:nord9_term, "", "", "")

let s:clap_matches = [
        \ [s:nord8_gui,  s:nord8_term] ,
        \ [s:nord9_gui,  s:nord9_term] ,
        \ [s:nord10_gui, s:nord10_term] ,
        \ ]
for s:nord_clap_match_i in range(1,12)
  let clap_match_color = s:clap_matches[s:nord_clap_match_i % len(s:clap_matches) - 1]
  call s:hi("ClapMatches" . s:nord_clap_match_i, clap_match_color[0], "", clap_match_color[1], "", "", "")
  call s:hi("ClapFuzzyMatches" . s:nord_clap_match_i, clap_match_color[0], "", clap_match_color[1], "", "", "")
endfor
unlet s:nord_clap_match_i

hi! link ClapCurrentSelection PmenuSel
hi! link ClapCurrentSelectionSign ClapSelectedSign
hi! link ClapInput Pmenu
hi! link ClapPreview Pmenu
hi! link ClapProviderAbout ClapDisplay
hi! link ClapProviderColon TSType
hi! link ClapProviderId TSType

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:nord11_gui, "", "", s:nord11_term, "", "")

" vim-signature
" > kshenoy/vim-signature
call s:hi("SignatureMarkText", s:nord8_gui, "", s:nord8_term, "", "", "")

" vim-startify
" > mhinz/vim-startify
call s:hi("StartifyFile", s:nord6_gui, "", s:nord6_term, "", "", "")
call s:hi("StartifyFooter", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("StartifyHeader", s:nord8_gui, "", s:nord8_term, "", "", "")
call s:hi("StartifyNumber", s:nord7_gui, "", s:nord7_term, "", "", "")
call s:hi("StartifyPath", s:nord8_gui, "", s:nord8_term, "", "", "")
hi! link StartifyBracket TSDelimiter
hi! link StartifySlash Normal
hi! link StartifySpecial Comment

"+--- Languages ---+
" Vimwiki
" > vimwiki/vimwiki
if !exists("g:vimwiki_hl_headers") || g:vimwiki_hl_headers == 0
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:nord8_gui, "", s:nord8_term, "", s:bold, "")
  endfor
else
  let s:vimwiki_hcolor_guifg = [s:nord7_gui, s:nord8_gui, s:nord9_gui, s:nord10_gui, s:nord14_gui, s:nord15_gui]
  let s:vimwiki_hcolor_ctermfg = [s:nord7_term, s:nord8_term, s:nord9_term, s:nord10_term, s:nord14_term, s:nord15_term]
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:vimwiki_hcolor_guifg[s:i-1] , "", s:vimwiki_hcolor_ctermfg[s:i-1], "", s:bold, "")
  endfor
endif

call s:hi("VimwikiLink", s:nord8_gui, "", s:nord8_term, "", s:underline, "")
hi! link VimwikiHeaderChar markdownHeadingDelimiter
hi! link VimwikiHR TSKeyword
hi! link VimwikiList markdownListMarker

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:nord7_gui, "", s:nord7_term, "", "", "")
