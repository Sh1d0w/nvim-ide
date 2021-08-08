" autocmd BufWritePost *.php silent! call CocAction('format')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType php setl formatexpr=CocAction('format')
augroup end
