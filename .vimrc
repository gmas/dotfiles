au BufNewFile,BufRead *.ctp setfiletype php
filetype plugin on
colorscheme evening
set pastetoggle=<F2>
set nonu
set smartindent
set autoindent
set copyindent
set ts=4
set shiftwidth=4
set shiftround
set smartcase
set smarttab
set pastetoggle=<F2>

nnoremap ; :

map <C-\> :!php -l %<CR>
map ,t <Esc>:tabnew<CR>

map <C-n> :tabn<CR>
map <C-p> :tabp<CR>
map <C-t> :tabnew<CR>

set tabstop=4
set shiftwidth=4
