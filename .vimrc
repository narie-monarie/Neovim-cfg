set number
set relativenumber
autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c
autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
call plug#begin()

""Looks
Plug 'itchyny/lightline.vim'
let g:lightline = {
	      \ 'colorscheme': 'gruvbox',
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
Plug 'knop-01/tortus'

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

"Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 0

"Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

"Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

"Put all standard C and C++ keywords under Vim's highlight group 'Statement'
"(affects both C and C++ files)
let g:cpp_simple_highlight = 1

"pretier Formatter
Plug 'prettier/vim-prettier', {
			\ 'do': 'npm install',
			\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] 
			\}
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync

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
syntax on

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

" format the file
noremap <F3> :%!astyle<CR> 
