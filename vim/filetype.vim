augroup filetypedetect
  au BufRead,BufNewFile *.rb setfiletype ruby
  au BufRead,BufNewFile *.go setfiletype go
  au BufRead,BufNewFile *.html setfiletype html
  au BufRead,BufNewFile *.slim setfiletype slim
  au BufRead,BufNewFile *.haml setfiletype haml
augroup END
