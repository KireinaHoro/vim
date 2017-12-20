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

" haskellmode config
au BufEnter *.hs compiler ghc
let g:haddock_browser="/usr/bin/firefox"
let g:haddock_browser_callformat = "'%s file://%s '.printf(&shellredir,'/dev/null').' &'"

" prefer LaTeX flavor of TeX
let g:tex_flavor = "latex"
" `ysiwc` for inserting LaTeX command
let g:surround_{char2nr('c')} = "\\\1command\1{\r}"
