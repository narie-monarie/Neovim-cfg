require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "go", "cpp" },
  sync_install = false,
  ignore_install = { "" },

  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  
}
