" Vim color file -- with 8 colour support!
"
" Author: (c) 2016 Ryo Shimamura
"
" Note: This file may be free distributed under the MIT licence.
"       https://github.com/shimamu/vim-colors

set background=light

if version > 580
    hi clear
    if exists('syntax_on')
        syntax reset
    endif
endif

let colors_name = 'ithd'

let s:black  = '0'
let s:red    = '1'
let s:green  = '2'
let s:yellow = '3'
let s:blue   = '4'
let s:puple  = '5'
let s:egreen = '6'
let s:white  = '7'
let s:undef  = '-'

let s:text     = '#4d4d4d'
let s:base     = '#ffffff'
let s:main     = '#12b3c7'
let s:main_n   = '#0e8d9e'
let s:main_l   = '#daf3f6'
let s:accent   = '#d74c77'
let s:accent_l = '#f7d9e2'
let s:gray     = '#bbbbbb'
let s:gray_n   = '#ececec'
let s:gray_l   = '#f5f5f5'
let s:mark     = '#dddddd'
let s:find     = '#ffff99'

fun! s:HL(group, cfg, cbg, cop, gfg, gbg, gop, ...) " ... optional dictionary of attributes
    execute 'hi!' a:group 
        \ a:cfg != s:undef ? 'ctermfg='.a:cfg : ""
        \ a:cbg != s:undef ? 'ctermbg='.a:cbg : ""
        \ a:cop != s:undef ? 'cterm='.a:cop : ""
        \ a:gfg != s:undef ? 'guifg='.a:gfg : ""
        \ a:gbg != s:undef ? 'guibg='.a:gbg : ""
        \ a:gop != s:undef ? 'gui='.a:gop : ""
        \ 'guisp='.(a:0>0?get(a:1,'guisp','NONE'):'NONE')
endf

" {{{ General colors
call s:HL('Normal',       s:white,  s:black,  'none', s:text,   s:base,   'none')
call s:HL('Cursor',       s:black,  s:white,  'none', s:base,   s:text,   'none')
call s:HL('Visual',       s:black,  s:white,  'none', s:base,   s:main,   'none')
call s:HL('VisualNOS',    s:black,  s:white,  'none', s:base,   s:main,   'none')
call s:HL('Search',       s:black,  s:yellow, 'none', s:text,   s:find,   'none')
call s:HL('Folded',       s:black,  s:white,  'none', s:text,   s:gray_n, 'bold')
call s:HL('Title',        s:red,    s:black,  'bold', s:accent, s:base,   'bold')
call s:HL('StatusLine',   s:black,  s:white,  'bold', s:base,   s:main,   'none')
call s:HL('StatusLineNC', s:black,  s:white,  'none', s:text,   s:main_l, 'italic')
call s:HL('VertSplit',    s:white,  s:white,  'none', s:gray,   s:gray,   'none')
call s:HL('LineNr',       s:white,  s:black,  'bold', s:text,   s:main_l, 'bold')
" 'SpecialKey' is for tab, trail    .
call s:HL('SpecialKey',   s:blue,   s:black,  'none', s:mark,   s:base,   'none')
" 'NonText' is for eol.
call s:HL('NonText',      s:blue,   s:black,  'none', s:mark,   s:base,   'none')
call s:HL('WarningMsg',   s:red,    s:black,  'bold', s:accent, s:base,   'undercurl')
call s:HL('ErrorMsg',     s:white,  s:red,    'none', s:base,   s:accent, 'none')
" }}}

" {{{ Vim => 7.0 specific colors
if version >= 700
    call s:HL('CursorLine',   s:undef, s:undef,  'none', 'NONE',  'NONE',   'none')
    call s:HL('CursorLineNr', s:black, s:white,  'none', s:base,  s:main,   'bold')
    call s:HL('MatchParen',   s:black, s:yellow, 'none', s:base,  s:main,   'none')
    call s:HL('Pmenu',        s:black, s:white,  'none', s:text,  s:main_l, 'none')
    call s:HL('PmenuSel',     s:black, s:egreen, 'none', s:base,  s:main,   'bold')
    call s:HL('PmenuSbar',    s:undef, s:white,  'none', s:gray,  s:gray,   'none')
    call s:HL('PmenuThumb',   s:undef, s:blue,   'none', s:main,  s:main,   'none')
endif
" }}}

" {{{ Diff highlighting
    call s:HL('DiffAdd',    s:white, s:blue,   'none', s:base,  s:main,     'none')
    call s:HL('DiffChange', s:black, s:yellow, 'none', s:text,  s:accent_l, 'none')
    call s:HL('DiffText',   s:white, s:red,    'none', s:base,  s:accent,   'none')
    call s:HL('DiffDelete', s:black, s:white,  'none', s:text,  s:main_l,   'none')
" }}}

" {{{ Syntax highlighting
call s:HL('Ignore',       s:black,  s:undef, 'bold',      s:base,   s:undef,    'bold')
call s:HL('Identifier',   s:white,  s:black, 'bold',      s:text,   s:base,     'bold')
" 'PreProc' is for '#include'
call s:HL('PreProc',      s:white,  s:black, 'bold',      s:main,   s:base,     'none')
call s:HL('Comment',      s:green,  s:black, 'none',      s:gray,   s:base,     'italic')
" 'Constant' is for 'true', 'false' ...
call s:HL('Constant',     s:yellow, s:black, 'none',      s:main,   s:base,     'underline')
call s:HL('String',       s:red,    s:black, 'none',      s:accent, s:base,     'none')
" 'Function' is for function name.
call s:HL('Function',     s:white,  s:black, 'none',      s:main_n, s:base,     'none')
" 'Statement' is for 'if', 'return', '+', '=' ...
call s:HL('Statement',    s:white,  s:black, 'bold',      s:main,   s:base,     'none')
" 'Type' is for function
call s:HL('Type',         s:white,  s:black, 'bold',      s:main_n, s:base,     'bold')
call s:HL('Number',       s:red,    s:black, 'underline', s:accent, s:base,     'underline')
" 'Special' is function call or 'this'
call s:HL('Special',      s:puple,  s:undef, 'none',      s:main,   s:undef,    'none')
call s:HL('Todo',         s:yellow, s:black, 'none',      s:accent, s:accent_l, 'none')
call s:HL('Label',        s:yellow, s:black, 'bold',      s:text,   s:accent_l, 'bold')
" 'StorageClass' is for 'var'
call s:HL('StorageClass', s:white,  s:undef, 'bold',      s:main,   s:base,     'none')
" 'Structure' is for 'struct', 'typedef'
call s:HL('Structure',    s:white,  s:undef, 'bold',      s:main_n, s:base,     'bold')
" }}}

" {{{ Links
hi! link FoldColumn   Folded
hi! link CursorColumn CursorLine
"hi! link NonText    LineNr
" }}}

" {{{ Aliases
hi link cppSTL          Function
hi link cppSTLType      Type
hi link Character       Number
hi link htmlTag         htmlEndTag
hi link htmlLink        Underlined
hi link pythonFunction  Identifier
hi link Question        Type
hi link CursorIM        Cursor
hi link VisualNOS       Visual
hi link xmlTag          Identifier
hi link xmlTagName      Identifier
hi link shDeref         Identifier
hi link shVariable      Function
hi link rubySharpBang   Special
hi link perlSharpBang   Special
hi link schemeFunc      Statement
" }}}
