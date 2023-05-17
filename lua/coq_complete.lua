vim.g.coq_settings = {
  auto_start = "shut-up",
  keymap = {
    jump_to_mark =  "<c-k>"
  }
}

local coq = require "coq"
require("coq_3p") {
  { src = "copilot", short_name = "COP", accept_key = "<c-f>" }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
lsp.pyright.setup(coq.lsp_ensure_capabilities({
  capabilities = capabilities,
  on_attach = on_attach
}))

lsp.clangd.setup(coq.lsp_ensure_capabilities())
