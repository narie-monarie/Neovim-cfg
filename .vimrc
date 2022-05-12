autocmd FileType apache setlocal commentstring=#\ %s
set number
set relativenumber
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum""]]
set termguicolors
call plug#begin()

""Looks
Plug 'itchyny/lightline.vim'
    let g:lightline = {
          \ 'colorscheme': 'spaceduck',
          \ }
set laststatus=2
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
Plug 'yuttie/comfortable-motion.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'kyoz/purify', { 'rtp': 'vim'  }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main'  }
Plug 'ghifarit53/tokyonight-vim'
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'ghifarit53/tokyonight-vim'
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
Plug 'ayu-theme/ayu-vim'
" enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"
Plug 'pineapplegiant/spaceduck', { 'branch': 'main'  }

""Languages
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'cohama/lexima.vim'
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim', { 'as': 'dracula'  }
Plug 'omnisharp/omnisharp-vim'

""Indentation
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '│'

call plug#end()

syntax enable
set fillchars=eob:\ 


"set background=dark
colorscheme ayu

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
