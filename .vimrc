set number
set relativenumber

call plug#begin()

""Looks and colorSchemes
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set laststatus=2
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
Plug 'yuttie/comfortable-motion.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'kyoz/purify', { 'rtp': 'vim'  }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'flazz/vim-colorschemes'

""Languages
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }

""Indentation
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '│'

call plug#end()

syntax enable
set fillchars=eob:\ 


"set background=dark
colorscheme purify

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

