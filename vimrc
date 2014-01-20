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

" Magic status bar
" set statusline=%1*%F%m%r%h\ [%{&ff}]\ %y%w%=%(Hex:%2B\ %l:%c%V/%L\ %P%)

" Disable line wrapping
set nowrap
