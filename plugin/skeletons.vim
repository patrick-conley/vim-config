" Declare skeletons for filetypes I use a lot
if has( "autocmd" )

   function! MatlabSkeleton() " {{{

      let filename = expand("%:t:r")

      call setline( '$', 'function ' . filename )

      if expand("%:p") =~ 'assignments/.*/Q[0-9]\+'
         let outfile = filename . ".out"
         let spaces = " "

         let text = [
                  \ "if exist( '" . outfile . "', 'file' )",
                  \ "   delete( '" . outfile . "' );",
                  \ "end",
                  \ "diary " . outfile,
                  \ "printf( '%s\\n\\n', 'Output of " . filename . "' )",
                  \ '',
                  \ '% stuff goes here',
                  \ '',
                  \ "diary off" ]

         call append( '$', text )
         call cursor( "8", "$" )

      else
         call append( '$', '% ' )
         call cursor( "2", "$" )
      endif

   endfunc " }}}

   augroup Skeleton
      au!
      " Perl
      autocmd BufNewFile *.pl
         \ 0put = '#!/usr/bin/perl' |
         \ 2put = 'use strict;' |
         \ 3put = 'use warnings;' |
         \ 4put = 'use English qw/ -no-match-vars/;' |
         \ 5put = 'use utf8;' |
         \ normal G
      " Perl modules
      autocmd BufNewFile *.pm
         \ 0put = 'use strict;' |
         \ 1put = 'use warnings;' |
         \ 2put = 'use English qw/ -no-match-vars/;' |
         \ 3put = 'use utf8;' |
         \ normal G
      " Perl tests
      autocmd BufNewFile */t/*.t
         \ 0put = 'use strict;' |
         \ 1put = 'use warnings;' |
         \ 2put = 'use English qw/ -no-match-vars/;' |
         \ 3put = 'use utf8;' |
         \ 4put = 'use v5.18.0;' |
         \ 6put = 'use Test::Most;' |
         \ 8put = 'done_testing();' |
         \ normal G
      " bash
      autocmd BufNewFile *.sh,$HOME/bin/[^.]\+
         \ 0put = '#!/bin/bash' |
         \ 2put = '#' |
         \ 3put = '# Summary: ' |
         \ normal 4G $
      " Python
      autocmd BufNewFile *.py
         \ 0put = '#!/usr/bin/python' |
         \ 1put = '# -*- coding: iso-8859-15 -*-' |
         \ normal G
      " zsh
      autocmd BufNewFile *.zsh,*.zsh/**
         \ 0put = '#!/usr/bin/zsh' |
         \ 2put = '#' |
         \ 3put = '# Summary: ' |
         \ normal 5G $
      " vim
      autocmd BufNewFile *.vim
         \ 0put = '\" Summary: ' |
         \ normal 2G $
      " awk
      autocmd BufNewFile *.awk
         \ 0put = '#!/usr/bin/awk' |
         \ 2put = '#' |
         \ 3put = '# Summary: ' |
         \ normal G
      " html, php
      autocmd BufNewFile *.html,*.php
         \ 0put = '<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">' |
         \ 2put = '<html>' | $put = '' |
         \ $put = '   <head>' |
         \ $put = '      <meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8\">' |
         \ $put = '      <!--meta http-equiv=\"Content-Style-Type\" content=\"text/css\"-->' |
         \ $put = '      <!--link rel=\"stylesheet\" type=\"text/css\" href=\"stylesheet.css\"-->' |
         \ $put = '      <title></title>' |
         \ $put = '   </head>' |
         \ $put = '' |
         \ $put = '   <body>' |
        autocmd BufNewFile presentation.tex
           \ 0put = '\documentclass{beamer}' |
           \ 1put = '\mode<presentation>' |
           \ 2put = '\beamertemplatenavigationsymbolsempty' |
           \ 3put = '\usetheme{Malmoe}' |
           \ 5put = '\title{}' |
           \ $put = '\author{}' |
           \ $put = '\institute{} % I use this do describe what the presentation is for' |
           \ $put = '' |
           \ $put = '\begin{document}' |
           \ $put = '' |
           \ $put = '\begin{frame}' |
           \ $put = '\titlepage' |
           \ $put = '\end{frame}' |
           \ normal 5G
      " LaTeX
 "       autocmd BufNewFile report.tex
      autocmd BufNewFile *.tex
         \ 0put = '\documentclass[10pt,twocolumn,oneside,notitlepage]{article}' |
         \ 1put = '\usepackage{xcolor,graphicx,caption,subcaption,fixltx2e,amsmath}' |
         \ 2put = '\usepackage[pdftex]{hyperref}' |
         \ 3put = '\usepackage[utf8]{inputenc}' |
         \ $put = '\title{}' |
         \ $put = '\author{P. Conley}' |
         \ $put = '\date{} % leave blank for no date' |
         \ $put = '' |
         \ $put = '\begin{document}' |
         \ $put = '' |
         \ $put = '\maketitle' |
         \ $put = '' |
 "          \ $put = '\begin{abstract}' |
 "          \ $put = '\end{abstract}' |
 "          \ $put = '' |
 "          \ $put = '\section{Introduction} % {{{1' |
 "          \ $put = '\section{Theory} % {{{1' |
 "          \ $put = '\section{Methods} % {{{1' |
 "          \ $put = '\section{Results} % {{{1' |
 "          \ $put = '\section{Discussion} % {{{1' |
 "          \ $put = '\section{Conclusions} % {{{1' |
 "          \ $put = '% }}}1' |
 "          \ $put = '' |
 "          \ $put = '\begin{thebibliography}{99}' |
 "          \ $put = '\end{thebibliography}' |
 "          \ $put = '' |
         \ $put = '\end{document}' |
         \ normal 7G
      autocmd BufNewFile *.m ks|call MatlabSkeleton()|'s
   augroup end
endif
