set nocompatible
filetype on

" Use two semicolons instead of ESC
imap ;; <ESC>

" Syntax highlighting
syntax on
set background=dark
colorscheme ir_black

" Higlight trailing whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=lightblue
highlight ExtraWhiteSpace ctermbg=lightblue
match ExtraWhiteSpace /\s\+$/

" Show line barrier at column 100
highlight ColorColumn ctermbg=darkblue
set colorcolumn=100

" Disable line wrapping
set nowrap

" Allow arrow keys to wrap at the end of lines
set whichwrap+=<,>,[,]

" Allow lurking at the end of a line
set virtualedit=onemore

" Tab configuration
set noexpandtab
set tabstop=8

autocmd FileType python setlocal tabstop=8
autocmd FileType html setlocal tabstop=4

