let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_ruby_exec = '/Users/gmas/.rubies/ruby-2.2.2/bin/ruby'
let g:syntastic_ruby_mri_exec = '/Users/gmas/.rubies/ruby-2.2.2/bin/ruby'
map <C-\> :!rubocop  %<CR>
highlight OverLength ctermbg=black ctermfg=red guibg=#C66635
match OverLength /\%81v.\+/
" Automatic formatting
autocmd BufWritePre *.rb :%s/\s\+$//e
