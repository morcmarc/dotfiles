set shell=/bin/zsh

set nocompatible              " be iMproved, required
filetype off                  " required
set hidden
set viminfo='20,<1000,s1000 " increase copy/paste buffer size

" Functions {{{
function! NumberToggle()
    if(&relativenumber == 1)
        set number
        set norelativenumber
    else
        set nonumber
        set relativenumber
    endif
endfunc
" }}}

" Plugins {{{

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

call plug#begin('~/.local/share/nvim/plugged')

" let Vundle manage Vundle, required
"Plug 'gmarik/Vundle.vim'

"Plug 'utl.vim'
"Plug 'taglist.vim'
"Plug 'repeat.vim'
"Plug 'speeddating.vim'
"Plug 'calendar.vim'
"Plug 'paredit.vim'

" Better undo
Plug 'sjl/gundo.vim'
let g:gundo_prefer_python3 = 1

" Searching
Plug 'haya14busa/incsearch.vim'
set hlsearch
let g:incsearch#auto_nohlsearch = 1

" Insert closing parens, brackets etc
Plug 'Raimondi/delimitMate'

" Color scheme
Plug 'morhetz/gruvbox'

" Improved JS support
Plug 'pangloss/vim-javascript'

" Powerbar at bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1

" Tabs
Plug 'bling/vim-bufferline'
let g:bufferline_show_bufnr = 1
let g:bufferline_echo = 0

" Expand region
Plug 'terryma/vim-expand-region'

" Syntax goodness
"Plug 'scrooloose/syntastic'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'go': ['bingo'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'javascript': ['javascript-typescript-stdio']
    \ }

" Filebrowser sidebar
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let NERDTreeQuitOnOpen=1

" Commenting
Plug 'scrooloose/nerdcommenter'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" Go support
"Plug 'fatih/vim-go'
"let g:go_fmt_command = "goimports"
"let g:go_snippet_engine = "automatic"

"Plug 'zchee/deoplete-go'
"let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
"let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
"let g:deoplete#sources#go#pointer = 1

" Project management (syntax highlighting per folder, per file etc)
Plug 'tpope/vim-projectionist'

" Async operations (i.e, run `make`)
Plug 'tpope/vim-dispatch'

" Replace / surround stuff with quotes and others
Plug 'tpope/vim-surround'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Format code plugin
"Plug 'Chiel92/vim-autoformat'
"let g:formatters_javascript = ['eslint_local']
"let g:formatters_jsx = ['eslint_local']

" JSX highlighting
Plug 'mxw/vim-jsx'
au BufRead,BufNewFile *.jsx set filetype=javascript.jsx

" Easier navigation
Plug 'easymotion/vim-easymotion'

" Alignment plugin
Plug 'godlygeek/tabular'

" Terraform + HCL
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'

" File utils
Plug 'tpope/vim-eunuch'

" Tags manager (non-generic)
Plug 'majutsushi/tagbar'
let g:tagbar_type_make = {
            \ 'kinds':[
            \ 'm:macros',
            \ 't:targets'
            \ ]
            \}

" Distraction free editing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Snippets
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"

Plug 'honza/vim-snippets'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
let g:fzf_files_options =
   \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

Plug 'lervag/vimtex'

" Racket
"Plug 'wlangstroth/vim-racket'
"let g:syntastic_enable_racket_racket_checker=1

Plug 'derekwyatt/vim-scala'
au BufRead,BufNewFile *.sbt set filetype=scala

"call vundle#end()            " required
call plug#end()
filetype plugin indent on    " required
" }}}

" Colors {{{
" enable syntax highlighting
syntax on

" set colorscheme
color gruvbox
set background=dark

" allow JSX syntax highlighting for .js files
let g:jsx_ext_required = 0

" highlight Markdeep files as markdown
au BufNewFile,BufRead *.md.html set filetype=markdown
" }}}

" Keybindings {{{
let g:mapleader = ' '
let g:maplocalleader = '\'
inoremap jk <ESC>
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" better undo
nnoremap <leader>u :GundoToggle<CR>
" nice paste
map <leader>o :set paste!<CR>
" map NERDTree
map <C-n> :NERDTreeToggle<CR>
" map search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" buffer navigation
map <C-b> :bn<CR>
map <C-v> :bp<CR>
" golang keys
"au FileType go nmap <Leader>l <Plug>(go-metalinter)
"au FileType go nmap <Leader>t <Plug>(go-test)
"au FileType go nmap <Leader>b <Plug>(go-build)
"au FileType go nmap <Leader>d <Plug>(go-def)
"au FileType go nmap <F18> <Plug>(go-rename)
"au FileType go nnoremap <leader>a :cclose<CR>
" fugitive / git bindings
map <leader>gs :Gstatus<CR>
map <leader>gp :Gpush<CR>
map <leader>gu :Gpull --rebase<CR>
" alignment
map <localleader>t :Tabular
" tagbar
nmap <leader>t :TagbarToggle<CR>
" ack / ag binding
nnoremap <leader>a :Ack<space>
" autoformatting
nmap <Leader>f :Autoformat<cr>
" javascript
au FileType javascript.jsx nmap <Leader>l :Dispatch yarn eslint %<cr>
" Line number toggle
map <leader>^ :call NumberToggle()<cr>
" Paredit
map <C->> <Plug>(paredit-slurp)
" tmux
if exists(':tnoremap')
    tnoremap <Esc> <C-\><C-n>
endif
" FZF
nnoremap <silent> <C-p> :Files<CR>
" Ripgrep
nnoremap <leader>rg :Rg<space>
nnoremap <leader>! :Rg!<space>
" }}}

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" Generic config {{{

set hidden
set termguicolors
set showcmd
set wildmenu
set lazyredraw

set foldenable
set foldlevelstart=10
set foldnestmax=10

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
set synmaxcol=128
syntax sync minlines=256
set nocursorcolumn
set cursorline

" }}}

set modeline
" vim:foldmethod=marker:foldlevel=0