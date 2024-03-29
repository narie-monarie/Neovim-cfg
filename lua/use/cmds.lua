vim.cmd([[
  augroup Templates
    autocmd!
      autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c
      autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
      autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
      autocmd BufNewFile *.java 0r ~/.vim/templates/skeleton.java
  augroup end
  
  augroup ClangFormatAutoEnable
    autocmd!
    autocmd FileType cpp ClangFormatAutoEnable
  augroup end
  
 nmap <space>f <Cmd>Telescope find_files<CR>
]])
