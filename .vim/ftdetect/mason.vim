if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufNewFile,BufRead * if getline(1) =~'^%#\|^<%\|^% #' | setf mason | endif
augroup END
