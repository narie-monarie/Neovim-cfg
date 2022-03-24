set relativenumber
set nu!
syntax enable
call plug#begin()

""Looks
Plug 'vim-airline/vim-airline'
Plug'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='distinguished'
Plug 'kien/rainbow_parentheses.vim'
Plug 'prettier/vim-prettier'
Plug 'yuttie/comfortable-motion.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'nlknguyen/papercolor-theme'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }



""Languages
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'valloric/youcompleteme'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:jedi#auto_close_doc = 0
Plug 'cohama/lexima.vim'
Plug 'weirongxu/coc-explorer'
Plug 'scrooloose/nerdcommenter'

""Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'


""Notification
Plug 'kristijanhusak/vim-simple-notifications'

call plug#end()
set background=dark
colorscheme PaperColor

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


""Explorer
nmap <space>e <Cmd>CocCommand explorer<CR>

""Open FZF
nmap <space>f <Cmd>FZF<CR>

""Autosave
nmap <space>w <Cmd>w<CR>

""Change Buffer Tabs
map <F8> <Cmd>bprevious<CR>
map <F9> <Cmd>bnext<CR>

call notifications#info(['Main Config', 'Welcome Back to Vim! Happy Coding'])

autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
