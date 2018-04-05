" Needed because I'm using fish
set shell=/bin/zsh

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'

Bundle 'utl.vim'
Bundle 'taglist.vim'
Bundle 'repeat.vim'
Bundle 'speeddating.vim'
Bundle 'calendar.vim'

" Searching
Bundle 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Insert closing parens, brackets etc
Bundle 'Raimondi/delimitMate'

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
Bundle 'vim-airline/vim-airline-themes'
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1

" Tabs
Bundle 'bling/vim-bufferline'
let g:bufferline_show_bufnr = 1
let g:bufferline_echo = 0
map <C-b> :bn<CR>
map <C-v> :bp<CR>

" Expand region
Bundle 'terryma/vim-expand-region'

" Syntax goodness
Bundle 'scrooloose/syntastic'

" Filebrowser sidebar
Bundle 'scrooloose/nerdtree'

" Commenting
Bundle 'scrooloose/nerdcommenter'

Bundle 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" Go support
Bundle 'fatih/vim-go'
au FileType go nmap <Leader>l <Plug>(go-metalinter)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>d <Plug>(go-def)
au FileType go nnoremap <leader>a :cclose<CR>
let g:go_fmt_command = "goimports"
let g:go_snippet_engine = "automatic"

Bundle 'zchee/deoplete-go'
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1

" Project management (syntax highlighting per folder, per file etc)
Bundle 'tpope/vim-projectionist'

" Async operations (i.e, run `make`)
Bundle 'tpope/vim-dispatch'

" Replace / surround stuff with quotes and others
Bundle 'tpope/vim-surround'

" Git support
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
map \gs :Gstatus<CR>
map \gp :Gpush<CR>
map \gu :Gpull --rebase<CR>

" HCL formatting
Bundle 'fatih/vim-hclfmt'

" Format code plugin
Bundle 'Chiel92/vim-autoformat'

" JSX highlighting
Bundle 'mxw/vim-jsx'

" Easier navigation
Bundle 'easymotion/vim-easymotion'

" Alignment plugin
Bundle 'godlygeek/tabular'
map \t :Tabular

" Terraform + HCL
Bundle 'hashivim/vim-terraform'

" File utils
Bundle 'tpope/vim-eunuch'

" Tags manager (non-generic)
Bundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" Distraction free editing
Bundle 'junegunn/goyo.vim'
Bundle 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

Bundle 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"

Bundle 'honza/vim-snippets'

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

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

"set colorcolumn=80
set synmaxcol=128
syntax sync minlines=256
set nocursorcolumn
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
map \^ :call NumberToggle()<cr>

if exists(':tnoremap')
    tnoremap <Esc> <C-\><C-n>
endif

au FileType javascript.jsx nmap <Leader>l :Dispatch yarn eslint %<cr>
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

nmap <Leader>f :Autoformat<cr>

let g:tagbar_type_make = {
            \ 'kinds':[
            \ 'm:macros',
            \ 't:targets'
            \ ]
            \}

set hidden

set termguicolors