local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "use.lsp.configs"
require("use.lsp.handlers").setup()
require "use.lsp.null-ls"
