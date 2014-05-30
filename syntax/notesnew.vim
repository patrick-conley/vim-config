" Patrick Conley <pconley@uvic.ca>
" Last Modified: 2012 Jun 02
"
" Language: class notes (new version)

" Inline quoted code {{{1
syn match nonewCodeInline "\$\$.\{-}\$\$" contains=nonewCodeInlineDelim,@NoSpell
if has( "conceal" )
  syn match nonewCodeInlineDelim     contained "\$\$" conceal
endif

hi nonewCode ctermfg=magenta guifg=magenta
hi link nonewCodeInline nonewCode
hi def link nonewCodeInlineDelim Ignore

" URLs and paths {{{1
syn match nonewURL "https\?://[^ ]*" contains=@NoSpell
syn match nonewURL "file://[^ ]*" contains=@NoSpell
syn match nonewURL "ftps\?://[^ ]*" contains=@NoSpell

" match:
"   /xxx.yyy
"   xxx/xxx.yyy
"   /xxx/xxx/
syn match nonewPath "[^ /]*/[^ ]*\(\.[a-z]*\|/\)\ze\( \|$\)" contains=@NoSpell
" match:
"   /xxx/xxx
" not:
"   xxx/xxx
syn match nonewPath "[^ /]*/[^ /]*/[^ ]*" contains=@NoSpell

hi nonewURL ctermfg=blue cterm=underline guifg=blue
hi link nonewPath nonewURL

" Headers
syn region nonewHeader start=+^#\{78}$+ end=+^#\{78}$+ contains=@NoSpell
syn match nonewHeader +^.*$\n^===*$+ contains=@NoSpell
syn match nonewHeader +^---*$+

hi nonewHeader ctermfg=blue guifg=blue

