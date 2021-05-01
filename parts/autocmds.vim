" source config on file save {{{
augroup source_config
  autocmd!
  autocmd BufWritePost ~/.vimrc nested source $MYVIMRC
augroup END
" }}}

" vimscript file settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" remove trailing whitespaces on save{{{
augroup remove_trailing_whitespaces
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
augroup END
"}}}

" augroup create_folder_on_save
"   autocmd!
"   autocmd BufWritePre *.js echom(expand("%:h"))
" augroup END
