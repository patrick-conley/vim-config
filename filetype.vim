" fix filetype detection

augroup filetypedetect
   " setfiletype runs if the filetype wasn't detected in the system;
   " set filetype always runs
   au! BufRead,BufNewFile *.txt  setfiletype txt
   au! BufRead,BufNewFile *.md   setfiletype markdown
   au! BufRead,BufNewFile *.tex  setlocal filetype=tex
   au! BufRead,BufNewFile *.gradle setfiletype groovy
   au! BufRead,BufNewFile *.t    setfiletype perl
   au! BufRead,BufNewFile *.tsx  setfiletype javascript.jsx
augroup END
