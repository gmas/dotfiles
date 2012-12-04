map <C-\> :!ruby -cw %<CR>
highlight OverLength ctermbg=black ctermfg=red guibg=#C66635
match OverLength /\%81v.\+/
