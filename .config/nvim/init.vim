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

call plug#begin('~/.local/share/nvim/plugged')

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

" Filebrowser sidebar
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let NERDTreeQuitOnOpen=1

" Commenting
Plug 'scrooloose/nerdcommenter'

" Project management (syntax highlighting per folder, per file etc)
Plug 'tpope/vim-projectionist'

" Async operations (i.e, run `make`)
Plug 'tpope/vim-dispatch'

" Replace / surround stuff with quotes and others
Plug 'tpope/vim-surround'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Easier navigation
Plug 'easymotion/vim-easymotion'

" Alignment plugin
Plug 'godlygeek/tabular'

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

" Fuzzy finder (ctrlp replacement)
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
let g:fzf_files_options =
   \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" Editor Config
Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

Plug 'dense-analysis/ale'
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1
let b:ale_fixers = {'go': ['gopls']}

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

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
" Line number toggle
map <leader>^ :call NumberToggle()<cr>
" Paredit
map <C->> <Plug>(paredit-slurp)
" tmux
if exists(':tnoremap')
    tnoremap <Esc> <C-\><C-n>
endif
" FZF
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <C-f> :Files<CR>
" Ripgrep
nnoremap <leader>rg :Rg<space>
nnoremap <leader>! :Rg!<space>
" Autoformat
"nnoremap <leader>f :Autoformat<CR>
"nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" }}}

" Generic config {{{

set hidden
set termguicolors
set showcmd
set wildmenu
set lazyredraw
set nobackup
set nowritebackup

set foldenable
set foldlevelstart=10
set foldnestmax=10

set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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
set synmaxcol=256
syntax sync minlines=256
set nocursorcolumn
set cursorline

" }}}

set modeline
" vim:foldmethod=marker:foldlevel=0