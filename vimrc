" Vundule Config
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" Navigation and Code Assistance
Plugin 'jakedouglas/exuberant-ctags'
Plugin 'taglist.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'scrooloose/nerdtree'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'scrooloose/syntastic'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'DoxygenToolkit.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'rdnetto/YCM-Generator'
Plugin 'godlygeek/tabular'
Plugin 'janko-m/vim-test'
Plugin 'rhysd/vim-clang-format'
Plugin 'justmao945/vim-clang'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'w0rp/ale'
Plugin 'jremmen/vim-ripgrep'

" His holyness tpope
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'

" Python
"Plugin 'davidhalter/jedi-vim'
Plugin 'klen/python-mode'
"Plugin 'nvie/vim-flake8'
"Plugin 'heavenshell/vim-pydocstring'
Plugin 'jmcantrell/vim-virtualenv'

" Cython
Plugin 'tshirtman/vim-cython'

" cmake
"Plugin 'jalcine/cmake.vim'
Plugin 'vhdirk/vim-cmake'

" syntax
Plugin 'solarnz/thrift.vim'

" Color Schemes
"Plugin 'tomasr/molokai'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'flazz/vim-colorschemes'

" Rust
Plugin 'rust-lang/rust.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" show existing tab with 4 spaces width
set tabstop=4
" Needed by vim-pydocstring
set softtabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Prefer ability to use backspace freely
set backspace=indent,eol,start

" Special Command to remove whitespace based on filetype
autocmd FileType c,cpp,java,php,python,cmake autocmd BufWritePre <buffer> %s/\s\+$//e

" Swift 2-space style indents
autocmd FileType c,cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Special Command for py-docstring
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" Vim UI
syntax on

silent! colorscheme default

set number relativenumber

" Pymode Settings (python-mode)
let g:pymode_lint_ignore = "W503,E402"

let g:load_doxygen_syntax = 1

au Syntax py, pyx, pxd, c, cpp, objc 
    \ if (exists('b:load_doxygen_syntax') && b:load_doxygen_syntax)
    \       || (exists('g:load_doxygen_syntax') && g:load_doxygen_syntax)
    \   | runtime! syntax/doxygen.vim
    \ | endif

" Disable arrow keys, kibishii! And remap to scrolling *gasp*
set nowrap
nnoremap <up> <C-Y>
nnoremap <down> <C-E>
nnoremap <left> zh
nnoremap <right> zl

" Remap pydocstring to allow for the below
nmap <silent> <C-_> <Plug>(pydocstring)

" Split navigation shortcuts
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map inc/dec to Alt because I use Tmux
:nnoremap <A-a> <C-a>
:nnoremap <A-x> <C-x>

" Set split behavior
set splitbelow
set splitright

" Nerdtree Configuration
let g:NERDTreeMouseMode = 2
let g:NERDTreeWinSize = 40
let g:NERDTreeMinimalUI = 1
let g:NERDTreeUpdateOnWrite = 0

" Explorer Mappings
nnoremap <C-n> :NERDTreeToggle<cr>
"nnoremap <C-m> :NERDTreeMirror<cr>
nnoremap <c-f> :CtrlP<cr>
nnoremap <c-b> :CtrlPBuffer<cr>

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Some handy grep shortcuts
:nnoremap K :grep <cword> %:p:h/*<CR>
:nnoremap gr :grep -R <cword> *<CR>
:nnoremap GR :grep -R <cword> %:p:h/../*<CR>
:nnoremap rg :Rg <cword> <CR>

" Random helper to comment out with ifdef
:vmap 0 V'<O#if 0<Esc>'>o#endif<Esc>

" Another random helper to comment out with C-style
:vmap * V'<O/*<Esc>'>o*/<Esc>

" ClangFormat Config
let g:clang_format#detect_style_file = 1
let g:clang_format#enable_fallback_style = 0
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" CtrlP BDelete needs this
call ctrlp_bdelete#init()

" DoxygenToolkit.vim Configuration
let g:DoxygenToolkit_compactDoc = "yes"
let g:DoxygenToolkit_authorName = "Ben Altieri"
let s:swiftlicense = "\<enter>Copyright (C) 2018 Swift Navigation Inc. \<enter>"
let s:swiftlicense = s:swiftlicense . "Contact: Swift Navigation <dev@swiftnav.com>\<enter>\<enter>"
let s:swiftlicense = s:swiftlicense . "This source is subject to the license found in the file 'LICENSE' which must\<enter>"
let s:swiftlicense = s:swiftlicense . "be distributed together with this source. All other rights reserved.\<enter>\<enter>"
let s:swiftlicense = s:swiftlicense . "THIS CODE AND INFORMATION IS PROVIDED \"AS IS\" WITHOUT WARRANTY OF ANY KIND,\<enter>"
let s:swiftlicense = s:swiftlicense . "EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED\<enter>"
let s:swiftlicense = s:swiftlicense . "WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE."
let g:DoxygenToolkit_licenseTag = s:swiftlicense
let g:DoxygenToolkit_briefTag_pre = "" 
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_paramTag_post = ": "
let g:DoxygenToolkit_cinoptions = ">-s"

set exrc
set secure
