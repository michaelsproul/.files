set nocompatible
filetype off

" Set up Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Vundle plug-ins
Bundle 'godlygeek/csapprox'
Bundle 'noahfrederick/vim-hemisu'

" Use UTF-8
set encoding=utf-8

" Detect filetype, but don't enable auto indenting
filetype on

" Set the terminal title when editing
set title

" Use two semicolons instead of ESC
imap ;; <ESC>

" Make backspace behave sanely
set backspace=indent,eol,start

" Syntax highlighting
syntax on
set background=dark

" Set up CSApprox
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

" Use terminal background colour
let g:CSApprox_hook_post = ['hi Normal ctermfg=NONE ctermbg=NONE',
			\   'hi NonText ctermbg=NONE ctermfg=NONE']
colorscheme hemisu

" Higlight trailing whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=lightblue
highlight ExtraWhiteSpace ctermbg=lightblue
match ExtraWhiteSpace /\s\+$/

" Show line barrier at column 100
highlight ColorColumn ctermbg=237
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

autocmd FileType html,xml,css,scss setlocal tabstop=4

" Disable line numbering
set nonumber

" Powerline config
set laststatus=2
set noshowmode
