" Needed because I'm using fish
set shell=/bin/zsh

set nocompatible              " be iMproved, required
filetype off                  " required

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
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'
Bundle 'utl.vim'
Bundle 'taglist.vim'
Bundle 'repeat.vim'
Bundle 'speeddating.vim'
Bundle 'calendar.vim'
" Bundle 'paredit.vim'

" Better undo
Bundle 'sjl/gundo.vim'
let g:gundo_prefer_python3 = 1

" Searching
Bundle 'haya14busa/incsearch.vim'
set hlsearch
let g:incsearch#auto_nohlsearch = 1

" Insert closing parens, brackets etc
Bundle 'Raimondi/delimitMate'

" Color scheme
Bundle 'morhetz/gruvbox'

" Quick file open with fuzz search
"Bundle 'kien/ctrlp.vim'
"let g:ctrlp_custom_ignore = {'dir': '\v[\/]\.?(git|hg|node_modules)$',}
"let g:ctrlp_match_window = 'bottom,order:ttb'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

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

" Expand region
Bundle 'terryma/vim-expand-region'

" Syntax goodness
Bundle 'scrooloose/syntastic'

" Filebrowser sidebar
Bundle 'scrooloose/nerdtree'
let NERDTreeQuitOnOpen=1

" Commenting
Bundle 'scrooloose/nerdcommenter'

Bundle 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" Go support
Bundle 'fatih/vim-go'
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
"Bundle 'jreybert/vimagit'
Bundle 'airblade/vim-gitgutter'

Bundle 'w0rp/ale'
let g:ale_linters = {
            \'javascript': ['eslint'],
            \'jsx': ['eslint']
            \}
"let g:ale_fixers = {
            "\'javascript': ['eslint'],
            "\'jsx': ['eslint']
            "\}
"let g:ale_fix_on_save = 1
"let g:ale_completion_enabled = 1

" Format code plugin
Bundle 'Chiel92/vim-autoformat'
let g:formatters_javascript = ['eslint_local']
let g:formatters_jsx = ['eslint_local']

" JSX highlighting
Bundle 'mxw/vim-jsx'

" Easier navigation
Bundle 'easymotion/vim-easymotion'

" Alignment plugin
Bundle 'godlygeek/tabular'

" Terraform + HCL
Bundle 'hashivim/vim-terraform'
Bundle 'juliosueiras/vim-terraform-completion'
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'

" File utils
Bundle 'tpope/vim-eunuch'

" Tags manager (non-generic)
Bundle 'majutsushi/tagbar'
let g:tagbar_type_make = {
            \ 'kinds':[
            \ 'm:macros',
            \ 't:targets'
            \ ]
            \}

" Distraction free editing
Bundle 'junegunn/goyo.vim'
Bundle 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Snippets
Bundle 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"

Bundle 'honza/vim-snippets'

Bundle 'junegunn/fzf'
Bundle 'junegunn/fzf.vim'
let g:fzf_files_options =
   \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

Bundle 'lervag/vimtex'

" Racket
"Bundle 'wlangstroth/vim-racket'
"let g:syntastic_enable_racket_racket_checker=1

call vundle#end()            " required
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
au FileType go nmap <Leader>l <Plug>(go-metalinter)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>d <Plug>(go-def)
au FileType go nmap <F18> <Plug>(go-rename)
au FileType go nnoremap <leader>a :cclose<CR>
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