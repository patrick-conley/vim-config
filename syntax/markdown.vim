" Summary: Add inline LaTeX to Markdown syntax


syn cluster markdownInline add=markDownTeXInline
syn region markdownTeXInline start="\$" end="\$" keepend contains=markdownLineStart

syn cluster markdownBlock add=markdownTeXBlock
syn region markdownTeXBlock start="^\s*\$\$\s*$" end="^\s*\$\$\s*$" contained

hi def link markDownTeXInline htmlTag
hi def link markDownTeXBlock htmlTag
