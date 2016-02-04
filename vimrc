" Pathogen
execute pathogen#infect()

" Key mappings
inoremap jk <ESC>
let mapleader = "\<Space>"

" Various settings
filetype plugin indent on
syntax on
set encoding=utf-8
set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set hlsearch
set nu

" vim-airline
let g:airline_powerline_fonts = 1

" encoding
if has("multi_byte")
	if &termencoding == ""
		let &termencoding = &encoding
	endif
	set encoding=utf-8
	setglobal fileencoding=utf-8
	" setglobal bomb
	set fileencodings=ucs-bom,utf-8,latin1
endif

" haskell-vim
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typerole = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
