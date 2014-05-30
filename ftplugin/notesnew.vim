" Patrick Conley <pconley@uvic.ca>
" Last Modified: 2012 May 31
"
" Language: class notes (new version)

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

" BEGIN 

if has("conceal")
  setlocal conceallevel=2
endif

set shiftwidth=2
set tabstop=2
set formatoptions=tcrqln
" END

let &cpo = s:cpo_save
unlet s:cpo_save
