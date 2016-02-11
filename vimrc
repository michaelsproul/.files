set nocompatible
filetype off

" -- Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/csapprox'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'rust-lang/rust.vim'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'ciaranm/detectindent'
Plugin 'cespare/vim-toml'
Plugin 'bling/vim-airline'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'lambdatoast/elm.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'idris-hackers/idris-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'def-lkb/vimbufsync'
Plugin 'the-lambda-church/coquille'

call vundle#end()


" -- Basic options.
" Use UTF-8.
set encoding=utf-8

" Detect filetype, but don't enable auto indenting.
filetype on

" Set the terminal title when editing.
set title

" Mouse support.
set mouse=a

" Disable line numbering.
set nonumber


" -- Status line.
" Always display the status line.
set laststatus=2
set noshowmode

" Super-simple airline config. No stupid patched fonts required.
" let g:airline_theme = 'powerlineish'
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '

" Disable Airline extensions.
let g:airline#extensions#whitespace#enabled = 0
let g:airline_detect_modified = 0
let g:airline_detect_paste = 0

" Status line contents.
let g:airline_section_z = "C%02c L%l/%L"


" -- Syntax highlighting.
syntax on
set background=dark

" Set up CSApprox (colour scheme approximation).
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

" Use the terminal's background colour.
let g:CSApprox_hook_post = ['hi Normal ctermfg=NONE ctermbg=NONE',
			\   'hi NonText ctermbg=NONE ctermfg=NONE']
colorscheme hemisu

" Show line barrier at column 100.
highlight ColorColumn ctermbg=237
set colorcolumn=100


" -- Editing.
" Exit insert mode immediately.
set timeoutlen=1000 ttimeoutlen=0

" Allow backspacing over lines/indents and past the start of an insertion.
set backspace=indent,eol,start

" Make the home key go to the first non-whitespace character.
" FIXME: Make this work with wrapping stuff.
map <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

" Enable highlighted, incremental search. Use Ctrl-L to clear.
set hlsearch
set incsearch
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Show 8 lines before/ahead of the cursor when scrolling.
set scrolloff=8

" Use the system clipboard!
set clipboard=unnamedplus


" -- Wrapping.
" Disable wrapping by default (enabled for certain filetypes below).
set nowrap
set linebreak
set textwidth=0

" Allow arrow keys to wrap at the end of lines.
set whichwrap+=<,>,[,]

" Allow lurking at the end of a line.
set virtualedit=onemore


" -- Whitespace.
" Function for indenting using tabs.
function Tabs(width)
	set noexpandtab nosmarttab
    let &tabstop=a:width
    let &shiftwidth=a:width
endfunction

" Function for indenting using spaces.
function Spaces(width)
	set expandtab smarttab
    let &tabstop=a:width
    let &shiftwidth=a:width
endfunction

call Spaces(4)

" Higlight trailing whitespace.
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=lightblue
highlight ExtraWhiteSpace ctermbg=lightblue
match ExtraWhiteSpace /\s\+$/

" Function to strip trailing whitespace.
function StripTrailingWhitespace()
    " Only strip if the b:noStripeWhitespace variable isn't set
    if exists('b:noStripWhitespace')
        return
    endif
    %s/\s\+$//e
endfunction

" Automatically strip trailing whitespace (disabled).
" autocmd BufWritePre * call StripTrailingWhitespace()
" autocmd FileType markdown let b:noStripWhitespace=1


" -- File types.
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.pl set filetype=prolog
autocmd BufRead,BufNewFile *.gradle set filetype=groovy
autocmd FileType text,markdown setlocal wrap
autocmd FileType make call Tabs(8)
autocmd FileType go call Tabs(4)
autocmd FileType html call Spaces(2)
