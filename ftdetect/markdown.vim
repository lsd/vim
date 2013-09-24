augroup filetypedetect
"  set noignorecase
  "autocmd BufNew,BufNewFile,BufRead *.txt,*.text,*.md,*.mkd,*.markdown :set filetype = 'markdown'
augroup END
