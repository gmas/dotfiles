"Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'matthewtodd/vim-twilight'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'MarcWeber/vim-addon-mw-utils'

" TODO file
Plugin 'tomswartz07/vim-todo'
"Plugin 'freitass/todo.txt-vim'


"Fast
Plugin 'onemanstartup/vim-slim'

Plugin 'othree/html5.vim'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-rails'
Plugin 'kchmck/vim-coffee-script'

Plugin 'mileszs/ack.vim'

"SLOOOOWWW
"Plugin 'slim-template/vim-slim'

"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'
"Plugin 'tpope/vim-unimpaired'
"Plugin 'pangloss/vim-javascript'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-notes'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'gabebw/vim-spec-runner'
"Plugin 'tomasr/molokai'
"Plugin 'wincent/command-t'
"Plugin 'Townk/vim-autoclose'
"Plugin 'tpope/vim-surround'
"Plugin 'scrooloose/syntastic'

"Not needed, using ftplugin
"Plugin 'vim-ruby/vim-ruby'

"Plugin 'altercation/vim-colors-solarized'
"Plugin 'rking/ag.vim'

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

"set <leader> to ,
let mapleader = ","

map <leader>t <Esc>:tabnew<CR>:NERDTree<CR>
map <leader>n <Esc>:tabnew<CR>:CtrlP<CR>

let g:ctrlp_map = ''
map <C-p> :tabp<CR>
map <C-n> :tabn<CR>


"let g:solarized_diffmode="high" "default value is normal
"let g:solarized_termcolors = &t_Co
"let g:solarized_termtrans = 1
"let g:solarized_visibility= "high"
"colorscheme solarized

"call togglebg#map("<F5>")
set t_ut=
set background=dark

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

set t_Co=256
colorscheme distinguished
hi TabLineSel ctermbg=DarkGray

"disable bg color to enable transparency
hi Normal ctermbg=none
hi NonText ctermbg=none

"show column in cursor
set cursorline cursorcolumn

"Leader-s to search and replace word under cursor
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

"Syntastic stuff
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_enable_highlighting = 0
"let g:syntastic_auto_jump = 2
