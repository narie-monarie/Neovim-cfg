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
 
 -- darkPlus --
 use 'martinsione/darkplus.nvim'
 
 -- Tokyo Night --
 use 'folke/tokyonight.nvim'
 
 -- using bufferline --
 use {
 'akinsho/bufferline.nvim', tag = "v2.*", 
 requires = 'kyazdani42/nvim-web-devicons'
 }
 vim.opt.termguicolors = true
 require("bufferline").setup{}
 
 -- Lua Line --
 use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
 }
 
 -- ClangFormatAutoEnable
 use 'octol/vim-cpp-enhanced-highlight'
 use 'rhysd/vim-clang-format'
 use 'bfrg/vim-cpp-modern'
 vim.cmd([[
  augroup ClangFormatAutoEnable
    autocmd!
    autocmd FileType cpp ClangFormatAutoEnable
  augroup end
 ]])
 
 -- Ruby --
 use 'vim-ruby/vim-ruby'
 use 'tpope/vim-rails'
 
 -- C# --
 use 'OmniSharp/omnisharp-vim'
 use 'dense-analysis/ale'
 
 -- TreeSitter --
 use {
 'nvim-treesitter/nvim-treesitter'
 }
 
 -- FZF --
 use {'junegunn/fzf', run = ':call fzf#install()' }
 use {'junegunn/fzf.vim', depends = 'junegunn/fzf' }
 vim.cmd([[nmap <space>f <Cmd>FZF<CR>]])
 
 -- wakatime --
 use 'wakatime/vim-wakatime'
 
 -- BlankLine --
 use "lukas-reineke/indent-blankline.nvim"
 
 -- Basic cmds --
 vim.wo.fillchars='eob: '
 vim.opt.number = true
 vim.opt.relativenumber = true
 vim.o.background = "dark"
 vim.opt.list = true
 
 -- Telescope --
  use { -- nice interface for LSP functions (among other things)
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
   vim.cmd([[nmap <space>t <Cmd>Telescope<CR>]])
  
  -- autocompletion framework --
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  
 -- Example config in Luae
 vim.g.tokyonight_style = "night"
 vim.g.tokyonight_italic_functions = true
 vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
 vim.g.OmniSharp_server_stdio = 1
-- Change the "hint" color to the "orange" color, and make the "error" color bright red
 vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
 vim.cmd([[colorscheme tokyonight]])
end)
