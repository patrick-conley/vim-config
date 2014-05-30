" Patrick Conley <pconley@uvic.ca>
" Last modified: 2012 Mar 08
"
" Summary: Add some extra things to Matlab/Octave syntax highlighting

syn keyword matlabImplicit    tanh sinh

syn region octaveString       start=+"+ end=+"+
hi link octaveString matlabString

syn match octaveComment "#.*$"
syn region octaveMultilineComment start=+#{+ end=+#}+ contains=matlabTodo,matlabTab

hi link octaveComment matlabComment
hi link octaveMultilineComment matlabMultilineComment
