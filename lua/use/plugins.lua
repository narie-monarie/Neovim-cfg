local fn = vim.fn


-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)

 -- Packer can manage itself --
  use 'wbthomason/packer.nvim'
  
 -- coc nvim --
 use {'neoclide/coc.nvim', branch = 'release'}

 -- LSP --
 use 'neovim/nvim-lspconfig'
 use 'williamboman/nvim-lsp-installer'
 use 'jose-elias-alvarez/null-ls.nvim'

 -- AutoPairs --
 use 'jiangmiao/auto-pairs'
 
 -- Highlight Enclosing Tags
 use 'valloric/matchtagalways'

 --AutoClose Tags HTMl
 use 'alvan/vim-closetag'


 --COLORSCHEMES
 -- Oceanic Next --
 use 'mhartington/oceanic-next' 
 -- Challenger Deep
 use 'challenger-deep-theme/vim'
 -- deus
 use 'ajmwagar/vim-deus'
 -- hybrid
 use 'w0ng/vim-hybrid'
 -- molokai
 use 'tomasr/molokai'
 -- srcery
 use 'srcery-colors/srcery-vim'


 -- rainbow parentheses--
 use 'luochen1990/rainbow'
 
 -- bufferline
 use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
 require("bufferline").setup{}

 --Feline--
 use 'windwp/windline.nvim'
 
 -- ClangFormatAutoEnable
 use 'octol/vim-cpp-enhanced-highlight'
 use 'rhysd/vim-clang-format'
 use 'bfrg/vim-cpp-modern'

 -- Ruby --
 use 'vim-ruby/vim-ruby'
 use 'tpope/vim-rails'
 
 -- G0 --
 use 'fatih/vim-go'

 -- TreeSitter --
 use 'nvim-treesitter/nvim-treesitter'
 
 --Telescope FZF --
 use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}
 use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }


 -- wakatime --
 use 'wakatime/vim-wakatime'
 
 -- cmp plugins
 use "hrsh7th/nvim-cmp" -- The completion plugin
 use "hrsh7th/cmp-buffer"  -- buffer completions
 use "hrsh7th/cmp-path" -- path completions
 use "saadparwaiz1/cmp_luasnip" -- snippet completions
 use "hrsh7th/cmp-nvim-lsp"
 use "hrsh7th/cmp-nvim-lua"

 -- snippets
 use({ "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" }) --snippet engine
 use({ "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" }) -- a bunch of snippets to use
	
	
 -- BlankLine --
 use "lukas-reineke/indent-blankline.nvim"
 
 -- Basic cmds --
 vim.opt.termguicolors = true
 vim.wo.fillchars='eob: '
 vim.opt.number = true
 vim.opt.relativenumber = true
 vim.o.background = "dark"
 vim.opt.list = true
 
 
 vim.cmd([[colorscheme srcery]])
end)
