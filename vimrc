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
set hlsearch
set incsearch
set nu
set bg=dark

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

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

" ClangFormat
let g:clang_format#code_style = "llvm"
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1
let g:clang_format#auto_format_on_insert_leave = 1
if !executable("clang-format")
    " use clang-format from SCL
    let g:clang_format#command = "/opt/rh/llvm-toolset-7/root/usr/bin/clang-format"
endif

au FileType c,cpp,objc setlocal tabstop=2 shiftwidth=2 softtabstop=2
au FileType c,cpp,objc nnoremap <buffer><Leader>C :ClangFormatAutoToggle<CR>
au FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
au FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

set list listchars=trail:.,extends:>
au FileWritePre * call TrimWhiteSpace()
au FileAppendPre * call TrimWhiteSpace()
au FilterWritePre * call TrimWhiteSpace()
au BufWritePre * call TrimWhiteSpace()
