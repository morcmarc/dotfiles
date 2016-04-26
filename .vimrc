" Needed because I'm using fish
set shell=/bin/bash

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'

" Color scheme
Bundle 'morhetz/gruvbox'

" Quick file open with fuzz search
Bundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/]\.?(git|hg|node_modules)$',
	\ }

" Improved JS support
Bundle 'pangloss/vim-javascript'

" Powerbar at bottom
Bundle 'Lokaltog/vim-powerline'

" Syntax goodness
Bundle 'scrooloose/syntastic'

" Filebrowser sidebar
Bundle 'scrooloose/nerdtree'

" Commenting
Bundle 'scrooloose/nerdcommenter'

" Elixir (Erlang) support
Bundle 'elixir-lang/vim-elixir'

" Go support
Bundle 'fatih/vim-go'

" Lein support (Clojure)
Bundle 'tpope/vim-salve'

" Project management (syntax highlighting per folder, per file etc)
Bundle 'tpope/vim-projectionist'

" Async operations (i.e, run `make`)
Bundle 'tpope/vim-dispatch'

" Clojure REPL
Bundle 'tpope/vim-fireplace'

" Replace / surround stuff with quotes and others
Bundle 'tpope/vim-surround'

" Haskell fmt
Bundle 'fatih/vim-hclfmt'

" JSX highlighting
Bundle 'mxw/vim-jsx'

" Easier navigation
Bundle 'easymotion/vim-easymotion'

" Alignment plugin
Bundle 'godlygeek/tabular'
map \t :Tabular

call vundle#end()            " required
filetype plugin indent on    " required

" enable syntax highlighting
syntax enable

" set colorscheme
color gruvbox
set background=dark

" allow JSX syntax highlighting for .js files
let g:jsx_ext_required = 0

" off/on line number
map \l :setlocal number!<CR>
" remap paste
map \o :set paste!<CR>
" map NERDTree
map <C-n> :NERDTreeToggle<CR>
" map Tern Shortcuts
" map \t :TernType<CR>
" map \d :TernDef<CR>

" enable backspace
set backspace=2

" show line number by default
set number

" show status bar
set laststatus=2

" enable mouse
set mouse=a

" Don’t add empty newlines at the end of files
set binary
set noeol

" Highlight searched items
set hlsearch

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

set colorcolumn=80
