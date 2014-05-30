" Vim syntax file
" Language: logbooks
" Maintainer: Patrick Conley <pconley@uvic.ca>
" Last Change: 2010 Aug 26

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
   finish
endif

syn match logTodo "^\s*\d\+_ "
syn match logComeFrom "\^[0-9\.]\+ \w\{3\} \w\{3\} \d\+"
syn match logGoTo "^\s*\d\++ "
syn match logVerb "^\s*$ .*"
" syn match logMath "^\s*& .*"
syn match logComment "^\s*#.*"
syn match logDate "^\w\{3\} \w\{3\} [0-9 ]\d \d\{4\}$"
syn match logItem "^\s*\d\+\. "
syn region logQuote start="``" end="''"
syn match logMeasurements "[0-9\.]\+ \?\([pnumckMGT]\?[mgsL]\|pp[mtb]\)\? \?\\pm \?[0-9\.]\+ \?\([pnumckMGT]\?[mgsL%]\|pp[mtb]\)"
syn match logTime "[0-9]\?[0-9]:[0-9][0-9]\(:[0-9][0-9]\)\?"
syn match logPhoto "[0-9a-zA-Z \-_]\+\.jpg"

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link logTodo Error
hi def link logComeFrom Function
hi def link logGoTo Function
hi def link logVerb String
" hi def link logMath Delimiter
hi def link logComment Comment
hi def link logDate Statement
hi def link logItem Operator
hi def link logQuote String
hi def link logMeasurements Delimiter
hi def link logTime Delimiter
hi def link logPhoto Delimiter

let b:current_syntax = "log"
