let g:syntastic_ruby_checkers = ['mri']
map <C-\> :!rubocop  %<CR>
highlight OverLength ctermbg=black ctermfg=red guibg=#C66635
match OverLength /\%81v.\+/
" Automatic formatting
autocmd BufWritePre *.rb :%s/\s\+$//e
