"Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'Townk/vim-autoclose'
"Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rking/ag.vim'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'othree/html5.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-unimpaired'
Plugin 'pangloss/vim-javascript'
Plugin 'tomasr/molokai'
Plugin 'wincent/command-t'
"Plugin 'freitass/todo.txt-vim'
" Plugin 'kien/ctrlp'
Plugin 'matthewtodd/vim-twilight'
Plugin 'mileszs/ack.vim'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-notes'
Plugin 'tomswartz07/vim-todo'
Plugin 'scrooloose/nerdcommenter'
Plugin 'gabebw/vim-spec-runner'
call vundle#end()            " required
filetype plugin indent on  

" Quick ESC
imap jj <ESC>
syntax on
nnoremap ; :
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

set t_Co=256
set pastetoggle=<F2>
set smartindent
set autoindent
set copyindent
set shiftround
set smartcase
set ruler

set smarttab
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
imap <Tab> <C-P>

"map ,t <Esc>:tabnew<CR>:NERDTree<CR>
map ,t <Esc>:tabnew<CR>:CommandT<CR>

map <C-n> :tabn<CR>
map <C-p> :tabp<CR>

"let g:solarized_diffmode="high" "default value is normal
let g:solarized_termcolors = &t_Co
"let g:solarized_termtrans = 1
let g:solarized_visibility= "high"
"colorscheme solarized

call togglebg#map("<F5>")
set t_ut=
set background=light

"set regexpengine=1
set cursorline

cnoreabbrev E e
cnoreabbrev W w
cnoreabbrev Q q

nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

"Command-T exclude dirs
set wildignore+=vendor/bundle
set wildignore+=node_modules

colorscheme twilight
hi TabLineSel ctermbg=Brown

"disable bg color to enable transparency
hi Normal ctermbg=none
hi NonText ctermbg=none

"show column in cursor
set cursorline cursorcolumn
