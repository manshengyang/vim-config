require("mason").setup({})
require("mason-lspconfig").setup({})

require("lsp")

require("cmp_complete")

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

require("copilot").setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "<space>r",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<C-l>",
      accept_word = false,
      accept_line = false,
      next = "<C-j>",
      prev = "<C-k>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = true,
    markdown = true,
    help = false,
    gitcommit = false,
    gitrebase = false,
    ["."] = false,
  },
})

require("CopilotChat.integrations.cmp").setup()
require("CopilotChat").setup({
  debug = false,
  mappings = {
    complete = {
      insert = '',
    },
  },
})
