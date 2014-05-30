" Patrick Conley <pconley@uvic.ca>
" Last modified: 2012 Mar 17
"
" Summary: Acts on a file describing (briefly) what I've done with installed
" packages, changes to my code, etc.

" Quit if a syntax file has already been loaded
if exists( "b:current_syntax" )
   finish
endif

" Headers {{{1
syn match softHeaderDate +^.*$\n^===*$+ contains=softReference,@NoSpell
syn match softHeaderComp +\(Athena\|Dionysus\)+ contains=@NoSpell

hi softHeader ctermfg=blue guifg=blue
hi link softHeaderDate softHeader
hi link softHeadercomp softHeader

" Actions {{{1

" todo items
syn match softTodo +\c^\s*\zstodo\ze\(\s\|$\)+
syn match softTodoDone +\c^\s*todo\s*\(not \)\?done\(\s\|$\)+ contains=softDone

" TODO: should end on not-bug, not empty line

" multiline bug comments, and their solution
" softBug must come before softBugRegion so latter overrides it
syn match softBug +\c^\s*bug\(\s\|$\)+ nextgroup=softTarget

syn region softBugRegion start=+\c^\s*bug$+ end=+^$+ contains=softBug,softBugLine
syn match softBugLine /^\s*-\s\+/ contained nextgroup=softBugFixRegion

syn region softBugFixRegion start=+\cfix$+ end=+^$+ keepend contained contains=softBugFix,softBugFixLine
syn match softBugFix +\cfix$+ contained
syn match softBugFixLine /^\s*-\s\+/ contained

" comments on installed software
syn match softInstall +^\s*install\s*+ nextgroup=softDone,softTarget

" comments on (various) changes to code
syn match softCode /^\s*\(change\|wrote\)\s\+/ nextgroup=softDone,softTarget

" modifier for installs that have been synched across computers, finished todo
" items, etc.
syn match softDone +\c\(sync\|\(not \)\?done\)\(\s\|$\)+ contained nextgroup=softTarget

" modifier for the file/package that was changed
syn match softTarget +\S*+ contained


hi softTodo ctermbg=yellow guibg=yellow
 " hi softTodoDone ctermfg=FF0000 guifg=darkyellow

hi softBug ctermfg=red guifg=red
hi link softBugLine softBug

hi softInstall ctermfg=magenta guifg=magenta
hi softCode ctermfg=cyan guifg=cyan

hi link softBugFix softCode
hi link softBugFixLine softCode

hi softTarget ctermfg=darkred guifg=darkred
hi softDone ctermfg=darkyellow guifg=darkyellow
