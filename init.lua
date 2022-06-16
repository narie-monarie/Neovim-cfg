-- can be a global or local variable, doesn't matter.
-- name can be anything, eg. you can use `p` or `P` if
-- you prefer it to be something shorter.
Plug = require('neopm')
--looks
Plug 'glepnir/spaceline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim'
Plug 'sainnhe/edge'
Plug 'nanotech/jellybeans.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'jacoborus/tender.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'luochen1990/rainbow'

--Dev Icons
Plug 'ryanoasis/vim-devicons'

--fzf	
Plug 'junegunn/fzf'

--braces
Plug 'jiangmiao/auto-pairs'
Plug 'glepnir/lspsaga.nvim'

--css color
Plug 'ap/vim-css-color'

--git
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'

--Languages
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'mattn/emmet-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

--html and shit
Plug 'valloric/matchtagalways'

--AutoCompletions
Plug 'racer-rust/vim-racer'
Plug 'phildawes/racer'
Plug 'vim-scripts/HTML-AutoCloseTag'

--Wakatime
Plug 'wakatime/vim-wakatime'

Plug.load()
vim.wo.fillchars='eob: '
vim.cmd([[set background=dark termguicolors number relativenumber]])
vim.cmd([[colorscheme edge]])
vim.cmd([[let g:spaceline_seperate_style = 'none']])
vim.cmd([[let g:spaceline_colorscheme = 'dracula']])
vim.cmd([[let g:rainbow_active = 1]])
vim.cmd([[nmap <space>f <Cmd>FZF<CR>]])
vim.cmd([[if has('termguicolors')
	let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
	  set termguicolors
endif]])
vim.cmd([[inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"]])
vim.cmd([[function! SuperCleverTab()
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
inoremap <Tab> <C-R>=SuperCleverTab()<cr>]])

