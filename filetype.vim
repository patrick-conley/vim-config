" Vim script to extend filetype detection
"
" Maintainer: Patrick Conley <pconley@uvic.ca>
" Last Changed: 2013 Apr 13

augroup filetypedetect
   au! BufRead,BufNewFile *log   setfiletype log
   " setfiletype runs if the filetype wasn't detected in the system;
   " set filetype always runs
   au! BufRead,BufNewFile *notes,*/notes/* set filetype=notes
   au! BufRead,BufNewFile *.txt  setfiletype txt
   au! BufRead,BufNewFile *codelog set filetype=code
   au! BufRead,BufNewFile *.md setfiletype markdown
augroup END
