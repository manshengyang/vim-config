require("mason").setup({})
require("mason-lspconfig").setup({})

require("lsp")

require("cmp_complete")

require("packer_plugins")

require("lualine").setup({
  options = {
    theme = "powerline"
  },
  sections = {
    lualine_c = {
      { "filename", file_status=true, path=1 }
    },
  },
})
