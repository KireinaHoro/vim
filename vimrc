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
set nu rnu
set bg=dark
" set bg=light

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

au FileType c,cpp,objc setlocal tabstop=2 shiftwidth=2 softtabstop=2
au FileType c,cpp,objc nnoremap <buffer><leader>C :ClangFormatAutoToggle<CR>
au FileType c,cpp,objc nnoremap <buffer><leader>cf :<C-u>ClangFormat<CR>
au FileType c,cpp,objc vnoremap <buffer><leader>cf :ClangFormat<CR>

" Removes trailing spaces
function! TrimWhiteSpace()
    " Only strip if the b:noStripWhitespace variable isn't set
    if exists('b:noStripWhitespace')
        return
    endif
    %s/\s*$//
    ''
endfunction

" Control characters expansion
set list listchars=tab:»-,trail:.,eol:↲,extends:»,precedes:«,nbsp:%
" allow copying out of the term: disable line numbers and control expansion
nnoremap <leader>N :set invnu invrnu invlist<CR>

" trim whitespaces
au FileType diff let b:noStripWhitespace=1
au FileWritePre * call TrimWhiteSpace()
au FileAppendPre * call TrimWhiteSpace()
au FilterWritePre * call TrimWhiteSpace()
au BufWritePre * call TrimWhiteSpace()

" Highlighting-related
function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
hi NonText      ctermbg=NONE ctermfg=DarkGrey guibg=NONE guifg=NONE
hi SpecialKey   ctermbg=NONE ctermfg=DarkGrey guibg=NONE guifg=NONE

" Cursorline control
set cursorline
hi CursorLine cterm=NONE ctermbg=233 ctermfg=NONE guibg=NONE guifg=NONE
nnoremap <leader>H :set cursorline!<CR>

" Fix cursorline TODO conflict:
" https://vi.stackexchange.com/questions/3288/override-cursorline-background-color-by-syntax-highlighting
hi Todo         ctermbg=Black ctermfg=Yellow cterm=reverse

" Tabs
nnoremap t. :tabedit %<CR>
nnoremap tc :tabclose<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>

" Markdown
let g:markdown_fenced_languages = ['vim', 'bash']

" vim-tbone remaps
nnoremap <leader>y :Tyank<CR>

" global search with vim-ripgrep
let g:rg_derive_root = 1
nnoremap <leader>* :Rg -w <cword><CR>

set switchbuf+=usetab,newtab

" fold with syntax by default
set foldmethod=syntax
set nofoldenable

" highlight column 80
set colorcolumn=80
hi ColorColumn cterm=NONE ctermbg=233 ctermfg=NONE guibg=NONE guifg=NONE
