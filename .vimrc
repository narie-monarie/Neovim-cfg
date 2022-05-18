syntax on
let &fillchars ..= ',eob: '
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set relativenumber
set nu!
call plug#begin()
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

"LightLine
Plug 'itchyny/lightline.vim'
    let g:lightline = {
          \ 'colorscheme': 'gruvbox',
          \ }
set laststatus=2

"Rainbow Parentheses
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

"Vim Motion
Plug 'yuttie/comfortable-motion.vim'

"Vim Devicons
Plug 'ryanoasis/vim-devicons'

"autoclose
Plug 'townk/vim-autoclose'

"HTML close tag
Plug 'alvan/vim-closetag'
let g:closetag_regions = {
	    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

"Jsx
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

"gruvbox
Plug 'morhetz/gruvbox'
let g:gruvbox_italic=1

"linters
Plug 'w0rp/ale'
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_fix_on_save = 1
call plug#end()

set background=dark
colorscheme gruvbox

"Open FZF
nmap <space>f <Cmd>FZF<CR>
