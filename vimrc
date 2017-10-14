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
Plugin 'scrooloose/nerdtree'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'DoxygenToolkit.vim'
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'rdnetto/YCM-Generator'
Plugin 'godlygeek/tabular'
Plugin 'janko-m/vim-test'

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
Plugin 'tomasr/molokai'

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

" Special Command for py-docstring
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" Vim UI
syntax on

silent! colorscheme molokai

" Pymode Settings (python-mode)
let g:pymode_lint_ignore = "W503,E402"

let g:load_doxygen_syntax = 1

au Syntax py, pyx, pxd
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

" Explorer Mappings
nnoremap <C-n> :NERDTreeToggle<cr>
nnoremap <C-m> :NERDTreeMirror<cr>
nnoremap <c-f> :CtrlP<cr>
nnoremap <c-b> :CtrlPBuffer<cr>

" CtrlP BDelete needs this
call ctrlp_bdelete#init()

" DoxygenToolkit.vim Configuration
let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_compactDoc = "yes"
let g:DoxygenToolkit_authorName = "Ben Altieri"
let g:DoxygenToolkit_licenseTag = ""
let g:DoxygenToolkit_briefTag_pre = "\\brief " 
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:DoxygenToolkit_paramTag_pre = "\\param " 
let g:DoxygenToolkit_paramTag_post = ": "
let g:DoxygenToolkit_returnTag = "\\return " 
let g:DoxygenToolkit_blockHeader="---------------------------------------"
let g:DoxygenToolkit_blockFooter="---------------------------------------" 
let g:DoxygenToolkit_fileTag = "\\file "
let g:DoxygenToolkit_authorTag = "\\author "
let g:DoxygenToolkit_dateTag = "\\date "
let g:DoxygenToolkit_versionTag = "\\version "
let g:DoxygenToolkit_blockTag = "\\name"
let g:DoxygenToolkit_classTag = "\\class"
