set number
set relativenumber
set shortmess=I
" Important!!
if has('termguicolors')
	let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
	  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
	  set termguicolors
endif
" The configuration options should
"be placed before `colorscheme edge`.
let g:edge_style = 'aura'
let g:edge_better_performance = 1"
call plug#begin()

""Looks
Plug 'glepnir/spaceline.vim'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
set laststatus=2
let g:spaceline_seperate_style = 'none'
let g:spaceline_colorscheme = 'dracula'

""smooth motion"
Plug 'yuttie/comfortable-motion.vim'

"Dev Icons
Plug 'ryanoasis/vim-devicons'

"fzf	
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }

"colorscheme
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'sainnhe/edge'
Plug 'nanotech/jellybeans.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'jacoborus/tender.vim'
Plug 'tomasiser/vim-code-dark'
let g:codedark_italics = 1

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
Plug 'mattn/emmet-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
Plug 'rhysd/vim-clang-format'
autocmd FileType c ClangFormatAutoEnable
Plug 'bfrg/vim-cpp-modern'
Plug 'alvan/vim-closetag'
let g:cpp_function_highlight = 0
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'valloric/matchtagalways'
let g:mta_filetypes = {
	    \ 'html' : 1,
	    \ 'xhtml' : 1,
	    \ 'xml' : 1,
	    \ 'jinja' : 1,
	    \}
"pretier Formatter
Plug 'machakann/vim-highlightedyank'
Plug 'jaxbot/semantic-highlight.vim'
let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,16,125,124,19]
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mapkts/enwise'

"AutoCompletions
Plug 'racer-rust/vim-racer'
Plug 'phildawes/racer'
Plug 'vim-scripts/HTML-AutoCloseTag'

"Indentation
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '│'

"wakatime
Plug 'wakatime/vim-wakatime'

call plug#end()

"set mouse=a
syntax enable

set background=dark
set fillchars=eob:\ 
colorscheme edge
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

" format the file
noremap <F3> :%!astyle<CR>
noremap <F4> :CocCommand prettier.forceFormatDocument<CR>
"Auto Start
autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c
autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
autocmd BufNewFile *.java 0r ~/.vim/templates/skeleton.java
