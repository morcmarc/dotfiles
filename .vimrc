" Needed because I'm using fish
set shell=/bin/bash

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'

Bundle 'edkolev/tmuxline.vim'

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
Bundle 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1

" Tabs
Bundle 'bling/vim-bufferline'
let g:bufferline_show_bufnr = 1
let g:bufferline_echo = 0
map <C-b> :bn<CR>
map <C-v> :bp<CR>

" Syntax goodness
Bundle 'scrooloose/syntastic'

" Filebrowser sidebar
Bundle 'scrooloose/nerdtree'

" Commenting
Bundle 'scrooloose/nerdcommenter'

" Elixir (Erlang) support
Bundle 'elixir-lang/vim-elixir'

" Rust support
Bundle 'rust-lang/rust.vim'
"Bundle 'racer-rust/vim-racer'

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

" Git support
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

" HCL formatting
Bundle 'fatih/vim-hclfmt'

" JSX highlighting
Bundle 'mxw/vim-jsx'

" Easier navigation
Bundle 'easymotion/vim-easymotion'

" Alignment plugin
Bundle 'godlygeek/tabular'
map \t :Tabular

" Terraform + HCL
Bundle 'hashivim/vim-terraform'

" Scala support
Bundle 'derekwyatt/vim-scala'

" Haskell syntax
Bundle 'neovimhaskell/haskell-vim'

" Coffee script syntax
Bundle 'kchmck/vim-coffee-script'

" File utils
Bundle 'tpope/vim-eunuch'

" Tags manager (non-generic)
Bundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

call vundle#end()            " required
filetype plugin indent on    " required

" enable syntax highlighting
syntax on

" set colorscheme
color gruvbox
set background=dark

" allow JSX syntax highlighting for .js files
let g:jsx_ext_required = 0

" remap paste
map \o :set paste!<CR>
" map NERDTree
map <C-n> :NERDTreeToggle<CR>
" map haskell styling
map \h :%!stylish-haskell<CR>

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

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

set colorcolumn=80

set cursorline

function! NumberToggle()
    if(&relativenumber == 1)
        set number
        set norelativenumber
    else
        set nonumber
        set relativenumber
    endif
endfunc
map \l :call NumberToggle()<cr>

if exists(':tnoremap')
  tnoremap <Esc> <C-\><C-n>
endif

set hidden
