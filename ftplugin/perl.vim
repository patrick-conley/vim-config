" Summary: specialized options for perl scripts

setlocal nospell

noremap <leader>b :call <SID>flip_block()<CR>

" Function: flip_block() {{{1
" Purpose:  Perl allows conditional blocks (if, while, etc. to have the form
"              if ( condition ) { statements }
"           or
"              statements if ( condition );
"           This script will swap a block from one form to the other.
"
"           - It assumes the block is a single statement
"           - It assumes the statement will go on a separate line from the
"             condition, and that Allman (or similar) indentation is being
"             used.
"           - It assumes the condition is surrounded with parens, even in
"             post-condition format
"
"           surround.vim is required for adding braces (well, I could easily
"           do it without, but why not…)
function! s:flip_block() 
   let line = getline(".")

   " Switch to post-condition style
   if ( line =~ '^\s*[a-z]*\s\?(.*)\s*$' )

      " Move to the next line (the opening brace) and join the statement block
      " into one line
      normal jv%J 

      " Remove leading/trailing whitespace and the semicolon (if it exists)
      substitute/;\s\ze*}\s*$/ /
      substitute/^\s*{\zs\s*//

      " Delete the contents of the statement block, but not the braces
      normal di{

      " Paste the contents of the statement block before the conditional
      normal k^P

      " Terminate what is now a single statement
      normal $a;

      " Delete the abandoned braces
      normal jdd

      " Set the cursor
      normal k^

   " Switch to pre-condition style
   elseif ( line =~ '[a-z]*\s\?(.*);\s*$' )

      " Remove the final semicolon
      substitute/;\s*$//

      " Delete the statement block
      normal $%B
      normal d^

      " Paste it below
      call append( line("."), repeat( " ", indent(line(".")) ) )
      normal j$p

      " Remove any trailing spaces
      substitute/\s*$//

      " Add the semicolon
      normal A;

      " Add braces
      normal ySS{

      " Set the cursor
      normal k^

   endif

endfunc
