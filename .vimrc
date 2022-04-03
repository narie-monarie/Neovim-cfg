set relativenumber
set nu!
syntax enable
set fillchars=eob:\ 
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

call plug#begin()

""Looks
Plug 'vim-airline/vim-airline'
Plug'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='fairyfloss'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
Plug 'prettier/vim-prettier'
Plug 'yuttie/comfortable-motion.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'nlknguyen/papercolor-theme'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'kyoz/purify', { 'rtp': 'vim'  }


""Languages
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'cohama/lexima.vim'
Plug 'scrooloose/nerdcommenter'

""Notification
Plug 'kristijanhusak/vim-simple-notifications'

""Indentation
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '│'

""NerdTree
Plug 'scrooloose/nerdtree'

""Python Formatter
Plug 'psf/black'


call plug#end()
set background=dark
colorscheme PaperColor

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

""Change Buffer Tabs
map <F8> <Cmd>bprevious<CR>
map <F9> <Cmd>bnext<CR>

call notifications#info(['😀', 'Welcome!!'])

