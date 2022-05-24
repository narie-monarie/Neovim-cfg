set number
set relativenumber
call plug#begin()

""Looks
Plug 'itchyny/lightline.vim'
let g:lightline = {
	      \ 'colorscheme': 'icebergDark',
      \ }
set laststatus=2
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

""smooth motion"
Plug 'yuttie/comfortable-motion.vim'

"Dev Icons
Plug 'ryanoasis/vim-devicons'

"fzf	
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }

"colorscheme
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'

""braces
Plug 'jiangmiao/auto-pairs'

"css color
Plug 'ap/vim-css-color'

"git
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'

""Languages
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'rust-lang/rust.vim'

"AutoCompletions
Plug 'racer-rust/vim-racer'
Plug 'phildawes/racer'
Plug 'valloric/matchtagalways'
Plug 'vim-scripts/HTML-AutoCloseTag'

"Indentation
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '│'

call plug#end()

syntax enable
set fillchars=eob:\ 

set background=dark
colorscheme gruvbox

"Enter complete
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"


""Open FZF
nmap <space>f <Cmd>FZF<CR>


""Autosave
nmap <space>w <Cmd>w<CR>


" This can conflict with the default mappings provided by snipmate.
" " See the after directory in .vim/bundle/snipMate/after
function! SuperCleverTab()
	if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
		return "\<Tab>"
	elseif pumvisible()
		return "\<c-n>"
	else
		if &omnifunc != ''
			return "\<C-X>\<C-O>"
		elseif &dictionary!= ''
			return "\<C-K>"
		else
			return"\<C-N>"
		endif
	endif
endfunction
inoremap <Tab> <C-R>=SuperCleverTab()<cr>
