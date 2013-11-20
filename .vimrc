call pathogen#infect()
syntax on
filetype plugin indent on

nnoremap ; :
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

map ,t <Esc>:tabnew<CR>:NERDTree<CR>

map <C-n> :tabn<CR>
map <C-p> :tabp<CR>

let g:solarized_diffmode="high" "default value is normal
set background=dark
let g:solarized_termcolors = &t_Co
let g:solarized_termtrans = 1
let g:solarized_visibility= "high"
colorscheme solarized
call togglebg#map("<F5>")

set regexpengine=1
