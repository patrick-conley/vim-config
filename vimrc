" .vimrc
" Maintainer: Patrick Conley <pconley@uvic.ca>
" Last change: 2013 Sep 06

if $SHELL =~ 'bin/fish'
   set shell=/bin/sh
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backup     " keep a backup file
set showcmd    " display incomplete commands
set incsearch  " do incremental searching
set autoindent " set autoindenting on

set hlsearch " highlight search results

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Only do this part when compiled with support for autocommands.
if has("autocmd")

   " Put these in an autocmd group, so that we can delete them easily.
   augroup vimrcEx
      au!

      " When editing a file, always jump to the last known cursor position.
      " Don't do it when the position is invalid or when inside an event
      " handler (happens when dropping a file on gvim).
      autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

   augroup END

endif " has("autocmd")

" OPTIONS

set tabstop=3                    " Set tab length
set shiftwidth=3
set expandtab                    " Use spaces for tabs

set number                       " show line numbers
set textwidth=78                 " use 80-column text everywhere

set foldmethod=marker            " Use folds
set foldminlines=2

set scrolloff=2                  " Scroll the screen 2 lines from the bottom
set formatoptions=tcrq
set cryptmethod=blowfish         " use strong(ish) encryption

set modeline                     " Turn on modeline-checking (eg. vim:ft=txt:)
set modelines=5

" Save undo after quit
if has("persistent_undo")
   set undofile
   set undodir="~/.vim/undohistory/"
end

set spelllang=en_ca

" MAPPINGS

" moving between frames
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" move by screen lines, not file lines
nnoremap j gj
nnoremap k gk

let mapleader = " "

" emacs command mode
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <C-g>  <C-c>

" moving between tabs
nmap <C-N> :tabn<CR>
nmap <C-P> :tabp<CR>

" Clear the search pattern
noremap <CR> :let @/=""<CR>

" Toggle paste mode
nnoremap _ :set paste!<Bar>set paste?<CR>

" Get rid of the superbly annoying `Q'
nnoremap Q gq}

" Open help in a vertical split
cabbrev h vertical help

" COMMANDS

" Print the date
command! VD :r! vd

" echo syntax of the text under the cursor
command! Syntax :echo
         \ "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> '
         \ . 'trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> "
         \ . "lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"

command! Fixsyntax :syntax sync fromstart

command! -nargs=1 Ctabe tabe | args include/<args>.h src/<args>.c | vertical all

" Read filetype-specific startup files
source ~/.vim/rc/hashbang.vim
source ~/.vim/rc/latex-shortcuts.vim

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
