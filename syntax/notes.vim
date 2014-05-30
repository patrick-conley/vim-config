" Vim syntax file
" Language: class notes
" Maintainer: Patrick Conley <pconley@uvic.ca>
" Last Change: 2012 Jun 02

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
   finish
endif

" Headers
syn region notesHeader1 start=+^###*$+ end=+^#*$+
syn match notesHeader2 +^.*$\n^===*$+ contains=notesReference,@NoSpell
syn match notesHeader3 +^---*$+

hi notesHeader ctermfg=blue guifg=blue
hi link notesHeader1 notesHeader
hi link notesHeader2 notesHeader
hi link notesHeader3 notesHeader

" Todo
syn match notesTODO +^\s*_ +

hi notesTODO ctermbg=red guibg=red

" Link
syn region notesLink start=+\(^\|\s\)| + end=+ |\s\{-}\n\?+ nextgroup=notesURL
syn region notesFootnote start=+\(^\|\s\)^ + end=+ ^\s\{-}\n\?+ nextgroup=notesURL
syn match notesReference +\[[0-9,]\+\(:[-a-zA-Z0-9\.]\+\)\?\]+
" syn match notesURL +\(^\|\s\)\(https\?://\)\?[a-zA-Z0-9\.]*\.[a-z]\+[-a-zA-Z0-9~/\.%&=()_#è]*\(\s\|$\)+ 
syn match notesURL +\<\(https\?://\)\?[-a-zA-Z0-9\.]*\.[a-z]\+[-a-zA-Z0-9~/\.%&=()_#è]*\>+ contains=@NoSpell

hi notesLink ctermfg=darkyellow guifg=darkyellow
hi link notesFootnote notesLink
hi link notesReference notesLink
hi notesURL ctermfg=blue cterm=underline guifg=blue

" Commands to the txt2html translator
syn match notesTransCom +^:+ nextgroup=notesTransComArg
syn match notesTransComArg +.*$+ contained

hi notesTransCom ctermfg=lightred guifg=lightred
hi notesTransComArg ctermfg=yellow guifg=yellow

" All sortsa blocks {{{1

" Nested blocks
syn match notesCodeNest +^ *# + nextgroup=notesQuoteCont,notesEqCont
syn match notesQuoteNest +^ *& + nextgroup=notesCodeCont,notesEqCont

syn match notesCodeCont +# + contained nextgroup=notesEqCont,notesQuoteCont,notesCodeEnd
syn match notesQuoteCont +& + contained nextgroup=notesCodeCont,notesEqCont,notesQuoteEnd
syn match notesEqCont +\$ + contained nextgroup=notesEqEnd

syn region notesCodeEnd start=++ end=+$+ contained
syn region notesQuoteEnd start=++ end=+$+ contained
syn region notesEqEnd start=++ end=+$+ contained

" Un-nested blocks (nb: these must *not* the start of another block)
syn region notesCode start=+^ *# \(\$\$\|[^&\$]\)+ end=+$+ contains=notesEqInline,notesQuoteInline,@NoSpell
syn region notesQuote start=+^ *& [^#\$]+ end=+$+ contains=notesEqInline,@NoSpell
syn region notesEq start=+^ *\$ + end=+$+ contains=@NoSpell

" Inline blocks
syn region notesEqInline start=+\$\$+ end=+\$\$+ contains=@NoSpell
syn region notesQuoteInline start=+``+ end=+''+ contains=@NoSpell
syn match notesCodeInline +[a-zA-Z0-9_]\+()+ contains=@NoSpell " meant for function names
syn region notesCodeInlineArgs start=+[a-zA-Z0-9_]\+( + end=+ )+ contains=@NoSpell

hi notesCode ctermfg=cyan guifg=cyan
hi link notesCodeNest notesCode
hi link notesCodeCont notesCode
hi link notesCodeEnd notesCode
hi link notesCodeInline notesCode
hi link notesCodeInlineArgs notesCode

hi notesQuote ctermfg=darkred guifg=darkred
hi link notesQuoteNest notesQuote
hi link notesQuoteCont notesQuote
hi link notesQuoteEnd notesQuote
hi link notesQuoteInline notesQuote

hi notesEq ctermfg=magenta guifg=magenta
hi link notesEqNest notesEq
hi link notesEqCont notesEq
hi link notesEqEnd notesEq
hi link notesEqInline notesEq

" }}}1

let b:current_syntax = "notes"
