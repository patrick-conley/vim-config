" fix filetype detection

augroup filetypedetect
   " setfiletype runs if the filetype wasn't detected in the system;
   " set filetype always runs
   au! BufRead,BufNewFile *.txt  setfiletype txt
   au! BufRead,BufNewFile *.md   setfiletype markdown
   au! BufRead,BufNewFile *.tex  setlocal filetype=tex
augroup END
