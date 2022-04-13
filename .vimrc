autocmd VimEnter * source ~/.vimrc

call plug#begin()

""Looks
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='fairyfloss'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
Plug 'prettier/vim-prettier'
Plug 'yuttie/comfortable-motion.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'kyoz/purify', { 'rtp': 'vim'  }
Plug 'srcery-colors/srcery-vim'
Plug 'mhartington/oceanic-next'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'cocopon/iceberg.vim'
Plug 'nanotech/jellybeans.vim'

""Languages
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'cohama/lexima.vim'
Plug 'scrooloose/nerdcommenter'

""Indentation
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '│'

""NerdTree
Plug 'scrooloose/nerdtree'
let NERDTreeMinimalUI=1

""Python Formatter
Plug 'psf/black'
Plug 'numirias/semshi'

call plug#end()

syntax enable
set fillchars=eob:\ 


"set background=dark
"colorscheme OceanicNext
colorscheme jellybeans


""Fat cursor to thin Cursor
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
        \ if v:insertmode == 'i' |
        \   silent execute '!echo -ne "\e[6 q"' | redraw! |
        \ elseif v:insertmode == 'r' |
        \   silent execute '!echo -ne "\e[4 q"' | redraw! |
        \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

""Enter complete
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"

""Open FZF
nmap <space>f <Cmd>FZF<CR>

""Autosave
nmap <space>w <Cmd>w<CR>


""Open NERDtree
nmap <space>o <Cmd>NERDTree<CR>
nmap <space>c <Cmd>NERDTreeClose<CR>



""Change Buffer Tabs
map <F8> <Cmd>bprevious<CR>
map <F9> <Cmd>bnext<CR>


hi cursorLine cterm=NONE gui=NONE

augroup nerdtreehidetirslashes
  autocmd!
  autocmd FileType nerdtree syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
augroup END

augroup nerdtree
  autocmd!
  autocmd FileType nerdtree syntax clear NERDTreeFlags
  autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
  autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
  autocmd FileType nerdtree setlocal conceallevel=3
  autocmd FileType nerdtree setlocal concealcursor=nvic
augroup END

if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif
