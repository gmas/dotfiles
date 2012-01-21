au BufNewFile,BufRead *.ctp setfiletype php
autocmd BufRead,BufNewFile *.js setlocal ft=javascript
set t_Co=256
set number

filetype plugin on
syntax on
colorscheme jellybeans
set pastetoggle=<F2>
set nonu
set smartindent
set autoindent
set copyindent
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
"set expandtab

set list
set listchars=tab:▸\ ,trail:▪
"highlight SpecialKey guifg=#4a4a59
"highlight NonText guifg=#4a4a59
"highlight NonText guibg=#1a1a1a
set visualbell t_vb=
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
call pathogen#infect()

"let @l='s/\<var_export\>(\s\+\(\D\+\)\s\+),\s\+PHP_EOL/ \1)/g'
