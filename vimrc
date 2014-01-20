set nocompatible
filetype on

" Syntax highlighting
syntax on
set background=dark
colorscheme ir_black

" Use two semicolons instead of ESC
imap ;; <ESC>

" Higlight trailing whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=lightblue
highlight ExtraWhiteSpace ctermbg=lightblue
match ExtraWhiteSpace /\s\+$/

" Show line barrier at column 100
highlight ColorColumn ctermbg=darkblue
set colorcolumn=100

" Disable line wrapping
set nowrap
