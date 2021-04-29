set nocompatible
filetype off

" -- Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/csapprox'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'rust-lang/rust.vim'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'ciaranm/detectindent'
Plugin 'cespare/vim-toml'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'lambdatoast/elm.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'idris-hackers/idris-vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'def-lkb/vimbufsync'
Plugin 'the-lambda-church/coquille'
Plugin 'dag/vim-fish'
Plugin 'lervag/vimtex'
Plugin 'elixir-lang/vim-elixir'
Plugin 'derekwyatt/vim-scala'
Plugin 'tomlion/vim-solidity'
Plugin 'jez/vim-better-sml'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'andy-morris/sml.vim'
Plugin 'endel/vim-github-colorscheme'
" Plugin 'fsharp/vim-fsharp'

call vundle#end()

" Detect filetype, enable auto indenting
filetype plugin on
set ai

" -- Basic options.
" Use UTF-8.
set encoding=utf-8

" Set the terminal title when editing.
set title

" iTerm tab hacks.
if has("macunix")
    set t_ts=]1;
    set t_fs=
endif

" Mouse support.
set mouse=a

" Line numbering.
set number

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

" Set up CSApprox (colour scheme approximation).
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

" Use the terminal's background colour.
let g:CSApprox_hook_post = ['hi Normal ctermfg=NONE ctermbg=NONE',
			\   'hi NonText ctermbg=NONE ctermfg=NONE']
let g:airline_theme='sol'

" Show line barrier at column 100.
set colorcolumn=100

function LightTheme()
    set background=light
    colorscheme github
    highlight LineNr ctermbg=333 ctermfg=grey
endfunction

function DarkTheme()
    set background=dark
    colorscheme hemisu
    highlight LineNr ctermbg=333 ctermfg=darkgrey
    highlight ColorColumn ctermbg=237
endfunction

call DarkTheme()
" call LightTheme()

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
set clipboard^=unnamed,unnamedplus
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" -- Wrapping.
" Disable wrapping by default (enabled for certain filetypes below).
set nowrap
set linebreak
set textwidth=0

" Allow arrow keys to wrap at the end of lines.
set whichwrap+=<,>,[,]

" Allow lurking at the end of a line.
set virtualedit=onemore

" Disable exmode.
map Q <Nop>

" Auto-reload files that have changed outside of Vim
set autoread
au CursorHold,CursorHoldI,InsertEnter * checktime

" -- Whitespace.
" Function for indenting using tabs.
function Tabs(width)
	set noexpandtab nosmarttab
    let &tabstop=a:width
    let &shiftwidth=a:width
    let &softtabstop=0
endfunction

" Function for indenting using spaces.
function Spaces(width)
	set expandtab smarttab
    let &tabstop=a:width
    let &shiftwidth=a:width
endfunction

" call Spaces(4)

" Higlight trailing whitespace.
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=lightred
highlight ExtraWhiteSpace ctermbg=lightred
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
autocmd BufRead,BufNewFile *.ds set filetype=haskell
autocmd BufRead,BufNewFile *.hbs set filetype=html
autocmd BufRead,BufNewFile *.{sml,sig,lem,cml,ml,ML} set filetype=sml
autocmd BufRead,BufNewFile Makefile set filetype=make " XXX: this is a hack
autocmd FileType text,markdown setlocal wrap
autocmd FileType make call Tabs(8)
autocmd FileType go call Tabs(4)
autocmd FileType html,coq call Spaces(2)
autocmd FileType lhs call Spaces(4)
autocmd BufRead,BufNewFile *.mini call Spaces(4)
autocmd BufRead,BufNewFile *.model set filetype=runway
autocmd BufRead,BufNewFile *.mini set filetype=rust
au BufRead,BufNewFile *.k set filetype=kframework

" autocmd FileType coq call coquille#Register()

" Coq keyboard mappings.
" map <buffer> <silent> <C-b>    :CoqUndo<CR>
" map <buffer> <silent> <C-n>  :CoqNext<CR>
" map <buffer> <silent> <C-m>  :CoqToCursor<CR>

" Vim needs bash, not fish (or whatever other l337 shell)
set shell=/bin/bash

" Recognise bullet lists, and wrap them correctly
set com=fb:*,fb:-,fb:+

" Auto-format Rust code.
let g:rustfmt_autosave = 1
