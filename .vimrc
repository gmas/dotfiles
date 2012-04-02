au BufNewFile,BufRead *.ctp setfiletype php             
autocmd BufRead,BufNewFile *.js setlocal ft=javascript
set t_Co=256
set number

filetype plugin on
syntax on
"map arrow keys
map <Esc>[B <Down>
map <Esc>[A <Up>
set pastetoggle=<F2>
set smartindent
set autoindent
set copyindent
set shiftround
set smartcase
"set hlsearch

"tabs
set smarttab
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2

set pastetoggle=<F2>

nnoremap ; :

map <C-\> :w<CR> :!php -l %<CR>
map ,t <Esc>:tabnew<CR>

map <C-n> :tabn<CR>
map <C-p> :tabp<CR>

function! NewCommandT()
:tabnew
:CommandT
endfunction

map <C-t> :call NewCommandT()<CR>
"map <C-t> :TagmaTasks<CR> not needed, use \tt

"highlight SpecialKey guifg=#4a4a59
"highlight NonText guifg=#4a4a59
"highlight NonText guibg=#1a1a1a
set visualbell t_vb=
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/


call pathogen#infect()

"colorscheme jellybeans
let g:solarized_diffmode="high" "default value is normal
syntax enable

set background=dark
let g:solarized_termcolors = &t_Co
let g:solarized_termtrans = 1
colorscheme solarized
call togglebg#map("<F5>")


"set list
"set listchars=tab:¬\ ,trail:▪

"let g:solarized_termcolors=256
"let g:solarized_visibility="low"
"colorscheme solarized
"let @l='s/\<var_export\>(\s\+\(\D\+\)\s\+),\s\+PHP_EOL/ \1)/g'
inoremap <silent> <buffer> <C-D> <ESC>:call Toggle_task_status()<CR>i
noremap <silent> <buffer> <C-D> :call Toggle_task_status()<CR>
