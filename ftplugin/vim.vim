" Patrick Conley <pconley@uvic.ca>
" Last modified: 2012 Jul 13
"
" Summary: specialized options for vim scripts

setlocal nospell

function! VimTAP_Diag( message )
   let line = line(".")
   let indent = repeat( " ", indent( line ) )
   call append( line, indent . 'call vimtap#Diag( "' . a:message . '" )' )
endfunc

command! -nargs=1 VDiag call VimTAP_Diag( <q-args> )
