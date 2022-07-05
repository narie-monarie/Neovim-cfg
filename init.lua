vim.cmd [[packadd packer.nvim]]

require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'tokyonight'
    -- ... your lualine config
  }
}

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

return require('packer').startup(function()
 -- Packer can manage itself --
  use 'wbthomason/packer.nvim'
  
 -- coc nvim --
 use {'neoclide/coc.nvim', branch = 'release'}
 
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
 -- TreeSitter --
 use 'nvim-treesitter/nvim-treesitter'
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
 vim.opt.listchars:append("space:⋅")
 vim.cmd([[colorscheme tokyonight]])

end)
