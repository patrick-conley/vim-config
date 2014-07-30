" Summary: Add inline LaTeX to Markdown syntax

syn cluster markdownBlock add=markdownTeXBlock
syn region markdownTeXBlock start="^\%(\t\|    \)*\%([-*+]\|\d\+\.\)\?\s*\$\$\s*$" end="\%(\t\|    \)*\$\$\s*$" contained

syn cluster markdownInline add=markDownTeXInline
syn region markdownTeXInline start="\$\ze[^$]" end="\$" keepend contains=markdownLineStart

syn clear markdownCodeBlock
syntax region markdownCodeBlock start="^\%(    \|\t\)\%([-*+]\|\$\$\|\s\)\@!" end="$" contained

syntax clear markdownListMarker
syntax match markdownListMarker "^\%(\t\|    \)*[-*+]\%(\s\+\S\)\@=" contained

syntax clear markdownOrderedListMarker 
syntax match markdownOrderedListMarker "^\%(\t\|    \)*\d\+\.\%(\s\+\S\)\@=" contained

hi def link markDownTeXInline htmlTag
hi def link markDownTeXBlock htmlTag
