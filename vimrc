set nocompatible
filetype off

" Set up Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Vundle plug-ins
Plugin 'godlygeek/csapprox'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'wting/rust.vim'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'ciaranm/detectindent'
Plugin 'cespare/vim-toml'
Plugin 'bling/vim-airline'

call vundle#end()

" Status line config
set laststatus=2
set noshowmode

" Airline config
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 1

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

" Make the home key go to the first non whitespace character
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

" Searching
set hlsearch
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Scrolling
set scrolloff=8

" Syntax highlighting
syntax on
set background=dark

" Set up CSApprox (colour scheme approximation)
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

" Use the terminal's background colour
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

" Set up line wrapping
set nowrap
set linebreak
set textwidth=0

" Allow arrow keys to wrap at the end of lines
set whichwrap+=<,>,[,]

" Allow lurking at the end of a line
set virtualedit=onemore

" Tab configuration
function Tabs(width)
	set noexpandtab nosmarttab
        let &tabstop=a:width
        let &shiftwidth=a:width
endfunction

function Spaces(width)
	set expandtab smarttab
        let &tabstop=a:width
        let &shiftwidth=a:width
endfunction

call Spaces(4)

" Custom filetype settings
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd FileType text,markdown setlocal wrap
autocmd FileType make call Tabs(8)
autocmd FileType c,c++ call Tabs(4)

" Disable line numbering
set nonumber

" Allow sudo write with :W
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
