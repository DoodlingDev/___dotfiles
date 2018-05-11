augroup insertLeave
  autocmd!
  autocmd InsertEnter * hi CursorLine guibg=#000000
  autocmd InsertEnter * hi CursorColumn guibg=#000000
  autocmd InsertLeave * hi CursorLine guibg=DarkSlateGray
  autocmd InsertLeave * hi CursorColumn guibg=DarkSlateGray
  autocmd BufWritePre * :%s/\s\+$//e    " remove trailing whitespace

  autocmd WinLeave * setlocal nocursorline
  autocmd WinLeave * setlocal nocursorcolumn
  autocmd WinEnter * setlocal cursorline
  autocmd WinEnter * setlocal cursorcolumn

  autocmd FileType css,scss setlocal foldmethod=marker foldmarker={,}
augroup END

" Filetype {{{
filetype on
augroup vimrcEx
  autocmd!
  filetype plugin indent on
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.{jscs,jshint,eslint} set filetype=json
  autocmd BufRead,BufNewFile *.{jsx,es6,js} set filetype=javascript.jsx
  autocmd BufRead,BufNewFile *.spec.js set filetype=javascript.jsx
  autocmd BufRead,BufNewFile *.slim set filetype=slim
  autocmd BufRead,BufNewFile *.rb set filetype=ruby
  autocmd BufRead,BufNewFile *.scss set filetype=scss.css
  autocmd BufRead,BufNewFile *.txt set filetype=markdown
augroup END

augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType javascript setlocal omnifunc=tern#Complete
augroup END
" }}}
